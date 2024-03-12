//
//  Avatar.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct Avatar: View {
    //TODO: there should be a model that loads the image from the web of firebase
    var body: some View {
        Image("avatar")
            .resizable()
            .scaledToFit()
            .frame(width: 40, height: 40)
            .background(.yellow)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.black, lineWidth: 2)
            )
        
    }
}

#Preview {
    Avatar()
}
