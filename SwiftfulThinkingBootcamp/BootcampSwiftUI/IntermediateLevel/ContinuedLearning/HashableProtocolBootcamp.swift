//
//  HashableProtocolBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 06/03/24.
//

import SwiftUI

struct CustomDataModel: Hashable {
    let title: String
    
    func hash(into hasher: inout Hasher) {
        /*
         Merupakan sebuah fungsi untuk memberikan sebuah id dimana id tersebut merupakan sebuah variable, yaitu title dimana constant tersebut string.
         Kalo kita punya banyak value di dalam struct nya maka bisa ditambahkan di combine nya.
         keuntungaan:
            1. jika memiliki value atau isi di variablenya sama, maka akan tetap berbeda, karena kita memberikan tambahan id untuk memberikan id yang lebih unik lagi
         */
        hasher.combine(title)
    }
    
}

struct HashableProtocolBootcamp: View {
    let dataArray: [CustomDataModel] = [
        /*
         yangg terjadi disini adalah
         1. ketika menggunakan array data model ini, maka String langsung conforms to Hashable
         2. maksud \.self adalah memberikan unique id kepada setiap items didalam DataArray untuk diberikan id yang unique di setiap isinya.
         */
//    "One", "Two", "Three", "Four", "Five"
        
        CustomDataModel(title: "Jamal 1"),
        CustomDataModel(title: "Jamal 2"),
        CustomDataModel(title: "Jamal 3"),
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(dataArray, id: \.self) { items in
                Text(items.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                // melihat id setiap items didalam DataArray
                Text(items.hashValue.description)
            }
        }
    }
}

#Preview {
    HashableProtocolBootcamp()
}

// small summary
/*
 Hashable Protocol
 Hashable Protocol merupaakan sebuah another type untuk memberikan unique Id dala bentuk lain, Contohnya dalam indentifiable kita bisa memberikan unique id dengan menggunakan contstant id kepada setiap item agar unique, hashable protocol merupakan bentuk lain daripada pemberian id.
 
    Penggunaan Hashing di Swift
    1. Dalam looping
 
    Penggunaan Hashing di dalam Profesi IT
    1. Web Development
    2. Mobile applications Developer/Engineer
    3. Dan lain Sebagainya
 
 // Apabila menggunakan indetifiable protocol
 
     struct DataModel: identifiable {
     let id: String = UUID().uuidString
     let name: Sting
     let class: String
     }
 alasan :
 1. kita tidak ingin developer lain menggunakan id ini dengan keperluan lain.
 2. kita tidak ingin membaut developer lalin kebingungan dengan id apa ini
 3. kadang kita juag tidak mau kalo punya id disitu
 Dengan alasan itulah kita menngunakan Hashable Protocol
 
 // apabila menggunakan Hashable Protocol
 struct DataModel: Hashable {
    
 }
 */
