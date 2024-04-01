//
//  Repository.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 20/03/2024.
//

import UIKit
import Observation
import GoogleSignIn

@Observable class AuthenticationViewModel {
    var isLoggedIn = false
    var isLoading = false
    var accessToken: String?
    var user: User?
    
    init() {
        getIsLoggedIn()
        getUserCache()
        getIsLoggedIn()
    }
    
    func signinWithGoogle() {
        GIDSignIn.sharedInstance.signIn(withPresenting: (UIApplication.shared.windows.first?.rootViewController)!) { signInResult, error in
            self.isLoading = true // initialize loading state
            if error != null {
                // handle errors
                return
            }
            guard let signInResult = signInResult else { return }
            
            signInResult.user.refreshTokensIfNeeded { user, error in
                guard error == nil else { return }
                guard let user = user else { return }
                
                if let token = user.idToken?.tokenString {
                    print(token)
                    self.tokenSignIn(idToken: token) {
                        self.cacheLoginState(true) // if all is said and true then log me in
                        self.isLoading = false // end loading state
                    }
                }
            }
        }
    }
    
    func tokenSignIn(idToken: String, completion: @escaping () -> Void) {
        guard let authData = try? JSONEncoder().encode(["id_token" : idToken]) else { return }
        
        let url = URL(string: "http://127.0.0.1:8000/google-signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: authData) { data, response, error in
            // user data should be returned here from the backend
            guard let data = data else { return }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedAuth = try decoder.decode(AuthModel.self, from: data)
                print(decodedAuth)
                self.user = decodedAuth.user // decode user data and set state to the class user
                self.cacheUserDetails(decodedAuth.user)
            } catch {
                print(error.localizedDescription)
            }
            
            completion() // complete the code through  a closure
        }
        
        task.resume()
    }
    
    func cacheUserDetails(_ user: User) {
        do {
            let encodedUserData = try JSONEncoder().encode(user)
            UserDefaults.standard.set(encodedUserData, forKey: "user")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getUserCache() {
        guard let encodedUserData = UserDefaults.standard.data(forKey: "user") else { return }
        do {
            let decodedUser = try JSONDecoder().decode(User.self, from: encodedUserData)
            self.user = decodedUser
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func cacheLoginState(_ loggedIn: Bool) {
        UserDefaults.standard.set(loggedIn, forKey: "isLoggedIn")
    }
    
    func getIsLoggedIn() {
        let loggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        self.isLoggedIn = loggedIn
    }
        
    func application(
        _ app: UIApplication,
        open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        
        // Handle other custom URL types.
        
        // If not handled by this app, return false.
        return false
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil {
                // Show the app's signed-out state.
            } else {
                // Show the app's signed-in state.
            }
        }
        return true
    }
}
