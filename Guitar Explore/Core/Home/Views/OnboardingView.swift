//
//  OnboardingView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 14/03/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("isFirstOpen") var isFirstOpen:Bool = false
    @Binding var showOnboardingSheet: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 131, height: 116)
                .foregroundStyle(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke()
                }
                .padding(.bottom, 40)
            
            VStack {
                Text("WELCOME TO GUITAR EXPLORE")
                    .customFont(.title)
                    .foregroundStyle(.brown1)
                    .font(.title)
                    .frame(width: 302, height: 65)
                    .padding(.bottom, 40)
                
                Spacer()
                
                Text("Explore your favourite guitars and dive deep into their history and the story behind their creation")
                    .customFont(.title)
                    .fontWeight(.regular)
                    .frame(width: 292)
                    .padding(.bottom, 30)
                
                Spacer()
                
                Image(systemName: "guitars")
                    .resizable()
                    .frame(width: 43, height: 34)
                    .padding(.bottom, 30)
                
                Text("This app was built for  the guitar hobbyist to learn and see some of the guitars that shaped the history of guitars today")
                    .customFont(.caption)
                    .fontWeight(.regular)
                    .foregroundStyle(.black.opacity(0.5))
                    .frame(width: 250)
                    .padding(.bottom, 50)
                
                Spacer()
                
                Button(action: {
                    showOnboardingSheet = false
                    isFirstOpen = false
                }, label: {PrimaryButton(text: "Continue", color: .brown1)})
            }
            .padding(.horizontal, 18)
            .multilineTextAlignment(.center)
        }
        .padding(.top, 26)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.background1)
    }
}

#Preview {
    OnboardingView(showOnboardingSheet: .constant(true))
}
