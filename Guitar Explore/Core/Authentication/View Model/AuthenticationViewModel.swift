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
    var isLoading: Bool = false
    
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
    
    func tokenSignIn(idToken: String) {
        guard let authData = try? JSONEncoder().encode(["id_token" : idToken]) else { return }
        
        let url = URL(string: "http://127.0.0.1:8000/google-signin")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: authData) { data, response, error in
            // user data should be returned here from the backend
        }
        
        task.resume()
    }
    
    func login(email: String, password: String) {
        // login multipart function
    }
    
    func signinWithGoogle() {
        GIDSignIn.sharedInstance.signIn(withPresenting: (UIApplication.shared.windows.first?.rootViewController)!) { signInResult, error in
            if error != nil {
            }
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            signInResult.user.refreshTokensIfNeeded { user, error in
                guard error == nil else { return }
                guard let user = user else { return }
                
                let idToken = user.idToken
                // Send ID token to backend (example below).
                guard let token = idToken?.tokenString else { return }
                self.tokenSignIn(idToken: token)
            }
        }
    }
}
