//
//  ImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/11/23.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        // image biasa
//        Image("Image-2")
//            .resizable()
//            .scaledToFill()
////            .scaledToFit()
////            .cornerRadius(30)
//            .frame(width: 250 , height: 200)
//            .clipShape(
////                Circle()
////                Rectangle()
//                RoundedRectangle(cornerRadius: 30)
////                Ellipse()
//            )
        
        
        // image yang mau dijadikan ikon atau button
        Image("Image-2")
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .foregroundColor(.red)
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}


// My Summary
// How to add image in Swift
/*
 calling Image
 Image(name: string)
 
 Modifiernya.
 .Resizeable() untuk meriset gambar agar bisa dilakukan framing (.frame())
 .frame() untuk memberikan batasan kepada gambar yang sudah di resizeable.
 .scaledToFit() untuk memberikan fitment kepada gambar sesui dengan frame
 .scaledToFill() untuk memeberikan fillment kepada gambar sesuai dengan frame
 .clipped() memotong gambar yang berlebih pada frame sesuai dengan scaled to fit atau fill.
 .cornerradius() memberikan setiap sudut tumpul daan juga bisa menjadikan lingkaran
 .clipShape() memberikan shaping pemotongan sesuai dnegan shape yang sudah dipelajari di shape bootcamp, Ellipse, circle, RoundedRectangle, capsule
 
 
 Image yang digunakan untuk template icons.
 Image("")
 
 Modifiernya.
 .renderingMode(.template) untuk merender image agar bisa dirubah warnanya, diletakkan sebelum .resizeable(), Template berfungsi untuk meriset dan menggunakan setelan foreground color agar bisa di custom sesuai dg kemauan programmer dan berdasarkan design Ui applikasi.
 .foregroundColor() merubah image yang mau dijadikan ikon.
 
 modifier yang dugunakan untuk template icons berguna saat Image memiliki latar belakang yang transparent, tidak berlaku untuk image yang berlatar belakang
 Dan sisa modifier yang digunakan pada Image standard juga dapat digunakan di Image untuk ikon
 
 

 
 */

