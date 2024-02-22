//
//  InitsAndEnumsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/11/23.
//

import SwiftUI

struct InitsAndEnumsBootcamp: View {
    // first material
//    let title = "Strawberry"
//    let number = 5
//    let background = Color.red
    
//    second material
//    let title : String
//    let number : Int
//    let background : Color
//
//    init(title: String = "Strawberry", number: Int = 0, background: Color = .red) {
//        self.title = title
//        self.number = number
//        self.background = background
//    }
    
    
//    third material
    let number: Int
    let title: String // kenapa inti tidak fruits karena ini nilai standar untuk refers ke ui
    let background: Color
    
    init(number: Int, title: fruits) {
        self.number = number
        
        if title == .Apple {
            self.background = .red
            self.title = "apples" // contohnya dari refercing nya.
        }else {
            self.background = .orange
            self.title = "oranges" // contohnya dari refercing nya.
        }
        
    }
    
    enum fruits {
        case Orange
        case Apple
    }
    
        
    
    
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.largeTitle)
                .foregroundColor(Color.white)
            
            Text("\(title)")
                .font(.title3)
                .foregroundColor(Color.white)
            
        }
        .frame(width: 150, height: 150)
        .background(background)
        .cornerRadius(15)
        
    }
}

struct InitsAndEnumsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        first material
//        InitsAndEnumsBootcamp(title: "Strawberry", number: 10, background: .blue )
        
//        second material
//        InitsAndEnumsBootcamp(title: "Melons", number: 10, background: .green)
        
//        third material
//        InitsAndEnumsBootcamp(number: 100,title: .Apple )
        
//        fourth material
        HStack {
            InitsAndEnumsBootcamp(number: 100, title: .Apple)
            
            InitsAndEnumsBootcamp(number: 100, title: .Orange)
            
        }
    }
}



// my small summary
/*
 init dan enums
init pada view berguna untuk menginisialisasi bisa juga sebuah background yang dapat berubah ubah dengan view yang sama.
 
 enums atau enumerations merupakan penomoran yang digunakan untuk memberikan opsi,
 misalkan pada map app membutuhkan direction atau arah mata angin dimana kita bisa menggunakan mata angin dengan enum, sehingga kode kita bisa lebih efficient dan lebih clean.
 
 contohnya:
 var windDirection: directions
 
 enums directions {
    case north, west , south ,east
 }
 
 user case enums
 1. untuk mendefinisikan sf symbols kedalam source code file
 
 
 catatan
 passing data didalam ui menggunakan variable yang sudah di definisikan pada struck sebelumnya atau bisa menggunakan variable local yang didefinisikan di ui langsung
*/


// jadi initinya init itu digunakan pada swift ui ada karena perulangan penulisan code yang bersifat sama pada UI. kenapa ga kita bikin aja ui nya 1 dan digunakan berkali kali menggunakan init dimana ditulis dibawah struct ui menggunakan let atau constant

