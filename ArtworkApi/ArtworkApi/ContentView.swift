//
//  ContentView.swift
//  Bed Time Slider
//
//  Created by Matthew Deng on 2024-11-12.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ArtworkViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.artworks, id: \.id) { artwork in
                    ArtworkView(artwork: artwork)
                        .padding()
                }
            }
            .navigationTitle("Artworks")
            .onAppear {
                viewModel.fetchArtwork()
            }
        }
    }
}

#Preview {
    ContentView()
}
