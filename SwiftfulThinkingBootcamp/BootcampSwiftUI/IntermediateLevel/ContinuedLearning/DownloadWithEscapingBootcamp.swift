//
//  DownloadWithEscapingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/03/24.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    /*
     Json data
     {
       "userId": 1,
       "id": 1,
       "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
       "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
     }
     */
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        /*
         url api request online
         https://jsonplaceholder.typicode.com/posts/1
         */
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // sends to main threads
        downloadData(fromUrl: url) { data in
            if let data {
                DispatchQueue.main.async { [weak self] in
                    guard let postData = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
//                    self?.posts.append(postData) /* untuk satu data */
                    self?.posts = postData /* untuk data array atau banyak */
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    // escaping digunakan untuk mendeploy aplikasi dengan versi iOS13 MInimum requiements
    func downloadData(fromUrl url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            // by default URLSession dataTask was in background threads its efficient
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error Downloaded Data")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
        }.resume()
    }
    
}
struct DownloadWithEscapingBootcamp: View {
    
    @StateObject var VM = DownloadWithEscapingViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(VM.posts) { postItem in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(postItem.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.grapeColor)
                        Text(postItem.body)
                            .font(.subheadline)
                            .foregroundStyle(Color.blueberryColor)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .navigationTitle("Post Api app")
        }
    }
}

#Preview {
        DownloadWithEscapingBootcamp()
}

// small summary
/*
 fetch data with api
 fileini termasuk penbelajaran dimana pembelajaran pada kali ini menerapkan ilmu yang sudah di lakukan di video video sebelumnya. dengan menerapkan background threads, escaping, typealias and playing around with Api.
 */
