//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/03/24.
//

import SwiftUI

struct MovieModel: Hashable {
    // scenario
    /*
     misalkan kita mau membuat netflix app, dimana kita harus membuat data model
     untuk aplikasi netflix kita
     */
    let title: String
    let director: String
    let countWatch: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + director)
    }
}

// scenario
/*
 jadi kita ingin membuat tambahan fitur seperti movie yang sebelumnya disekenariokan. kita perlu datamodel yang sama seperti movie model. /* kita membuat struct baru */

 kalo membaut struct baru, maka fungsi yang berkaitan dengan movie model, akan di buat kembali.
 untuk mengakali itu kita gunakan typealias.
 keuntungannya, kita memiliki nama yang baru untuk TvModel tetapi mendapatkan keuntungan untuk memilikis semua fungsi yang berkaitan dengan movie model.
 */
typealias TvModel = MovieModel

struct TypealiasBootcamp: View {
        
//    @State var items: [MovieModel] = [MovieModel(title: "Valkyrie", director: "Mark Wahlberg", countWatch: 100000)]
    @State var items: [TvModel] = [TvModel(title: "Valkyrie", director: "Mark Wahlberg", countWatch: 100000)]
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(items, id: \.self) { data in
                Text(data.title)
                
                Text(data.director)
                
                Text("\(data.countWatch)")
            }
        }
    }
}

#Preview {
    TypealiasBootcamp()
}

// small summary
/*
 Typealias Bootcamp
 pemberian nama samaran atau nama lain, yang fungsinya untuk memberikan sebuah nama lain untuk tipedata
 
 typealias numeric = Int64
 
 */
