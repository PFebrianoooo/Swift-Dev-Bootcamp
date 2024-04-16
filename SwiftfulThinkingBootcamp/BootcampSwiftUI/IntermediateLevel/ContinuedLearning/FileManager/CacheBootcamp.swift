//
//  CacheBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/04/24.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager() // singleton
    
    private init() {  }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100 // limit untuk berapa banyak image atau objek yang ditaruh di temp memory
        cache.totalCostLimit = 1024 * 1024 * 100 // 100mb memory yang diberikan
        return cache
    }()
    
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("add item to cache")
    }
    
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("remove item from cache")
    }
    
    func get(name: String) -> UIImage? {
        print("Get item from cache")
        return imageCache.object(forKey: name as NSString)
    }
}

class CacheViewModel: ObservableObject {

    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    let imageName = "wasteBankLogo"
    let managerCache = CacheManager.instance
    
    init() {
        getImageFromAssetFolder()
    }
    
    func getImageFromAssetFolder() {
        startingImage = UIImage(named: imageName)
    }
    
    func saveToCache() {
        guard let image = startingImage else { return }
        managerCache.add(image: image, name: imageName)
    }
    
    func removeFromCache() {
        managerCache.remove(name: imageName)
    }
    
    func getFromCache() {
        cachedImage = managerCache.get(name: imageName)
    }
}


struct CacheBootcamp: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                
                VStack(spacing: 10) {
                    VStack {
                        Text("Original Image")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.blue)
                        
                        if let image = vm.startingImage {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.0)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.vertical, 20)
                    
                    VStack {
                        Text("Cached Image")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.blue)
                        
                        if let image = vm.cachedImage {
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 1.0)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                    }
                    .padding(.vertical, 20)
                }
                .frame(maxWidth: UIScreen.main.bounds.width)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                }
                
                HStack {
                    Button("Save to Cache") {
                        vm.saveToCache()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Delete from Cache") {
                        vm.removeFromCache()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.top, 20)
                
                Button("Get from Cache") {
                    vm.getFromCache()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Cache Bootcamp")
        }
    }
}

#Preview {
    CacheBootcamp()
}

// small summary
/*
 Caches Bootcamp
 caching berkaitan dengan download data from internet, dimana ketika kita membuka aplikasi daripada kita mendownload dan menyimpannya di file manager, lebih baik ditaruh di cache atau temporary memory. Jadi ketika aplikasi ditutup maka file yang didownload dari internet akan terhapus apabila user close aplikasinya. Jadi selama user membuka aplikasi maka hasil download tersebut akan selalu ada. Kalo udah ditutup aplikasinya baru hasil downloadnya hilang.
 
 contohnya dalam aplikasi instagram
 
 sebuah tips:
 Dalam pembuatan aplikasi apapun, ketika kita mendownload image dari internet atau dari assets folder. diharuskan untuk caching data dan menimpan data secara lokal, agar aplikasi yang dibuat lebih efficient dan menggunakan lebih sedikit memory serta meningkatkan user experience.
 Daripada kita harus mendownload setiap kali membuka aplikasi, kenapa kita tidak mencoba untuk mendownload sebanyak satu kali dan menempatkan sebagai local file agar lebih menggunakan sedikit memory.
 */
