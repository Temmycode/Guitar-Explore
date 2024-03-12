//
//  GuitarModel.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct GuitarModel {
    var name: String
    var year: Int
    var brand: Brand
    var title: String
    var subtitle: String
    var imageUrl: String
    
    var image: Image {
        Image(imageUrl)
    }
}
