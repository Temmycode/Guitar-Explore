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
    var body: some Scene {
        WindowGroup {
            GoogleSignInMockView()
//            ContentView()
//                .onOpenURL { url in
//                    GIDSignIn
//                        .sharedInstance.handle(url)
//                }
        }
    }
}
