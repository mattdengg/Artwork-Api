//
//  ArtworkView.swift
//  Bed Time Slider
//
//  Created by Matthew Deng on 2024-11-13.
//

import SwiftUI

struct ArtworkView: View {
    let artwork: Artwork
    var body: some View {
        NavigationLink {
            ArtworkDetailView(artwork: artwork)
        } label: {
            ArtworkListView(artwork: artwork)
        }
    }
}

struct ArtworkListView: View {
    @State private var screenWidth = UIScreen.main.bounds.size.width
    let artwork: Artwork
    
    var body: some View {
        
        ZStack {
            Image("Pic")
                .resizable()
                .scaleEffect(2.5)
                .blur(radius: 40)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .frame(maxWidth: (screenWidth - 20))
                .frame(maxHeight: 250)
                .opacity(0.7)
            
            VStack {
                ExtractedText(artwork: artwork)
                ExtractedView(artwork: artwork)
            }
            .frame(width: screenWidth - 20, height: 250)
        }
    }
}

struct ExtractedText: View {
    @State private var screenWidth = UIScreen.main.bounds.size.width
    let artwork: Artwork
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(artwork.title)
                        .font(.title)
                        .foregroundStyle(.black)
                        .bold()
                        .padding(.top)
                    Spacer()
                }
                .padding(.top)
                Spacer()
            }
            .padding(.leading)
            .frame(maxWidth: (screenWidth - 20))
            .frame(height: 120)
            .shadow(radius: 12)
            Spacer()
        }
    }
}

struct ExtractedView: View {
    @State private var screenWidth = UIScreen.main.bounds.size.width
    let artwork: Artwork
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                artworkImageView
            }
            Spacer()
        }
        .padding(.bottom, 5)
    }
    
    @ViewBuilder
    var artworkImageView: some View {
        if let imageId = artwork.imageId,
           let imageURL = URL(string: "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg") {
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: (screenWidth - 30))
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .shadow(radius: 12)
            } placeholder: {
//                ProgressView()
            }
        } else {
            Text("Image is not available")
        }
    }
}


#Preview {
    ArtworkView(artwork: previewArtwork)
//    ArtworkListView(artwork: previewArtwork)
}
