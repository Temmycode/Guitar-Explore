//
//  ContentView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 27/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .explore
    
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
    }
}

#Preview {
    ContentView()
}
