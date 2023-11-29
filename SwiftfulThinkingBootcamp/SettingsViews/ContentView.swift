//
//  ContentView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 02/11/23.
//

import SwiftUI


// ini merupakan struct tempat kita menuliskan kode kode unutk mendapatkan hasil ui yang diinginkan dari kelas-kelas atau struct yang tersedia di liblary swift.
// ingat konsep polymorphism, inheritance, dan juga konsep dari OOP Lainnya.

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, Everyone!")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(Color(red: 0.92, green: 0.515, blue: 0.457))
            Image(systemName: "globe")
                .foregroundColor(.black)
                .imageScale(.large)
        }
        .padding()
    }
}


// ini merupakan preview provider yang disediaka untuk file contentview, digunakan untuk realtime display saat membuat ui pada aplikasi.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// minimum deployment artinya minimum version software yang dapat menggunakan aplikasi
// catatan kecil
// pada menu apps, identifier berguna untuk menampilkan display apps mulai dari nama sampai version. nah di identifier. kita bisa mengatur apps yang ada mulai dari updating apps dan lainnya, lengkapnya apabila lupa di video bootcamp ke-1
