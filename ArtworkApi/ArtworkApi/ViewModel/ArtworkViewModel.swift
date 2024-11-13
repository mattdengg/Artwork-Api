//
//  ArtworkViewModel.swift
//  Bed Time Slider
//
//  Created by Matthew Deng on 2024-11-13.
//

import Foundation
import Combine

class ArtworkViewModel: ObservableObject {
    @Published private(set) var artworks = [Artwork]()
    private var cancellables = Set<AnyCancellable>()
    private let jsonDecoder = JSONDecoder()
    
    func fetchArtwork() {
        guard let url = URL(string: "https://api.artic.edu/api/v1/artworks") else { return } // check if url exists
        
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ArtworkDataResponse.self, decoder: jsonDecoder)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(_):
                    print("Error")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] response in
                self?.artworks = response.data
            }
            .store(in: &cancellables)
    }
}
