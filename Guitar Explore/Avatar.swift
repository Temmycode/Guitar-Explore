//
//  Avatar.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 28/02/2024.
//

import SwiftUI

struct Avatar: View {
    var imageUrl: String?
    var height: CGFloat?
    //TODO: there should be a model that loads the image from the web of firebase
    var body: some View {
        if let imageUrl = imageUrl {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: height ?? 40, height: height ?? 40)
                        .background(.yellow)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.black, lineWidth: 2)
                        }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: height ?? 40, height: height ?? 40)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.black, lineWidth: 2)
                        }
                case .failure(_):
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: height ?? 40, height: height ?? 40)
                        .background(.white)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.black, lineWidth: 2)
                        }
                @unknown default:
                    ProgressView()
                }
            }
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.gray)
                .padding(10)
                .frame(width: height ?? 40, height: height ?? 40)
                .background(.ultraThinMaterial)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 2)
                }
        }
    }
}

#Preview {
    Avatar()
}
