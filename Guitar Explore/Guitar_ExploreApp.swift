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
    /// The application should get all the last brand the user just entered and then save it in the AppStorage
    /// Then we'll get the value from AppStorage when the application is starting and we'll set it to that particular value
    @State private var authViewModel = AuthenticationViewModel()
    @State private var guitarViewModel = GuitarViewModel()
    
    var body: some Scene {
        WindowGroup {
            //            GoogleSignInMockView()
            //                .environment(repository)
            //                .onOpenURL { url in
            //                    GIDSignIn.sharedInstance.handle(url)
            //                }
            //                .onAppear {
            //                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            //                        // Check if `user` exists; otherwise, do something with `error`
            //                        //if user exists log user in again and send user to main screen
            //                        // else throw user to login screen
            //                    }
            //                }
            ContentView()
                .environment(authViewModel)
                .environment(guitarViewModel)
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
