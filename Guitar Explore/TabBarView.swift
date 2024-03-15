//
//  TabBarView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentTab: Tabs
    
    var body: some View {
        HStack {
            ForEach(Tabs.allCases, id: \.self) { tab in
                Button {
                    withAnimation {
                        currentTab = tab
                    }
                } label: {
                    VStack(spacing: 1.0) {
                        Image(systemName: tab.icon(isActive: currentTab == tab))
                        Text(tab.rawValue)
                            .foregroundStyle(.white)
                            .customFont(.caption)
                            .fontWeight(.medium)
                    }
                }
                .foregroundStyle(.black)
                tab == Tabs.explore ? Spacer() : nil
            }
        } // this contains the items of each tab bar
        .padding(.horizontal, 75)
        .frame(maxWidth: .infinity)
        .frame(height: 51)
        .background(.brown1)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .overlay {
            RoundedRectangle(cornerRadius: 40)
                .stroke(.black, lineWidth: 2)
        }
        .background {
            RoundedRectangle(cornerRadius: 40)
                .shadow(color: .black, radius: 0, x: 2, y: 3)
        }
        
    }
}

#Preview {
    TabBarView(currentTab: .constant(Tabs.explore))
}


enum Tabs: String, CaseIterable {
    case explore = "Explore"
    case favourites = "Favourites"
    
    func icon(isActive: Bool) -> String {
        switch self {
        case .explore:
            return isActive ? "binoculars.fill" : "binoculars"
        case .favourites:
            return isActive ? "heart.fill" : "heart"
        }
    }
}
