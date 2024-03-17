//
//  BrandCard.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct BrandCard: View {
    @State var isPressed = false
    var brand: BrandModel
    
    var body: some View {
        NavigationLink {
            GuitarCollectionView(brand: brand)
        } label: {
            VStack(alignment: .center) {
                Spacer()
                brand.logoImage
                Spacer()
                Text("\(brand.createdBy) in \(brand.year)")
                    .padding(.bottom, 18.44)
            }
            .frame(width: 350.56, height: 504.39)
            .background(brand.color)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 3.5)
            )
            .offset(x: isPressed ? 2 : 0, y: isPressed ? 2 : 0)
            .background{
                RoundedRectangle(cornerRadius: 12)
                    .shadow(color: .black, radius: 0, x: 5.25, y: 5.25)
            }
            .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    BrandCard(brand: brands[0])
}
