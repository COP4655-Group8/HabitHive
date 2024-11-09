import Foundation
import FirebaseAuth

@Observable
class AuthManager {
    
   var user: User?
    
   var isMocked: Bool = false
   
   var isSignedIn: Bool = false
   
   var userEmail: String? {
       
       isMocked ? "test@email.com" : user?.email
       
   }
   
   private var handle: AuthStateDidChangeListenerHandle?
    
    init(isMocked: Bool = false) {

           self.isMocked = isMocked

        }
    
   init() {
       handle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
           self?.user = user
           self?.isSignedIn = user != nil
       }
   }
   
   deinit {
       if let handle = handle {
           Auth.auth().removeStateDidChangeListener(handle)
       }
   }
    
    func signUp(email: String, password: String) {
        Task {
            do {
                let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
                user = authResult.user // <-- Set the user
            } catch {
                print(error)
            }
        }

    }

    func signIn(email: String, password: String) {
        Task {
            do {
                let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
                user = authResult.user // <-- Set the user
            } catch {
                print(error)
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            user = nil
        } catch {
            print(error)
        }
    }
}
