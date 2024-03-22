//
//  GoogleSignInMockView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 20/03/2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInMockView: View {
    @Environment(AuthenticationViewModel.self) var repository
    
    var body: some View {
        GoogleSignInButton(action: handleSignInButton)
            .padding()
    }
    
    func handleSignInButton() {
        
    }
}

#Preview {
    GoogleSignInMockView()
}
