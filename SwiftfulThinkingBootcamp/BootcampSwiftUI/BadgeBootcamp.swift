//
//  BadgeBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct BadgeBootcamp: View {
    @State private var listFruits: [String] = ["Watermelon", "banana", "mangosteen", "avocado"]
    var body: some View {
        TabView {
            newViewList(listFruits: $listFruits)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .badge(countData())
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .badge(10000)
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Profile")
                }
                .badge("New")
        }
        .tint(Color.black)
        
        
        
    }
    func countData() -> Int {
        let counting = listFruits.count
        return counting
    }
}


struct newViewList: View {
    @Binding var listFruits: [String]
    var body: some View {
        VStack {
            List {
                ForEach(listFruits, id: \.self) { items in
                    Text(items.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .badge(numericData())
                }
                .onDelete(perform: deleteItem)
            }
            
            Button("Add Items") {
                addItems()
            }
            .fontWeight(.semibold)
            .buttonStyle(.borderedProminent)
            
        }
    }
    
    func deleteItem(indexset: IndexSet) {
        listFruits.remove(atOffsets: indexset)
    }
    func addItems() {
        listFruits.append("Buah Bernuk")
    }
    func numericData() -> Int {
        let counting = listFruits.count
        return counting
    }

}


struct BadgeBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBootcamp()
    }
}

// small summary
// badge Bootcamp
/*
 badge adalah penanda sepeert overlay pada bagian ujung kanan layar. dimana badge bisa digunakan pada tabbar dan list. dulu hanya ada di UIKit, sekarang sudah ada di swift UI . khsususnya versi ios 15 higher.
 badge bisa digunakan untuk menghitung jumlah atau berapa yang ada di dalam sebuah view, dan juga berpa jumlah notifikasi pada view.
 
 gunakan badge pada
 // list
 // tabView
 
 pada counting badge gunakan text atau Integer value
 badge juga bisa digunakan untuk cart list untuk mengetahui berapa banyak didalamnyaa
 */

