//
//  GuitarModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct Guitar: Identifiable {
    var id = UUID()
    var name: String
    var year: Int
    var brand: Brands
    var title: String
    var subtitle: String
    var imageUrl: String
    
    var image: Image {
        Image(imageUrl)
    }
}

