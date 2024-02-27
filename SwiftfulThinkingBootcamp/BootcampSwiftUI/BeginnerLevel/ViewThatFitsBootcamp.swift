//
//  ViewThatFitsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 26/02/24.
//

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.8)
            
            ViewThatFits {
                Text("Hello there this is my small summary and this material course is about SizeThat Fits !")
                Text("Hello there this is my small summary and this material course")
                Text("Hello there this is my small summary")
                Text("Hello there this is my small")
            }
        }
        
        .font(.headline)
        .fontWeight(.semibold)
        .foregroundStyle(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(height: 300)
        .padding(15)
        
        
        
    }
}

#Preview {
    ViewThatFitsBootcamp()
}

// small summary
/*
 View That Fits
 merupakan sebuah cara untuk membuat view dengan menfitskan atau menyesuaikan dengan canvas layar. Apabila content yang dihadirkan dinamic maka bisa menggunakan size that fits untuk mengaturnya. Gampangnya Size That fits adalah kita menaruh option pada size that fits modifier, dan modifier tersebut dapat memilih yang sesuai dengan fit atau pasnya daripada framing elements
 
 kita bisa menaruh banyak opsi pada View That Fits untuk bisa dipilih secara dinamic oleh si container tersebut bacanya dari atas kebawah, sesuai dengan hirarki atau cara compile code Atas -> Bawah.
 
 TIPS
 1. Digunakan untuk teks judul agar tidak resize terus menerus.
 2. Digunakan kebanyakan untuk bermain-main dengan Text.
 
 */
