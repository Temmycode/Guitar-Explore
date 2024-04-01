//
//  GuitarHanger.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 12/03/2024.
//

import SwiftUI

struct GuitarHanger: View {
    var body: some View {
       ZStack {
            VStack(spacing: 11) {
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 6.25)
                RoundedRectangle(cornerRadius: 2)
                    .frame(height: 6.25)
            }
           
           VStack {
               HStack {
                   Circle()
                       .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                       .frame(height: 4)
                   Spacer()
                   Circle()
                       .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                       .frame(height: 4)
               }
               .padding(.horizontal, 10)
               
               Spacer()
               
               HStack {
                   Circle()
                       .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                       .frame(height: 4)
                   Spacer()
                   Circle()
                       .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                       .frame(height: 4)
               }
               .padding(.horizontal, 10)
           }
           .padding(.vertical, 3)
        }
       .frame(maxHeight: 41)
       .background(.hangerBrown)
       .clipShape(RoundedRectangle(cornerRadius: 3))
       .shadow(color: .black.opacity(0.35),radius: 4, x: 0, y: 8)
       .overlay {
           RoundedRectangle(cornerRadius: 3)
               .stroke(lineWidth: 3.0)
       }
    }
}

#Preview {
    GuitarHanger()
}
