//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/03/24.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    var body: some View {
        NavigationView {
            NavigationLink("Navigate here") {
                 WeakSelfBootcampSecondScreen()
            }
            
        }
        .overlay (alignment: .topTrailing) {
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.top, 80)
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle("Arc Bootcamp")
        
    }
}

struct WeakSelfBootcampSecondScreen: View {
    @StateObject var VM = WeakSelfSecondScreenViewModel()
    var body: some View {
        VStack {
            Text("Second screen")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(Color.grapeColor)
            
            if let data = VM.data {
                Text(data)
            }
        }
    }
}


class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        // datang ketika di initilize
        print("Get data and initialize now")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        // ketika tidak di initialize
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.setValue(currentCount - 1, forKey: "count")

        print("Deinitialize now")
    }
    
    func getData() {
        //fungsi dispatch queue memberikan background task, apabila dia beluum tereksekusi maka nunggu tereksekusi dulu. dan untuk deinitialize akan deinit apabila sudah tereksekusi background task nya. kalo tidak, tidak akan ter deinitialize
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            /*
             kita tidak dianjurkan untuk membuat string reference althorugh our app, karena akan membuat aplikasi kita lamban, maka kalo emang kaga butuh banget gunakan weak self.
             tapi kalo emang content yang ingin ditampilkan sangat diperlukan. Maka gunakan self atau strong reference
             
             weak self analogy. kalo emang item di weak reference kan. Gapapa, kalo mao di deinit OK Boleh. gak terlalu penting. Jadi gampangnya tampilkan kalo kita di layar itu aja. Kalo ga muncul OK. Dan yang terjadi adalah task nya tetap 1 tidak sebanyak ketika menggunakan self (strong reference)
             
             Weak self kepakenya ketika kita mau nampilin sebuah data apabila user masuk ke view nya, cocok bermain dengan api
             */
            self?.data = "Get data"
        }
    }
}

#Preview {
    NavigationView {
        WeakSelfBootcamp()
    }
}

// small summary
/*
 Weak and Self Bootcamp (arc)
 Weak and Self Bootcamp merupakan sebuah automaric reference counting (arc) dimana memberikan reeference untuk view. Jika view ini tampil, maka akan dibuatkan view nya, dan jika tidak digunakan maka view ini tidak digunakan atau tidak dibuat.
 weak self bekerja ketika kita mendonwload sebuah gambar pada internet dan menampilkannya pada view aplikasi. Tentu dengan bantuan main and background Threads.
 
 self memberikan strong reference ke kelas yang di initialize. kalo task tersebut dalam case ini belum tereksekusi, maka tidak dikasih deinitialize
 
 deinitialize merupakan fungsi yang dipanggil ketika menginggalkan atau tidak menggunakan sebuah class nya, init pertama kali ketika view datang. Kalo deinitialize kalo view sudah tidak digunakan.
 */
