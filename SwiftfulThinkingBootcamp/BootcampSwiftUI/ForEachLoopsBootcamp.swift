//
//  ForEachLoopsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 17/11/23.
//

import SwiftUI
struct model: Identifiable {
    let id = UUID().uuidString
    let name : String
    let title: String
    let background: Color
}

var dataModel: [model] = [
    model(name: "Jamal", title: "Ismail bin mail", background: Color.red),
    model(name: "ricko", title: "nganggong", background: Color.blue),
    model(name: "Erlangs", title: "Salam pahah", background: Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))

]
struct ForEachLoopsBootcamp: View {
//    var name: [String] = ["Hello jamal", "Hello rabona", "Hello neymar", "Hello jigaraku"]
    
//    definition atau deklarasi untuk mengambil semua value array
    let idm = dataModel
    
//    let attibutesArray: model
//    ini digunakan untuk mengambil semua attrubut pada si struct
    
    var body: some View {
                
//        VStack {
//            ForEach (0..<5) { data in
//                HStack {
//                    Circle()
//                        .frame(width: 25, height: 25)
//
//                    Text("Hello worlds hahay : \(data)")
//                }
//
//
//            }
//        }
        
//        VStack {
//            ForEach(name.indices) { data in
//             Text("hola and \(name[data])")
//            }
//        }
        
        
        // implementation with ns uuid made by systems
//        VStack {
//            ForEach(idm) { model in
//                VStack {
//                    Text("Hello mr \(model.name)")
//                    Text("Your tittle is \(model.title)")
//                }
//            }
            
           
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(idm) { model in
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack {
                                Text ("\(model.title)")
                                
                                Text ("Arange by : \(model.name)")
                                    .font(.caption)
                                    .bold()
                           }
                        }
                        
                        .frame(width: 200, height: 70)
                        .background(model.background)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 5)
            }
            
        }
    }
}


struct ForEachLoopsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ForEachLoopsBootcamp()
    }
}


// my small summary
/*
 for each loop adalah looping dimana foreach loop sama halnya dnegan for in loop, in ios development, looping yang digunkan hanya looping for in loop
 
 for each loop dibagi menjadi 3
 1. ForEach(<#T##data: Range<Int>##Range<Int>#>, content: <#T##(Int) -> _#>)
 digunakan untuk melooping berulang kali dengan specific number menggunakan perintah 0..<5
 
 2. ForEach(<#T##data: _##_#>, content: <#T##(_.Element) -> _#>)
 digunakan untuk melooping data non statid misalkan array, nah pada array bisa berupa ton of data atau berupa tittle colors and etc.
 
 3. ForEach(<#T##data: _##_#>, id: <#T##KeyPath<_.Element, _>#>, content: <#T##(_.Element) -> _#>)
 digunakan untuk melooping data dimana memiliki special id, biasanya enaknya kalo menggunakan model data custom yang memiliki uuid bisa menggunakan lopping ini dnegan syarat harus declare uuid
 let id = UUID().uuidString
 fungsi uuid adalah memberikan uniqie id kepada setiap data agar bisa menggunakan looping tanpa harus nulis indices.
 
 2.
 */
