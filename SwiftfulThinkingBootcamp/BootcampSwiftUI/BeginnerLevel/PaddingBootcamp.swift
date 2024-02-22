//
//  PaddingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/11/23.
//

import SwiftUI

struct PaddingBootcamp: View {
    var body: some View {
//        Text("Hello world")
//            .background(Color.green)
//            .padding(.all)
//            .background(Color.accentColor)
        
//        real life cases 1
//        Text("Real life cases")
//            .font(.largeTitle)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.accentColor)
//            .padding(.all)
        
//        real life cases 2
        VStack(alignment: .leading, spacing: 30) {
            Text("Hello Real Cases")
                .font(.title)
                .bold()
                .padding(.top)
            
            Text("Hello this is real word example how to use a padding, ahd its useful for arrange data in multinine comment. this is just ax blank explanation how to use a padding inreal world example")
                .padding(.bottom, 30)
        }
        .padding(.all)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: Color.black,
                        radius: 15,
                        x: 0.0, y: 10
                       )
        )
    }
}



struct PaddingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PaddingBootcamp()
    }
}

// My Small Summary
/*
 padding digunakan untuk memberikan memberikan space kepada object dimana pada padding bisa membuat objects out atau in. Padding .all merupakan defaukt arguments on padding.
 padding bersifat dinamis sedangkan frame bersifat statis
 ukuran padding by default adalah 10px and .all
  Declaring a padding in modifier and edited
 .padding()
 
 we can set manually by:
    .padding(.all, size)
            example  -> .padding(.vertical, 10)
 
    attributes terdiri atas.
        top, left, bottom, right, vertical, horizontal
 
 
 padding biasanya bekerja sebelum deklarasi frame
 
 misalkan
 .padding()
 .frame()
 
 apabila padding ditaruh sesudah frame maka argumen padding tidak atau diabaikan oleh compiler.
 
 
 
 
 */
