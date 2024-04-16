//
//  PhotoModelDataService.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 12/04/24.
//

import Foundation
import Combine

class PhotoModelDataService {
    
    
    @Published var photoModels: [PhotoModel] = []
    
    static let instance = PhotoModelDataService()
    var cancelables = Set<AnyCancellable>()
    
    private init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(mapCompletion)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data \(error)")
                }
            } receiveValue: { [weak self ] returnedPhotoModel in
                self?.photoModels = returnedPhotoModel
            }
            .store(in: &cancelables)
    }
    
    private func mapCompletion(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
