//
//  ContentView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstOpen") var isFirstOpen: Bool = true
    @State private var showOnboardingSheet = false
    @State private var currentTab: Tabs = .explore
    
    var body: some View {
        ZStack {
            switch currentTab {
            case .explore:
                HomeView()
            case .favourites:
                FavouriteView()
            }
            
            TabBarView(currentTab: $currentTab)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.horizontal, 16)
                .padding(.bottom, 15)
        }
        .sheet(isPresented: $showOnboardingSheet) {
            OnboardingView(showOnboardingSheet: $showOnboardingSheet)
        }
        .onAppear {
            if isFirstOpen {
                showOnboardingSheet = true
            }
        }
    }
}

#Preview {
    ContentView()
}
