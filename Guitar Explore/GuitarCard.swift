//
//  GuitarCard.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 12/03/2024.
//

import SwiftUI

struct GuitarCard: View {
    @State var showGuitarView: Bool = false
    var guitar: GuitarModel
    
    var body: some View {
        VStack(alignment: .center) {
            guitar.image
                .resizable()
                .scaledToFit()
                .frame(height: 420.6)
            
            Spacer().frame(height: 40)
            
            VStack(alignment: .leading, spacing: 10.4) {
                Text(guitar.name)
                    .customFont(.title)
                
                Text("in \(guitar.year)")
                    .customFont(.title)
                    .fontWeight(.light)
                    .foregroundStyle(.black.opacity(0.4))
            }
        }
        .frame(width: 286, height: 530, alignment: .leading)
        .onTapGesture {
            showGuitarView.toggle()
        }
        .sheet(isPresented: $showGuitarView) {
            
        }
    }
}

#Preview {
    GuitarCard(guitar: guitars[0])
}
