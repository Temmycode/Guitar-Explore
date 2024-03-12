//
//  HomeView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var activeBrand = 0
    @State private var accountSheetOpened = false
    
    var body: some View {
        ZStack {
//            Color.background1.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0.0) {
                // MARK: APP BAR
                HStack {
                    Image("App Logo")
                    Spacer()
                    Avatar()
                        .onTapGesture {
                            accountSheetOpened.toggle()
                        }
                        .sheet(isPresented: $accountSheetOpened) {
                            
                        }
                        
                }
                .padding(.bottom, 32)
                .padding(.horizontal, 16)
                
                Text("Explore your favourite guitars by brand")
                    .customFont(.body)
                    .fontWeight(.medium)
                    .frame(maxWidth: 222, alignment: .leading)
                    .padding(.bottom, 24)
                    .padding(.horizontal, 16)
                
                
                // MARK: BRAND CARDS
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(brands) { brand in
                            BrandCard(brand: brand)
                                .containerRelativeFrame(.horizontal, count: 1, spacing: 10.0)
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
            .frame(maxHeight: .infinity, alignment: .top)
            .ignoresSafeArea(edges: .bottom)
        }
        .background(.vintageCream)
        .frame(maxHeight: .infinity)
        
    }
}

#Preview {
    HomeView()
}
