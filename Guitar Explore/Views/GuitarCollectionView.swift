//
//  GuitarCollectionScreen.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 12/03/2024.
//

import SwiftUI

struct GuitarCollectionView: View {
    @Environment(GuitarViewModel.self) private var guitarViewModel
    var brand: Brand
    private var brandGuitars: [Guitar] {
        guitars.filter { guitar in
            guitar.brand == brand.name
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(alignment: .leading) {
                    Text("GUITAR COLLECTION")
                        .customFont(.headline)
                    
                    Spacer().frame(height: 70)
                    
                    GuitarHanger()
                    
                    Spacer()
                    
                    BrandLogoCard(brand: brand)
                        .padding(.bottom, 66)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
                // MARK: Page View for list of guitars
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(brandGuitars) { guitar in
                            GuitarCard(guitar: guitar)
                        }
                    }
                }
                .offset(y: -50)
                .contentMargins(18, for: .scrollContent)
                .scrollTargetBehavior(.paging)
            }
            .background(LinearGradient(colors: [.brown1, .brown2], startPoint: .top, endPoint: .bottom))
        }
        .onAppear {
            // set the currently checked brand
            guitarViewModel.setExploredBrand(brand: brand)
            
            // Customize the appearance of the back button here
            let appearance = UINavigationBarAppearance()
            appearance.buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.black]
            UINavigationBar.appearance().standardAppearance = appearance
        }
    }
}

#Preview {
    GuitarCollectionView(brand: brands[0])
}
