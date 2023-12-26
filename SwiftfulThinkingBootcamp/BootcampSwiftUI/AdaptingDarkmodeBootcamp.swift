//
//  AdaptingDarkmodeBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 20/12/23.
//

import SwiftUI

struct AdaptingDarkmodeBootcamp: View {
    
    @Environment (\.colorScheme) var colorScheme
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading ,spacing: 30) {
                    Text("this is Color of PRIMARY")
                        .foregroundColor(.primary)
                    // warna primary merupakan warna yang adaptif tapi sangat basic, dimana pada light mode berwarna hitam dan pada dark mode bewarna putih
                    
                    Text("this is Color of SECONDARY")
                        .foregroundColor(.secondary)
                    // secondary bukanlah warna adpatif. tetapi warna yang dimiliki secondary ini warnanya konstan. Abu-abu mulai dari darkmode dan light mode
                    
                    Text("this is Color is Black")
                        .foregroundColor(.black)
                    Text("this is Color is white")
                        .foregroundColor(.white)
                    // dua warna diatas merupakan warna yang statis dimana pada light mode putih tidak terlihat, dan pada darkmode hitam tidak trlihat. jadi gampangnya warna kedua ini hanya memenuhi satu theme saja.
                    
                    Text("this is Global Adaptive Colors")
                        .foregroundColor(Color("AdaptiveColors"))
                    // berlaku disegala penjuru file dalam suatu project. makanya dinamakan globally adaptive
                    
                    Text("This is Locally Adaptive Color")
                        .foregroundColor(colorScheme == .light ? Color.pink : Color.yellow)
                    // berlaku hanya pada satu file dalam project. Thats why we called locally adaptive
                }
            }
            
            // Navigation Stack Itens
            .navigationTitle("Dark mode Bootcamp".capitalized)
        }
    }
}

struct AdaptingDarkmodeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AdaptingDarkmodeBootcamp()
            // digunakan untuk menetukan preference color theme
                .preferredColorScheme(.light)
            
            
            AdaptingDarkmodeBootcamp()
                .preferredColorScheme(.dark)

        }
        
    }
}

// small summary
// Adapting DarkMode
/*
 diajarkan tentangbagaimana cara memebuat warna yang adaptif untuk 2 seri theme yang tersedia. yaitu pada dark mode dan light mode, dimana pada materi ini menggunakan warna adaptive color yang disediakan pada bagian assets folder.
 
 fungsi group pada previews // untuk menaruh multiple preview dimana kita bisa menambahkan fungsi view lebih dari satu didalam group dan melakukan modifier pada fungsi view
 */
