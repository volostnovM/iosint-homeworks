import Foundation

class Checker: LoginViewControllerDelegate {

    static var shared: Checker = {
        let instance = Checker()
        return instance
    }()
    
    private init() {}
    
    private let loginUser = "Volostnov"
    private let pswdUser = "!QAZ2wsx"
    
    func checkLoginPassword(login: String, password: String) -> Bool {
        if (loginUser == login && pswdUser == password) {
            print(true)
            return true
        }
        else {
            print(false)
            return false
        }
    }
}


