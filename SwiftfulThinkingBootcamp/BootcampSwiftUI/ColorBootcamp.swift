//
//  ColorBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 03/11/23.
//

import SwiftUI

struct ColorBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(
                // SwiftUi
//                Color.mint
//                Color.secondary
//                Color.primary
                
                // Ui Kit
//                Color(uiColor: .orange)
//                Color(uiColor: .secondarySystemBackground)
                
                // Calling color Assets folder
                Color("ThemeColors")
                
            )
            .frame(width: 300, height: 150)
//            .shadow(radius: 20)
//            .shadow(color: Color.black, radius: 20)
            .shadow(color: Color.primary.opacity(0.7), radius: 30, x: -30, y:0)
    }
}

struct ColorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorBootcamp()
    }
}


// My Summary
/*
 SwiftUI Standard Liblary Colors
 Color.mint // datang dari SwiftUi liblary Colors
 primary color // merupakan warna primer saat iphone dalam posisi light mode dan dark modee, warnanya hitam (.black) dan putih (.white)
 secondary color // merupakan warna dari SwiftUI lib dengan warna konstan pada posisi light and dark mode yaitu abu abu (.grey)
 
 Ui Kit standard liblary colors
 pertama tama harus manggil Color(uiColor: . ) dulu, untuk bisa mengakses properti dari uiColors dari ui kit
 .secondarysystembackgound // pada light mode bwarna putih agak kehitaman sedikit dan pada saat dark mode agak abu abu atau hitam sedikit
 
 Menambahkan Color Assets in Projects
 Color Asets berguna untuk mengatur banyak warna baik di card items, font atau Text dan enaknya color assets adalah kita bisa menyesuakikan apapun dalam light and dark mode
 1. buka assets folder
 2. look for plus button on down menu. ( + )
 3. choose color set
 4. make your own color sets
 in darkmode atau di light mode serta pengaturan warnanya di crayons serta banyak pengaturan yang bisa dilihat ;angsung dan di apply ke UI.
 
 
 didalam shapes atau di card view atau collection view bisa menggunakan shadow atau bayangan dibelakang si collection view,
 .shadow()
        attribut shadows
            color: // mengatur warna
            radius: // mengatur radius sebaran shadow.color
            y: // mengatur si shadow mau ditaro di mana (-) sebelah bawah, (+) sebelah atas
            x: // mengatur si shadow mau ditaro di mana (-) sebelah kiri, (+) sebelah kanan
 
        unutuk x and y coordinates disesuaikan saja dengan tampilan pada live preview dan juga sesuaikan dengan desain ui yang diberikan.
 
 .opacity // digunakan untuk kecetaan warna, semakin mendekati 0.0 maka akan memudar, jika menjauhi 0.0 sampai batas maksimal 1.0 maka semakin telihat jelas warnanya
 */
