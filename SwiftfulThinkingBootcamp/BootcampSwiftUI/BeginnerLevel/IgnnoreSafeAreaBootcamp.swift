//
//  IgnnoreSafeAreaBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 22/11/23.
//

import SwiftUI

struct IgnnoreSafeAreaBootcamp: View {
    var body: some View {
        
        
        // bad practice
//        VStack {
//            Text("Hello world")
//              .padding(.top, 50)
//            Spacer()
//
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.green)
//        .ignoresSafeArea()

        
        
        // best practice using nested background
//        ScrollView(.vertical, showsIndicators: false) {
//            VStack {
//                Text("Title goes here")
//                    .font(.largeTitle)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//
//
//
//                    ForEach(0..<10) { Items in
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(height: 150)
//                            .shadow(color: .blue, radius: 10)
//                            .padding(20)
//                    }
//
//            }
//
//        }
//        .padding(.horizontal)
//        .background(
//            Color.gray
//                .ignoresSafeArea()
//        )
        
        
        
        // good practice using z stacks
//        ZStack {
//            // notice here
//            Color.red
//                .ignoresSafeArea()
//
//            VStack {
//                RoundedRectangle(cornerRadius: 15)
//                    .frame(width: 150, height: 100)
//            }
//        }
            
        

        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Text("Travels")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue)
                    .padding(.horizontal, 5)
                    
                
            }
            
        }
        .background(Color.red
            .ignoresSafeArea()
        )
    }
}

struct IgnnoreSafeAreaBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IgnnoreSafeAreaBootcamp()
    }
}


// my small summary
/*
 ignore Safe Areas
 safe area adalah sebuah wilayah yang akan menjadi tampilan daripada aplikasi iphone, gampangnya safe area adalah guide line dimana u must put your content.
 dimana apabila menaruh content diluar safe areas maka akan terpotong di beberapa device yang lebih besar ataupun yang lebih kecil.
 by default semua content berada pada safe area
 
 permasalahan.
 1. bagaimana aplikasi kita bisa fit di semua devide yang diinginkan.
    gampangnya adalah fleksibel di semua device handphone atau ipad.
 
 
 
 use Cases (Kegunaan)
 1. menggunakan background yang dapat memenuhi layar dengan menggunakan z stacks atau .backround() nested ignore safe area, backrounding image ataupun warna biasa.
 
 
 */
