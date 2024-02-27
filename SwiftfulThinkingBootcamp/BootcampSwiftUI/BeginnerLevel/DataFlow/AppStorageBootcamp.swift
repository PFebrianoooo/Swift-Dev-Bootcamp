//
//  AppStorageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/02/24.
//

import SwiftUI

struct AppStorageBootcamp: View {
//    @State var currentUserName: String?
    @AppStorage("userName") var currentUserName: String?
    
    var body: some View {
        VStack {
            if let currentUserName {
                Text(currentUserName)
            }
            
            Button("Save".uppercased()) {
                let name = "Putra Pebriano Nurba"
                currentUserName = name
                // saving data (Set) to user defaults
                // merupakan cara lama di ios development sebelum SwiftUI came
//                UserDefaults.standard.set(name, forKey: "userName")
            }
            .buttonStyle(.borderedProminent)
        }
//        .onAppear {
//            // caling (Fetch) data
//            currentUserName = UserDefaults.standard.string(forKey: "userName")
//        }
    }
}

#Preview {
    AppStorageBootcamp()
}

// small summary

/*
 App Storage
 app sorage atau @appStorage merupakan property wrappers dimana berfungsi untuk memberikan user defaults saat menggunakan aplikasi, di UI Kit dikenal dengan User defaults dan di SwiftUI dikenal dengan App storage.
 
 Jadi pada app storage kita tidak butuh lagi untuk set dan fetch data seperti yang dilakukan diatas, dan variable pada app storage akan bisa digunakan diseluruh view file yang tersedia pada project.
 
 Example Syntaxes User Defaults
 UserDefaults.standard.set(value: Any?, forKey: String)
 
 
 FWI :
 User Defaults merupakan mini Database dimana pada user defaults user menyimpan sebuah data dan apabila user membuka aplikasi tersebut data yang telah user buat atau manipulasi sebelumnya akan aman dan tidak hilang.
 
 Penyimpanan user defaults diatas merupakan car alama yang dilakukan untuk menyimpan user defaults sebelum Swift UI datang, setelah Swift Ui datang penyimpanan user defaults menggunakan property wrapper namanya adalah @appStorage
 
 */
