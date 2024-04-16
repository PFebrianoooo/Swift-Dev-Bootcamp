//
//  ImageLoadingViewModel.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 12/04/24.
//

import Foundation
import Combine
import SwiftUI

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    var cancelables = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting Saved Image")
        } else {
            downloadImage()
            print("Downloading Image Via URL Request")
        }
    }
    
    private func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { data, response -> UIImage? in
                return UIImage(data: data)
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard let self = self,
                      let image = returnedImage else { return }
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancelables)

    }
}
