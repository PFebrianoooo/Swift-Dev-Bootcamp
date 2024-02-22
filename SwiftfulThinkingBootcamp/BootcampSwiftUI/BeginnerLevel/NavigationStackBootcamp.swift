//
//  NavigationStackBootcamps.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/12/23.
//

import SwiftUI

struct NavigationStackBootcamps: View {
//    not identifiable but hashable
    private let fruits: [String] = ["apples", "banana", "watermelon"]
    @State private var bindingData: [String] = []
    var body: some View {
        NavigationStack(path: $bindingData) {
//        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // data custom dan harus dihashable protocol apabila custom data arrays
                    ForEach(fruits,id: \.self) { fruitsArrays in
                        NavigationLink(value: fruitsArrays) {
                            HStack {
                                Image(systemName: "calendar ")
                                Text("This is bootcamp swift ui")
                            }
                        }
                    }
                    // untuk data non custom
//                    ForEach(0..<10) { items in
//                        NavigationLink(value: items) {
//                            Text("HEllo there \(items)".capitalized)
//                        }
//                    }
                }
            }
            .navigationTitle("BOotcamp swift UI".capitalized)
            // kalo kita mau bikin sebuah data model dan di assign ke sini. maka hasu menggunakan protocol Hashable
            .navigationDestination(for: String.self) { x in
                varLayar(value: x)
                
            }
//            .navigationDestination(for: Hashable.Protocol) { items in
                // kita bisa menstackan beberapa destiations for multiple tipe data yang berbeda. gampangya kita bisa menstackan beberapa custom tipe data berbeda
//            }
            
        }
    }
}

struct varLayar: View {
    let  value: String
    init(value: String) {
        self.value = value
        print("init ke- \(value)")
    }
    var body: some View {
        Text("Hellot")
    }
}

struct NavigationStackBootcamps_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackBootcamps()
    }
}

// small summary
// Navigation Stack
/*
 navigationstack adalah container dimana kita bisa menambahkan sebuah button dibagian atas layar dan juga menambahkan sebuah button diatas leading adn trailing sebuah view, dan navigation stack bisa menggunakan navigation stack sebagai modifier atau component dari navigation stack
 
 keutnungan menggunakan navigation stack adalah membolehkan aplikasi lebih scallable dan cepat. karena di sebelumnya navigation view, di init dulu, tetapi di nav stack di init pada saat di click
 
 
 pada navigation stack path binding kita merefers ke path dimana path bisa saja. berada paa view model. dan path gampangny adalah navigation stack akan melihat dari pada tipe data di path nya. jadi si int yang destination itu tidak bisa karena tipe datanya berbeda.
 
 kasus pada datacustom struct jadi apabila kita binding publisher data array kosongan di view model. maka destination yang selain data di binding tidak bisa melakukan segue layar. karena di path. artinya hey liat di view model tipe data binding. segue apabila dia memiliki tipedata ini. kalo tidak abaikan.
 
 keuntungan menggunakan navstack
 1. super segue layar
 2. binding path
 
 */
