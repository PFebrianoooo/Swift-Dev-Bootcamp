//
//  SpacerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/11/23.
//

import SwiftUI


struct SpacerBootcamp: View {
    var body: some View {
        
        // spacer mereview diri atau cara penggunaan secara real world example.
//        VStack() {
//            Text("Hello spacer Bootcamp")
//                .font(.subheadline)
//                .foregroundColor(.white)
//
//            Text("Hello there")
//                .font(.caption)
//                .foregroundColor(.white)
//
//            Spacer()
//
//            Image(systemName: "house.fill")
//                .resizable()
//                .frame(width: 50, height: 50)
//        }
//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color.red)
//                .frame(width: 200, height: 100)
//        )
//        .padding(.vertical, 5)
//        .frame(width: 200, height: 100)
        
        
//       spacer bootcamp
//        HStack (spacing: nil) {
//
//            Rectangle()
//                .fill(Color.black)
//                .frame(width: 100, height: 100)
//
//            Spacer()
//                .frame(height: 20)
//                .background(.orange)
//
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 100)
//        }
//        .background(.blue)

//        real woorld example how to use spacer.
        VStack {
            HStack {
                Image(systemName: "xmark")
                    .bold()
                    .font(.largeTitle)
                
                Spacer()
                
                Image(systemName: "gear")
                    .bold()
                    .font(.largeTitle)
            }
            .background(Color.yellow)
            .cornerRadius(10)
            .padding(.horizontal)
            .background(Color.red)
            .cornerRadius(10)

            Spacer()
                .frame(width: 30)
                .background(Color.red)
                .cornerRadius(10)
        }
    }
}

struct SpacerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SpacerBootcamp()
    }
}

// my small summary.
/*
 Spacer()
 spacer merupakan fungsi yang berguna untuk melakukan manipulasi stacking, yang memaksa objek agar move ke bagian yang paling jauh satu sama lainnya. dimana apabila tidak di framekan maka objek akan menyentuh bagian ujung dari layar canvas, dan apabila di framekan maka akan menyentuh width atau height atau batas pada frame tersebut.
 
 spacer akan berteman baik dengan frame dan padding untuk membuat tampilan ui menjadi lebih proper untuk dilihat.
 
 inisialisasi
 Spacer()
 
 Spacer(minHeight: )
 dugunakan untuk mengatur minimum kelebara dari spacer, by default spacer mengikuti height atau width layar, tetapi bisa di set dengan min height.
 gampangnya begini, apabila space yang diberikan terlalu banyak maka bisa di set dengan menggunakan minHeight.
 

 */
