//
//  Guitar_ExploreApp.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 27/02/2024.
//

import SwiftUI
import GoogleSignIn

@main
struct Guitar_ExploreApp: App {
    @State private var repository = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            GoogleSignInMockView()
                .environment(repository)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                        //if user exists log user in again and send user to main screen
                        // else throw user to login screen
                    }
                }
            //            ContentView()
            //                .onOpenURL { url in
            //                    GIDSignIn
            //                        .sharedInstance.handle(url)
            //                }
        }
    }
}
