//
//  BrandCard.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct BrandCard: View {
    @State var isPressed = false
    var brand: Brand
    let height = UIScreen.main.bounds.size.height
    let width = UIScreen.main.bounds.size.width
    
    var body: some View {
        NavigationLink {
            GuitarCollectionView(brand: brand)
        } label: {
            VStack(alignment: .center) {
                Spacer()
                brand.logoImage
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: width * 0.61, maxHeight: height * 0.09)
                Spacer()
                Text("\(brand.createdBy) in \(brand.year)")
                    .padding(.bottom, 18.44)
            }
            .frame(width: width * 0.89, height: height * 0.6)
            .background(brand.colors)
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
