//
//  GoogleSignInMockView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 20/03/2024.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInMockView: View {
    @State private var date = Date()
    var body: some View {
        DatePicker("Start Date", selection: $date)
            .datePickerStyle(.compact)
            .contextMenu {
                Text("Temi")
                Text("Temi")
                Text("Temi")
                Text("Temi")
            } preview: {
                VStack (alignment: .leading, spacing: 10) {
                    Image("strat")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Fender Stratocaster")
                }
            }

    }
}

#Preview {
    GoogleSignInMockView()
}
