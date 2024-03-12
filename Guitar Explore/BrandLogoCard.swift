//
//  BrandLogoCard.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 12/03/2024.
//

import SwiftUI

struct BrandLogoCard: View {
    var brand: BrandModel
    
    var body: some View {
        brand.logoImage
            .resizable()
            .scaledToFit()
            .frame(width: 65)
            .frame(width: 107, height: 34)
            .background(brand.color)
            .clipShape(RoundedRectangle(cornerRadius: 6))
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 1.0)
            }
            .background {
                RoundedRectangle(cornerRadius: 6)
                    .shadow(color: .black,radius: 0, x: 2, y: 2)
            }
    }
}

#Preview {
    BrandLogoCard(brand: brands[1])
}
