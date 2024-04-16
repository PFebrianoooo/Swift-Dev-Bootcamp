//
//  DownloadingImagesRow.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 12/04/24.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let models: PhotoModel
    
    var body: some View {
        HStack {
            DownloadingImageView(url: models.thumbnailUrl, key: "\(models.id)")
                .frame(width: 75, height: 75)
            
            VStack(alignment: .leading) {
                Text(models.title)
                    .font(.system(size: 15))
                    .foregroundStyle(.purple)
                
                Text(models.url)
                    .font(.system(size: 13))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(models: PhotoModel(albumId: 1, id: 1, title: "This is title", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952"))
        .previewLayout(.sizeThatFits)
        .padding(.horizontal)
}
