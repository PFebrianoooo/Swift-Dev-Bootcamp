//
//  DownloadingImagesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 12/04/24.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { models in
                    DownloadingImagesRow(models: models)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}

/*
 // cover materi yang sudah di pelajari
    1. Background thread
    2. Weak self
    3. Combine Framework
    4. Fle Manager
    5. NSCache
 */
