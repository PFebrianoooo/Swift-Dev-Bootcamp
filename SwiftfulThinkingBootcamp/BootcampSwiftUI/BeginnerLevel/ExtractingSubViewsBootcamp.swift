//
//  ExtractingSubViewsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/11/23.
//

import SwiftUI

struct ExtractingSubViewsBootcamp: View {
    var body: some View {
        ZStack {
            // background layer
            Color.blue
                .ignoresSafeArea()
            
            // content layers
            fruitLayerView
        }
    }
    
    
    
    // definition
    // implementasi dari extracting subview to variable
    var fruitLayerView: some View {
        HStack {
            // implement extracting subview to struct and call here
            FruitView(number: 10, nameFruit: "Apples", background: .red)
            FruitView(number: 20, nameFruit: "Mangosteen", background: .purple)
            FruitView(number: 30, nameFruit: "Bananas", background: .yellow)
        }

    }
}

struct ExtractingSubViewsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ExtractingSubViewsBootcamp()
    }
}

// Small summary
/*
 extracting subviews
 merupakan cara untuk extract subviews dimana terdpat view utama dan didalam view yang berisi view diekstrak menjadi own view. bisa ditaruh di file lainnya berbentuk swiftUI view atau disatukan didalam file. better dibendakan filenya
 
 fungsi utama dari extrating subiews untuk menggunakan kembali apabila view ignin digunakan dnegan kolaborasi menggunakan initializers.
 dimana hasil ekstrakannya dapat dipergunakan kembali dan menghindari yang namanya dry(dont repeat yourself)
 
 command + arahkan kurson untuk view yang dimau
 
 extracting subviews bagus untuk view yang dapat berubah atau dinamic. tetapi kalo view nya statis maka gunakan extracting subviews to variable.
 jadi apabila view nya dinamic dan dipergunakan kembali maka gunakanlah extracting subview to Struct, dan apabila view nya static maka gunakan extracting subview to variable.
 */







// extracting view collections

struct FruitView: View {
    let number: Int
    let nameFruit: String
    let background: Color
    
    var body: some View {
        VStack {
            Text ("\(number)")
            Text(nameFruit.capitalized) // apanila sama sama string maka tidak perlu string interpolation
        }
        .foregroundColor(.white)
        .padding(.all, 10)
        .background(background)
        .cornerRadius(10)
    }
}
