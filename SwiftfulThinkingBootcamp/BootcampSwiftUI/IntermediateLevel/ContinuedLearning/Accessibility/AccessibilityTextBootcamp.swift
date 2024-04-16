//
//  AccessibilityTextBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 13/04/24.
//

import SwiftUI

struct AccessibilityTextBootcamp: View {
    
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<10) { _ in
                    VStack(alignment: .leading, spacing: 0) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.headline) // dynaamic size
//                                .font(.system(size: 15)) // static size
                            
                            Text("Welcome to my app")
                        }
                        .font(.title)
                        
                        Text("This is some larger text that expand to multiple lines")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(2)
                            .minimumScaleFactor(dynamicTypeSize.customScaleFactor)
                    }
//                    .frame(height: 100)
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("Accesibility Text")
        }
    }
}

// digunakan untuk mengatur aksesibilitas dari text, dengan bantuan scale factor
extension DynamicTypeSize {
    var customScaleFactor: CGFloat {
        switch self {
        case .xSmall, .small, .medium, .large:
            return 1.0
        case .xLarge, .xxLarge, .xxxLarge, .accessibility1:
            return 0.85
        default:
            return 0.6
        }
    }
}

#Preview {
    AccessibilityTextBootcamp()
}

// small summary
/*
 Accesibility Text Bootcamp ( Dynamic text )
 Akesibilitas merupakan fitur pendukung untuk mendukung kebutuhan sepertu penglihatan, mobilitas, ucapan, pendengaran, serta kognitif user. Serta memudahkan untuk menggunakan fitur handphone yang terdapat didalam aplikasi.
 
 Aksesibilitas text merupakan sebuah fitur yang mendukung untuk memudahkan user yang bermasalah pada penglihatan, jadi membutuhkan text yang lebih besar untuk bisa membaca sebuah konten. Jadi aksesibilitas hadir untuk memudahkan dan mengatasi masalah penglihatan tersebut.
 
 Aksesibilitas Text tidak beradaptasi dengan screen size melainkan beradaptasi dengan font size, jadi kita membuat font yang adaptif terhadap font system
 
 MARK: catatan penting
 perbedaan antara .system(size: float) dan .font(.headline) adalah yang pertama itu statis, artinya apabila font diubah oleh user maka tidak berubah ukurannya, kalo yang kedua itu dinamic, apabila user mengubah ukuran hurufnya maka akan berubah dengan fontsize setelan dari user.
    `Berguna untuk :
        1. Ikon Biasanya Dibuat statis ex: systemImage, etc
        2. Huruf menggunakan dinamic text
 
 
 
 Modifier Baru
 1. truncating mode u/ mengatur dan seterusnya pada text, apakah mau ditaruh di tail, middle atau head
 2. @Environment(\.dynamicTypeSize) merupakan environment baru untuk mengatur 
 */
