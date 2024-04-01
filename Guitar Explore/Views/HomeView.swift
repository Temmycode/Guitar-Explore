//
//  HomeView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    @Environment(AuthenticationViewModel.self) private var authViewModel
    @Environment(GuitarViewModel.self) private var guitarViewModel
    @State private var activeBrand = 0
    @State private var accountSheetOpened = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading, spacing: 0.0) {
                    // MARK: APP BAR
                    appBar
                    
                    ContinueExploring(brand: guitarViewModel.lastExploredBrand)
                        .customFont(.body)
                        .fontWeight(.medium)
                        .padding(.bottom, 4)
                        .padding(.horizontal, 16)
                    
                    // MARK: BRAND CARDS
                    brandSCrollableCards
                }
                .padding(.top, 15)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(edges: .bottom)
            }
            .background(.background1)
            .frame(maxHeight: .infinity)
        }
    }
    
    var appBar: some View {
        HStack(spacing: 2) {
            VStack(alignment: .leading) {
                if authViewModel.user != nil {
                    Text("Welcome Back")
                        .fontWeight(.light)
                } else {
                    Text("Welcome To Gutiar Explore")
                        .fontWeight(.medium)
                }
                
                if let user = authViewModel.user {
                    Text(user.username)
                        .fontWeight(.bold)
                }
            }
            .customFont(.body)
            
            Spacer()
            Avatar(imageUrl: authViewModel.user?.profilePicture)
                .onTapGesture {
                    accountSheetOpened.toggle()
                }
                .sheet(isPresented: $accountSheetOpened) {
                    NavigationStack {
                        AccountView()
                            .navigationTitle("Account")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                Button(action: { accountSheetOpened = false }) {
                                    Text("Close")
                                }
                            }
                    }
                }
        }
        .padding(.bottom, 40)
        .padding(.horizontal, 16)
    }
    
    var brandSCrollableCards: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(brands) { brand in
                    BrandCard(brand: brand)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                .scaleEffect(x: 1, y: phase.isIdentity ? 1.0 : 0.85)
                        }
                }
            }
            .tabViewStyle(.page)
            .scrollTargetLayout()
        }
        .contentMargins(18, for: .scrollContent)
        .scrollTargetBehavior(.paging)
    }
}

#Preview {
    HomeView()
        .environment(AuthenticationViewModel())
        .environment(GuitarViewModel())
}
