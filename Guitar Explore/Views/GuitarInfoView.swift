//
//  GuitarInfoView.swift
//  Guitar Explore
//
//  Created by Temiloluwa Akisanya on 14/03/2024.
//

import SwiftUI

struct GuitarInfoView: View {
    @Binding var showGuitarView: Bool
    var guitar: Guitar
    
    var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let height = geo.size.height
            
                ScrollView {
                    ZStack {
                        VStack {
                            guitar.image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 136.5, height: 420.6)
                        }
                        .frame(height: 520)
                        .frame(maxWidth: .infinity)
                        .background(.brown1)
                        .clipShape(.rect(cornerRadii: .init(topLeading: 10, bottomLeading: 20, bottomTrailing: 20, topTrailing: 10)))
                        .overlay {
                            UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10, bottomLeading: 20, bottomTrailing: 20, topTrailing: 10))
                                .stroke(lineWidth: 2)
                        }
                        
                        // MARK: Nail Circles
                        VStack {
                            HStack {
                                Circle()
                                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height: 7)
                                Spacer()
                                Circle()
                                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height: 7)
                            }
                            .padding(.horizontal, 10)
                            
                            Spacer()
                            
                            HStack {
                                Circle()
                                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height: 7)
                                Spacer()
                                Circle()
                                    .foregroundStyle(.linearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height: 7)
                            }
                            .padding(.horizontal, 15)
                        }
                        .padding(.vertical, 18)
                        
                        Button {
                            showGuitarView.toggle()
                        } label: {
                            Circle()
                                .frame(width: 25)
                                .foregroundStyle(.ultraThinMaterial)
                                .overlay {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 11)
                                }
                        }
                        .foregroundStyle(.black)
                        .offset(x: width / 2.2, y: -height / 3.5)
                    }
                    
                    // MARK: Guitar Name
                    VStack(alignment: .leading, spacing: 13) {
                        Text(guitar.name)
                            .customFont(.title)
                            .frame(width: 286, alignment: .leading)
                        
                        Text("Made in the year \(guitar.year)")
                            .customFont(.title)
                            .fontWeight(.light)
                            .foregroundStyle(.black.opacity(0.4))
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 18)
                    .padding(.top, 19)
                    .padding(.bottom, 34)
                    
                    VStack(spacing: 13) {
                        Text("History")
                            .customFont(.headline)
                            .fontWeight(.regular)
                        
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.")
                            .customFont(.headline)
                            .fontWeight(.light)
                    }
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 18)
                }
                .background(.background1)
        }
    }
}

#Preview {
    GuitarInfoView(showGuitarView: .constant(false), guitar: guitars[1])
}
