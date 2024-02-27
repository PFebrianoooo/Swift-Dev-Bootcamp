//
//  customModelData.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 24/12/23.
//

import SwiftUI
import Foundation
struct UserModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let userName: String
    let followersCount: Int
    let isVerified: Bool
}

struct customModelData: View {
    @State private var listUsers: [UserModel] = [
        UserModel(name: "Putra Pebriano", userName: "P.Febrianoo_", followersCount: 400, isVerified: true),
        UserModel(name: "Bagoes Baihaqi", userName: "bagoes.b.i", followersCount: 700, isVerified: true),
        UserModel(name: "Muhammad Panji", userName: "Mhmd_Panji", followersCount: 1000, isVerified: true),
        UserModel(name: "Foto Kopi Keluarga", userName: "FC_Family", followersCount: 2000, isVerified: false)
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(listUsers) { items in
                    HStack {
                            Circle()
                            .frame(width: 40, height: 40)
                            
                            
                            
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 0){
                                Text(items.name)
                                    .fontWeight(.semibold)
                                
                                // MARK: cara kesatu untuk if else statement
//                                Image(systemName: items.isVerified ? "checkmark.seal.fill" : "none" )
//                                    .imageScale(.small)
//                                    .foregroundColor(items.isVerified ? .blue : .red)

                                // MARK: cara kedua untuk if else statement
                                if items.isVerified == true {
                                    Image(systemName: "checkmark.seal.fill")
                                        .imageScale(.small)
                                        .foregroundStyle(Color.blue)
                                }else {
                                    Image(systemName: "none")
                                        .imageScale(.small)
                                        .foregroundStyle(Color.red)
                                }
                                
                            }
                            
                            Text("@\(items.userName)")
                                .font(.caption)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        VStack {
                            Text("\(items.followersCount)")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                            Text("Followers")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                        
                        
                    }
                }
            }
            .navigationTitle("Users List")
        }
    }
}

struct customModelData_Previews: PreviewProvider {
    static var previews: some View {
        customModelData()
    }
}

// custom data model use struct.
// small summary
/*
 custom data model adalah memberikan sebuah modifier lengkap kepada sesuatu/objek. misalkan pada sebelumnya hanya bermain dengan title saja untuk menampilkan judul video. sekarang kita bisa memberikan sebuah data buku lengkap untuk ditampilkan. misalkan ada judulnya, nama penulisnya, tahun terbitnya , dan lain sebagainya yang diperlukan oleh objek.
 
 custom data model bisa dipindahkan ke file file.swift using foundations. dan direferskan sebagai model dalam MVVM architecture
 
 M : Model (data models) use foundations data and any other.
 V : View ( Couple of views represent a model ) user swift UI
 VM : View Model ( Logic App or behavior app ) use class reference
 
 hashable: seperti indexing dimana pada array memiliki hash dimulai dari hash 0 s/d batas, dan apabila dikasih id maka setiap indexnya berubah menjadi id
 
 identifiable: protokol yang digunakan untuk memberikan stable identitas kepada id, baik pada id bikinan atau custom atau id pada database record. Jadi semua nya stabil id nya.
 
 id: kalo pada database pasti memiliki id, dan apabila ditarik ke ui, maka setiap components memiliki id, dan pasti diberikan oleh back end. dan perlu conform to hashable. pemberian nama unik dan berbeda kepada sebuah data set.
 
 
 
 jadi penerapannya
 fun fact
 1. semua yang berada dalam aplokasi memiliki data model masing masing.
    mislakan instagram, memiliki data model user, memiliki data model postingan user, dan postingan feed instagram. hampir seluruh aplikasi memiliki data model.
 
 
 */
