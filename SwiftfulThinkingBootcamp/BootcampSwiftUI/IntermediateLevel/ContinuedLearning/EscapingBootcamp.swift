//
//  EscapingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/03/24.
//

import SwiftUI

class EscapingBootcampViewModel: ObservableObject {
    typealias downloadCompletion = (DownloadModel) -> ()
    
    @Published var text: String = "Hell There"
    
    func getData() {
        downloadData5 { [weak self] (returnedResult) in
            self?.text = returnedResult.data
        }
        
    }
    
    func downloadData() -> String {
        return "New Data"
    }
    
    func downloadData2(completionHandler: (_ data: String ) -> Void ) {
        // returning sebuah void dengan input string internal, tanpa escaping
        // tidak bisa menggunakan delay/dispatchQueue
        // input parameter internal string yang dikembalikan untuk di assign saat pemanggilan
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New Data")
//        }
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String ) -> ()) {
        // menggunakan escaping, bisa menggunakan delay.
        // input parameter internal string yang dikembalikan untuk di assign saat pemanggilan
        // rerturning Void
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("Hell Yeah")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadModel) -> ()) {
        // menggunakan escaping, bisa menggunakan delay.
        // input parameter internal DataModel Example yang dikembalikan untuk di assign saat pemanggilan
        // returning Void
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let dataResult = DownloadModel(data: "New Data")
            completionHandler(dataResult)
        }
    }
    
    func downloadData5(completionHandler: @escaping downloadCompletion) {
        // menggunakan escaping, bisa menggunakan delay.
        // input parameter internal DataModel Example yang dikembalikan untuk di assign saat pemanggilan
        // returning Void
        // cpde jauh lebih rapi dengan bantuan typealias

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let dataResult = DownloadModel(data: "New Data")
            completionHandler(dataResult)
        }
    }
}

struct DownloadModel {
    let data: String
}




struct EscapingBootcamp: View {
    
    @StateObject var VM = EscapingBootcampViewModel()
    
    var body: some View {
        VStack {
            Text(VM.text)
                .font(.title)
                .fontWeight(.semibold)
                .onTapGesture {
                    VM.getData()
                }
        }
    }
}

#Preview {
    EscapingBootcamp()
}

// small summary
/*
 Escaping Bootcamps
 Singkronus/Synchronus code merupakan sebuah code yang dieksekusi dari atas kebawah secara langsung
    1. Tidak bisa di delay menggunakan DispatchQueue
    2. Harus mereturnkan void apabila menggunakan DispatchQueue
 
    Contohnya:
        func downloadData() -> String {
            return "New Data"
        }
 
        func getData(_ data: String) -> Void {
            /*
            Menggunakan nama eksternal penggunaan variable lokal didalam fungsi dan saat pemanggilan
                forData u/ pemanggilan
                data u/ penggunaan
                Void == ()
            */
            print(data)
        }
 
 Asingkronus/Asynchronus code merupakan sebuah code yang bisa dieksekusi tanpa langsung, gampangnya didalam database. kita perlu untuk mengambil data ke server lalu kembalikan lagi ke code kita baru bisa dipakai. Untuk mengakali cara tersebut kita menggunakan asynshronus code yaitu dengan bantuan escaping
    
    Contohnya:
    func downloadData2(completionHandler: (_ data: String ) -> Void) {
            completionHandler("New Data")
    }
 
 
 
 */
