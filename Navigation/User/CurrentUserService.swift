import Foundation
import UIKit

class CurrentUserService: UserServiceProtocol {
   
    private var currentUser = User(
        userName: "Volostnov",
        userAvatar: UIImage(named: "pictureVolostnov") ?? UIImage(),
        userStatus: "Учиться, учиться и еще раз учиться!")
    
    
    func sendUser(userName: String) -> User? {
        
        guard userName == currentUser.userName else { return nil }
            return currentUser
        }  
}
