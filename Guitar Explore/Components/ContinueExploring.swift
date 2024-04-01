//
//  ContinueReading.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 26/03/2024.
//

import SwiftUI

struct ContinueExploring: View {
    var brand: Brand?
    
    var body: some View {
        HStack(alignment: .center) {
           // MARK:
            if let brand = brand {
                Text("Continue Exploring:")
                    .customFont(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                
                Spacer()
                
                BrandLogoCard(brand: brand)
            } else {
                Text("Explore your favourite guitars by brand")
                    .multilineTextAlignment(.center)
                    .customFont(.body)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 25)
        .frame(maxWidth: .infinity)
        .frame(height: 51)
        .background(.hangerBrown)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 2)
        }
    }
}

#Preview {
    ContinueExploring()
}
