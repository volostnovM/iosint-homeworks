//
//  ViewController.swift
//  AVFoundation_Audio
//
//  Created by Niki Pavlove on 18.02.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    private var player = AVAudioPlayer()
    private var currentTrack = 0
    private var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player.delegate = self
        setupPlayer()
        
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Queen", ofType: "mp3")!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    private func setupPlayer() {
        do {
            let audio = AudioModel.audios[currentTrack]
            artistLabel.text = "Автор: " + audio.author
            trackLabel.text = "Трек: " + audio.name
            
            guard let path = Bundle.main.path(forResource: audio.bundleName, ofType: audio.format) else { return }
            let url = URL(fileURLWithPath: path)
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }
        catch {
            artistLabel.text = error.localizedDescription
        }
    }
    
    private func setupProgressView() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            let audioTime = self.player.duration
            let currentAudioTIme = self.player.currentTime
            self.progressView.progress = Float(currentAudioTIme / audioTime)
        }
        timer.fire()
    }
    

    
    private func stopMusic() {
        if player.isPlaying {
            player.stop()
        }
        player.currentTime = 0
        timer.invalidate()
        progressView.progress = 0
    }
    
    private func playMusic() {
        player.play()
        setupProgressView()
    }
    
    private func nextAudio() {
        currentTrack = (currentTrack + 1)
        if currentTrack > AudioModel.audios.count - 1 {
            currentTrack = AudioModel.audios.count - 1
        }
        print(currentTrack)
        setupPlayer()
        playMusic()
    }
    
    private func backAudio() {
        currentTrack = (currentTrack - 1)
        if currentTrack < 0 {
            currentTrack = 0
        }
        print(currentTrack)
        setupPlayer()
        playMusic()
    }
    

    @IBAction func PlayButton(_ sender: Any) {
        playMusic()
    }
    
    @IBAction func StopButton(_ sender: Any) {
        stopMusic()
    }
    
    @IBAction func forwardButton(_ sender: UIButton) {
        nextAudio()
    }
    @IBAction func pauseButton(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            timer.invalidate()
        } else {
            print("Already paused")
        }
    }
    @IBAction func backButton(_ sender: UIButton) {
        backAudio()
    }
}

extension ViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            nextAudio()
        } else {
            print("Error")
        }
    }
}
