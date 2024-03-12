//
//  TabBarView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentTab: Tab
    @State var tabs: [TabBar] = [
        TabBar(name: "Explore", image: "binoculars", activeImage: "binoculars.fill", tab: .explore),
        TabBar(name: "Favourites", image: "heart", activeImage: "heart.fill", tab: .favourites)
    ]
    
    var body: some View {
        HStack {
            ForEach(tabs) { tab in
                Button {
                    withAnimation {
                        currentTab = tab.tab
                    }
                } label: {
                    VStack(spacing: 1.0) {
                        Image(systemName: currentTab == tab.tab ? tab.activeImage : tab.image)
                        Text(tab.name)
                            .foregroundStyle(.white)
                            .customFont(.caption)
                            .fontWeight(.medium)
                    }
                }
                .foregroundStyle(.black)
                tab.tab == Tab.explore ? Spacer() : nil
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
    TabBarView(currentTab: .constant(Tab.explore))
}


struct TabBar: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var activeImage: String
    var tab: Tab
}

enum Tab {
    case explore
    case favourites
}
