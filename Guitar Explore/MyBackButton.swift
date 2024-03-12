//
//  My.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 12/03/2024.
//

import SwiftUI

struct MyBackButton: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                
            Text("Back")
        }
        .fontWeight(.semibold)
    }
}

#Preview {
    MyBackButton()
}
