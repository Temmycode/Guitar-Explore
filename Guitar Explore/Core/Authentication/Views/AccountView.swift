//
//  SwiftUIView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 24/03/2024.
//

import SwiftUI
import GoogleSignInSwift

struct AccountView: View {
    @Environment(AuthenticationViewModel.self) var authViewModel
    @State private var hapticFeedBackEnabled = false
    @State private var colorScheme: AppColorScheme = .system
    
    var body: some View {
        ZStack {
            accountTiles
            
            loadingIndicator
        }
    }
    
    @ViewBuilder
    var accountTiles: some View {
        if authViewModel.isLoading {
            List {
                Section("Account") {
                    AccountListTile(icon: "envelope", title: "Email")
                    AccountListTile(icon: "person", title: "Username")
                }
                
                Section("App") {
                    Picker("Color Scheme", systemImage: "sun.max", selection: $colorScheme) {
                        ForEach(AppColorScheme.allCases, id: \.self) { scheme in
                            Text(scheme.rawValue)
                        }
                    }
                    .customFont(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
                    
                    Toggle(isOn: $hapticFeedBackEnabled) {
                        Label("Haptics", systemImage: "waveform")
                    }
                    .customFont(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
                }
                
                Section("About") {
                    Button(action: {}){
                        AccountListTile(icon: "lock", title: "Privacy Policy")
                    }
                    
                    Button(action: {}){
                        AccountListTile(icon: "book.closed", title: "Terms of Use")
                    }
                    
                    Button(action: {}){
                        AccountListTile(icon: "number.circle", title: "App Version", subtitle: "0.01")
                    }
                }
                authenticationButtons
            }
            .blur(radius: 2.0)
        } else {
            List {
                Section("Account") {
                    AccountListTile(icon: "envelope", title: "Email", subtitle: authViewModel.user?.email)
                    AccountListTile(icon: "person", title: "Username", subtitle: authViewModel.user?.username)
                }
                
                
                Section("App") {
                    Picker("Color Scheme", systemImage: "sun.max", selection: $colorScheme) {
                        ForEach(AppColorScheme.allCases, id: \.self) { scheme in
                            Text(scheme.rawValue)
                        }
                    }
                    .customFont(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
                    
                    Toggle(isOn: $hapticFeedBackEnabled) {
                        Label("Haptics", systemImage: "waveform")
                    }
                    .customFont(.headline)
                    .fontWeight(.regular)
                    .foregroundStyle(.black)
                }
                
                Section("About") {
                    Button(action: {}){
                        AccountListTile(icon: "lock", title: "Privacy Policy")
                    }
                    
                    Button(action: {}){
                        AccountListTile(icon: "book.closed", title: "Terms of Use")
                    }
                    
                    Button(action: {}){
                        AccountListTile(icon: "number.circle", title: "App Version", subtitle: "0.01")
                    }
                }
                authenticationButtons
            }
        }
    }
    
    @ViewBuilder
    var authenticationButtons: some View {
        if authViewModel.isLoggedIn {
            Button(action: {}){
                Label("Sign out", systemImage: "rectangle.portrait.and.arrow.right")
                    .foregroundStyle(.red1)
                    .fontWeight(.medium)
            }
        } else {
            GoogleSignInButton(action: authViewModel.signinWithGoogle) // signin with google function
                .clipShape(.rect(cornerRadius: 0))
                .fontWeight(.medium)
        }
    }
    
    @ViewBuilder
    var loadingIndicator: some View {
        if authViewModel.isLoading {
            ProgressView()
                .scaleEffect(2.0)
        }
    }
}

#Preview {
    AccountView()
        .environment(AuthenticationViewModel())
}
