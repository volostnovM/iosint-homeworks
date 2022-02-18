//
//  VideoViewController.swift
//  AVFoundation_Audio
//
//  Created by TIS Developer on 18.02.2022.
//

import UIKit
import WebKit


class VideoViewController: UIViewController {
    
    private var videoWebView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.layer.cornerRadius = 20
        webView.clipsToBounds = true
        return webView
    }()
    
    private lazy var videoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
 
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayouts()
        
        videoTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: String(describing: VideoTableViewCell.self))
    }
    
    private func openVideo(from url: URL) {
        videoWebView.stopLoading()
        let request = URLRequest(url: url)
        videoWebView.load(request)
    }
    
}

extension VideoViewController {
    private func setupLayouts() {
        view.addSubview(videoTableView)
        view.addSubview(videoWebView)
        
        let constraints = [
            videoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            videoTableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            videoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            videoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            videoWebView.topAnchor.constraint(equalTo: videoTableView.bottomAnchor, constant: 12),
            videoWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            videoWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            videoWebView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}

extension VideoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let url = URL(string: VideoModel.videos[indexPath.row].urlString) else { return }
        openVideo(from: url)
    }
}

extension VideoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VideoModel.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VideoTableViewCell.self), for: indexPath) as? VideoTableViewCell
        guard let safeCell = cell else { return UITableViewCell() }
        safeCell.video = VideoModel.videos[indexPath.row]
        return safeCell
    }
    
    
}
