//
//  BackgroundQueueAndThreadsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/03/24.
//

import SwiftUI

class BackgroundThreadsVM: ObservableObject {
    @Published var dataArrays: [String] = []
    
    func fetchData() {
        // keterangan Pembantu
        /*
         didownload dulu di background threads, lalu kalo udah kedownload. kembalikan ke main thread, dengan dispatchQueue.main
         1. main artinya untuk main threads yaitu threads 1
         2. global artinya untuk keseluruhan threads yang ada, dipilih sesuai maunya handphone
         
         Thread.isMainThread u/ memberi tahu apakan ini main thread apa bukan
         Thread.current u/ memberi tahu apakan atau thread saat ini.
         
         
         // .global(qos: )
         1. .background u/ yang dilakukan dibelakang layar yang user bahkan tidak tahu apa yng terjadi
         2. .deafult u/ settingan standar
         3. .unspecified u/ tidak spesifik dimana yang bisa digunakan
         4. .userInitiated u/ user dimana aplikasi tidak bisa berjalan atau terbuka sampai di load datanya
         5. .userInteractive u/ tugas seperti animasi, handling and updating interface
         6. .utility u/ user yang bahkan tidak tahu apa yang terjadi dibelakang layar
         
         */
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            print("Checking 1 : \(Thread.isMainThread)")
            print("Checking 1 : \(Thread.current)")
            
            DispatchQueue.main.async {
                self.dataArrays = newData
                print("Checking 2 : \(Thread.isMainThread)")
                print("Checking 2 : \(Thread.current)")
            }
        }
    }
    
    private func downloadData() -> [String] {
        var data: [String] = []
        
        for index in 0...100 {
            data.append("Current number : \(index)")
            print(data)
        }
        return data
    }
}

struct BackgroundQueueAndThreadsBootcamp: View {
    @StateObject var VM: BackgroundThreadsVM = BackgroundThreadsVM()
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Load Data")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .onTapGesture {
                        VM.fetchData()
                    }
                
                LazyVStack(alignment: .leading) {
                    ForEach(VM.dataArrays, id: \.self) { items in
                        Text(items)
                            .font(.headline)
                            .foregroundStyle(Color.grapeColor)
                    }
                }
                
                
            }
        }
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    BackgroundQueueAndThreadsBootcamp()
}

// small summary
/*
 Background Threads and Queue
 Background Threads and Queue merupakan sebuah bagian memory dimana setiap kita deklarasikan sebuah code didalam sebuah project, pada dasarnya kita menggunakan main memory atau main threads yaitu threads 1 dalam pendeklarasiannnya.
 
 Background Threads instansiasi
    DispatchQueue.global().async { code }
  
 Important !
 1. Apapun yang ingin di diupdate di actual screen, maka ditaruh di main threads
 2. As a profesionnal developer kita harus menempatkan segala yang berat kedalam backgound threads.
        kita mendownload resource dulu sebelum masuk atau membuka sebuah view nya.
            resource terdiri atas
                1. Image
                2. Picture
                3. Database resource
 3. Apabila kita mendeklarasikan kedalam main threads dalam semua hal, maka akan membuat aplikasi kita menjadi lambat dan bisa bisa crash dan mungkin saja bisa freeze our App.

 Tips:
 jadi kalo ingin menggunakan background threads, maka gunakan dulu downloadingnya di backgorund lalu kembalikan kepada main threads hasil downloadannya. biar ga error

 */
