//
//  ExtractingFunctionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/11/23.
//

import SwiftUI

struct ExtractingFunctionBootcamp: View {
    
    @State private var backgroundColor: Color = Color.pink
    var body: some View {
        ZStack {
            // background layer
            backgroundColor
                .ignoresSafeArea()
            
            
            // content layer
            contentLayer
            
        }
    }
    
    // extracting view to variable
    var contentLayer: some View {
        
        VStack {
            Text("Title")
                .font(.title)
            
            HStack {
                Button("PRESS ME!") {
                    // example of extracting functions call
                    ButtonPressed()
                }
                .foregroundColor(.white)
                .padding(.all, 15)
                .background(Color.black)
                .cornerRadius(10)

                Button("DEFAULT!") {
                    // example of extracting functions call
                    ButtonPressed1()
                }
                .foregroundColor(.white)
                .padding(.all, 15)
                .background(Color.black)
                .cornerRadius(10)
             
                
            
            }
            }

    }
    
    
    // example extracting functions made.
    private func ButtonPressed() {
        backgroundColor = Color.yellow
    }
    
    private func ButtonPressed1() {
        backgroundColor = Color.pink
    }
}

struct ExtractingFunctionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingFunctionBootcamp()
    }
}

// small summary
/*
 extracting Functions
 
 merupakan salah satu cara untuk mengekstrak menjadi fungsi yang ada didalam views berupa argument actions pada button dan kasus sebagainya. merupakan salah satu cara agar membuat CleanCode yang menjadikan body bersih dan enak dilihat. dan mudah untuk di debug
 kita bisa menaruh extracting functions di beberapa file terpisah untuk menjadikannya jauh lebih clean.
 
 
 extraacting function berguna untuk membuat sebuah katakanlah di conto kasus adalah action dari button dimana apabila di real apps mungkin sangatlah panjang. di ekstrak ke function dnegan mengingat basic Swift Lang dan diterapkan di code.
 
 cara tau definisi dari function yang di call dengan klik command + jump to definition
 
 
 keuntungan
 1. code jauh lebih clean
 2. mudah mengarrange apabila ingin maintenance atau pembaharuan fitur.
 
 
 
 Extracting view to variable dimana mengekstrak view dnegan membuat variable baru dan dipanggil kedalam main atau body variable. FWI body merupakan yang paling utama dipanggil ketika membuat sebuah ui.
 kasus ini bagus apabila tidak ada yang perlu dirubah. tetapi kalo ada yang dirubah gunakan extracting subviews
 */
