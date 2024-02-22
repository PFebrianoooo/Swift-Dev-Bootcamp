//
//  Gradients.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/11/23.
//

import SwiftUI

struct GradientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(
//                Color.red
                
//                LinearGradient(
//                    gradient: Gradient(colors: [Color.blue, Color.gray, Color.white]),
//                    startPoint: .topLeading,
//                    endPoint: .bottom)
                
//                RadialGradient(
//                    gradient: Gradient(colors: [Color.orange, Color.gray, Color.black]),
//                    center: .topLeading,
//                    startRadius: 10,
//                    endRadius: 300)

                AngularGradient(
                    gradient: Gradient(colors: [Color.orange, Color.gray, Color.black]),
                    center: .topLeading,
                    angle: .degrees(90 + 45))
            
            
            )
            .frame(width: 300, height: 200)
    }
}

struct GradientsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GradientsBootcamp()
    }
}


// Small Summary
/*
 Linier Gradients
 LinierGradients(Gradient: Gradient(), startPoint: , endPoint: )
 
 Pada Gradient berisi array warna yang digunakan untuk mengisi warna di object.
 Pada startpoint berisi dimana dimulainya si gradients, opsinya. leading, trailing, top
 Pada endpoint berisi dimana akhiran dari si gradients opsinya trailing, leading, bottom
 
 linier gradients artinya warna dari 2 komponent yaitu starts dan end
 
 
 Radial Gradients
 RadialGradients()
 
 RadialGradients(gradients: , center: , startRadius: , endRadius: )
 
 gradients berisi array warna yang digunakan untuk mengisi warna pada objects
 center artinya warna diumai dari tengah dan di libnya berisi. top, topLeading etc.
 starts radius artinya warna pertama dimulai dari raius keberapa.
 end radius artinya warna terakhir lebarnya sampai radius berapa.
 
 Radial Gradients artinya warna yang hanya dari 1 start possition saja
 
 
 Angular Gradients
 AngularGradient(gradient: Gradient, center: UnitPoint, angle: Angle)
 
 pada gradients berisi array warna yang digunakan.
 unitPoint artinya dimulai dari atau titik utama warna pertama dan setelahnya.
 Angle artinya angle yang digunakan bisa menggunakan derajat atau x and y coordinates.
 */
