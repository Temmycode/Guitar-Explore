//
//  CustomButton.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 27/02/2024.
//

import SwiftUI

struct CustomButton: View {
    @State var pressed = false
    @State var isReleased = false
    var text: String
    var color: Color?
    
    var body: some View {
        
        Text(text)
            .font(.title2)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.red2)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 2.0)
            }
            .offset(x: pressed ? 1 : 0, y: pressed ? 1.2 : 0)
            .background{
                RoundedRectangle(cornerRadius: 12)
                    .shadow(color: .black, radius: 0, x: 4, y: 4)
            }
            .foregroundStyle(.black)
            .onTapGesture {
                withAnimation(.bouncy(duration: 0.5)) {
                    pressed = true
                }
            }
        //            .onLongPressGesture {
        //                if pressed == false {
        //                    withAnimation(.easeInOut(duration: 0.5)) {
        //                        pressed = true
        //                    }
        //                }
        //            }
            .onChange(of: pressed) { newValue in
                if  newValue == true {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        withAnimation(.bouncy(duration: 0.4)) {
                            pressed = false
                        }
                    }
                }
            }
        
    }
}

#Preview {
    CustomButton(text: "Log Out")
}
