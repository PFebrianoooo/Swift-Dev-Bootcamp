//
//  DownloadWithCombineBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/03/24.
//

import SwiftUI
import Combine

struct PostModelCombine: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    var anyCancelable = Set<AnyCancellable>()
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // .dataTaskPublisher terjadi prosesnya di Background Threads and send to Main Thread untuk mengupadate UI
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                    case .finished:
                        print("Sucesss downloading data")
                    case .failure(let error):
                        print("Theres an error. \(error)")
                }
            } receiveValue: { [weak self] returnedPost in
                /*
                 Checking ada di thread mana
                print(Thread.isMainThread.description)
                print(Thread.current.description)
                 */
                self?.posts = returnedPost
            }
            .store(in: &anyCancelable)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}
struct DownloadWithCombineBootcamp: View {
    @StateObject var VM = DownloadWithCombineViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(VM.posts) { postItems in
                    VStack(alignment: .leading) {
                        Text(postItems.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.grapeColor)
                        
                        Text(postItems.body)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.blueberryColor)
                    }
                }
            }
            
            .navigationTitle("Combine Bootcamp")
        }
    }
}

#Preview {
    DownloadWithCombineBootcamp()
}

//small summary
/*
 Download json api request with combine.
 merupakan sebuah cara untuk handle download api from internet dengan menggunakan combine, combine merupakan framework baru untuk handle api request. keuntungan menggunakan combine adalah kode kita jauh lebih short and condensed sehingga dilihat lebih rapi dan lebih proper untuk dimaintenance
 
 Framework Combine
 1. publisher merupakan value yang dikirimkan
 2. subscriber merupakan value yang diterima dari publisher
 
 Methaphor Cara Kerja Dari Combine Framework
 1. Masuk ke pelanggan bulanan untuk mendapatkan paket yang dikirimkan
 2. Perusahaan akan membuatkan paket anda ddibelakang layar yang tidak anada ketahui
 3. Menerima paket didepan pintu rumah
 4. Memastikan box yang diterima tidak rusak dan tidak hancur barangnya
 5. Buka dan pastikan box yang diterima benar dan sesuai dengan baranag yang dipesan
 6. Gunakan barangnya!!
 7. Bisa di cancel kapanpun dan dimanapun
 
 Cara Membuat Combine Berdasarkan Methaphor
 1. Buat publisher degan URLSession
 2. .subscribe publihser dan taro di background threads
 3. .receive di main threads
 4. Lakukan TryMap()
 5. Decode data ke postmodel
 6. Sink dan taro itemmnya ke aplikas
 7. Cancel
 
 */
