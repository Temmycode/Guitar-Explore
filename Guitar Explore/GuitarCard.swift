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
        ZStack {
            // MARK: GUITAR IMAGE AND TITLE
            VStack(alignment: .center) {
                guitar.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 136.5, height: 420.6)
                
                Spacer().frame(height: 40)
                
                VStack(alignment: .leading, spacing: 10.4) {
                    Text(guitar.name)
                        .customFont(.title)
                        .frame(maxWidth: .infinity, maxHeight: 43, alignment: .leading)
                    
                    Text("in \(guitar.year)")
                        .customFont(.title)
                        .fontWeight(.light)
                        .foregroundStyle(.black.opacity(0.4))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(width: 286, height: 530)
            .onTapGesture {
                showGuitarView.toggle()
            }
            .sheet(isPresented: $showGuitarView) {
                GuitarInfoView(showGuitarView: $showGuitarView, guitar: guitar)
            }
            
            // MARK: Guitar Hanger
            HStack(spacing: 14) {
                Circle()
                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 10)
                
                Circle()
                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 10)
            }
            .rotationEffect(guitar.brand == .fender ? Angle(degrees: -20) : Angle(degrees: 0))
            .offset(x: 1.5, y: -190)
            
        }
    }
}

#Preview {
    GuitarCard(guitar: guitars[0])
}
