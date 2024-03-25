//
//  AccountListTile.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 24/03/2024.
//

import SwiftUI

struct AccountListTile: View {
    var icon: String
    var title: String
    var subtitle: String?
    
    var body: some View {
        HStack(spacing: 0.0) {
            Label(title, systemImage: icon)
                .customFont(.headline)
                .fontWeight(.regular)
                .foregroundStyle(.black)
            Spacer()
            subtitle != nil ? Text(subtitle!)
                .foregroundStyle(.gray)
                .fontWeight(.light) : nil
        }
    }
}
