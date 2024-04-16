//
//  AccesibilityDynamicColors.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 13/04/24.
//

import SwiftUI

struct AccesibilityDynamicColors: View {
 
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var schemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityInvertColors) var invertColors

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack {
                    Button("button 1") {
                        
                    }
                    .foregroundStyle(schemeContrast == .increased ? .white : .primary)
                    .buttonStyle(.borderedProminent)
                    
                    Button("button 2") {
                        
                    }
                    .foregroundStyle(Color.primary)
                    .buttonStyle(.borderedProminent)
                    .tint(.orange)
                    
                    Button("button 3") {
                        
                    }
                    .foregroundStyle(invertColors ? Color.black : Color.white)
                    .foregroundStyle(Color.primary)
                    .buttonStyle(.borderedProminent)
                    .tint(invertColors ? Color.purple : Color.green)
                    
                    Button("button 4") {
                        
                    }
                    .foregroundStyle(differentiateWithoutColor ? .white : .green)
                    .buttonStyle(.borderedProminent)
                    .tint(differentiateWithoutColor ? .black : .purple)
                    
                    
                }
                .font(.largeTitle)
                .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .background(reduceTransparency ? Color.gray.opacity(0.5) : Color.gray)
            .navigationTitle("Accesibility Colors")
        }
    }
}

#Preview {
    AccesibilityDynamicColors()
}

// small summary
/*
 Dynamic Colors Accesibility
 merupakan sebuah aksesibilitas warna dimana bisa berubah atau menyesuaikan dengan kondisi user

Aturan Contrast Ratio berdasarkan Web Content Accesibility Guidelines (WCAG)
 Digunakan untuk pemilihan warna pada aplikasi agar support dynamic type, sangat penting bagi UI/UX designer
 WCAG 2.0 Level AA
    1. Minimal berada pada 4.5:1 u/ normal text
    2. Minimal berada pada   3:1 u/ large text
 
 WCAG 2.1
    1. Minimal berada pada 3:1 u/ grafik dan UI components seperti border pada input form
 
 WCAG Level AAA
    1. Minimal berada pada   7:1 u/ normal text
    2. Minimal berada pada 4.5:1 u/ large text
 
 Modifier baru
 1. @Environment(\.AccesibilityReduceTransparency) berguna untuk memberikan dynamic color ketika menggunakan reduce transparency ketika mengaturnya di setelan/pengaturan. berkaitan dengan background materials dan sebagainya
 
 2. @Environment(\.colorSchemeContrast) berguna untuk memberikan dynamic color berkaitan dengan ketajaman gambar dan gelap terang dari sebuah element, meningkatkan antara foreground dengan background color agar lebih tajam. biasanya digunakan pada bordering dan background agar lebih tajam
        Untuk membantu orang yang memiliki gangguan penglihatan agar lebih jelas untuk melihat objek atau elemen yang ada pada UI
                ex: misalkan warna tombol awalnya putih menjadi abu-abu
 
 3. @Environment(\.accessibilityDifferentiateWithoutColor) digunakan untuk memberikan dynamic colors berkaitan dengan foreground dan background atau element lainnya agar lebih berbeda warnanya.
        Untuk membantu orang yang memiliki masalah pada pengelompokan warna atau Buta Warna
 
 4. @Environment(\.accessibilityInvertColors) var invertColors digunakan untuk memberikan dynamic colors berkaitan dengan mengubah warna dari putih menjadi hitam, IOS 11 dikenalkan dan di IOS 13 ada Dark Mode
 */
