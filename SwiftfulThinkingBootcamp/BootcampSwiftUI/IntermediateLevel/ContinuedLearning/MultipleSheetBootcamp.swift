//
//  MultipleSheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/03/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

struct MultipleSheetBootcamp: View {
    // cara ketiga
    @State var randomModel: RandomModel?
    
    // pennggunaan dibawah in ihanya untuk cara kesatu dan kedua
//    @State var randomModel: RandomModel = RandomModel(title: "STARTING TITTLE")
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    var body: some View {
//      caraKesatu
//      caraKedua
        caraKetiga
        
        
    }
    var caraKetiga: some View {
        // menggunakan randomModel optional dan menggunakan .sheet itemCompletion
        /*
         1. jauh lebih mantap dan scalable penggunaanya
         2. bisa digunakan untuk banyak view yang bahkan jumlahnya puluhan atau bahkan ratusan
         */
        ScrollView {
            VStack(spacing: 20) {
    //            Button("Button 1") {
    //               randomModel = RandomModel(title: "ONE")
    //            }
    //            .buttonStyle(.borderedProminent)
    //
    //
    //            Button("Button 2") {
    //                randomModel = RandomModel(title: "TWO")
    //            }
    //            .buttonStyle(.borderedProminent)
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                       randomModel = RandomModel(title: "\(index)")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.vertical)
            .frame(maxWidth:  .infinity)
            .sheet(item: $randomModel) {  model in
                sheetView(selectedModel: model)
            }
        }
        .scrollIndicators(.hidden)
    }
    
    
//    var caraKedua: some View {
//        // Use Multiple Sheet untuk setiap toggling
//        /*
//         Kekurangan dan kelebihan
//         1. apabila viewnya banyak dan beragam, maka state variable akan banyak juga, imbasnya jadi sangat menggangu.
//         2. cocok untuk view dimana berjumlah 2 s/d 5 buah sheet dalam suatu view.
//         */
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                showSheet.toggle()
//            }
//            .buttonStyle(.borderedProminent)
//            // MARK: Cara ke-2
//            .sheet(isPresented: $showSheet) {
//                sheetView(selectedModel: RandomModel(title: "ONE"))
//            }
//
//                        
//            
//            Button("Button 2") {
//                showSheet2.toggle()
//            }
//            .buttonStyle(.borderedProminent)
//            // MARK: Cara ke-2
//            .sheet(isPresented: $showSheet2) {
//                sheetView(selectedModel: RandomModel(title: "TWO"))
//            }
//        }
//    }
    
    
//    var caraKesatu: some View {
//         // Use binding variable
//        /*
//         kekurangan:
//         1. apabiila di sheetView menggunakan banyak logic didalamnya, binding tidak bisa digunakan
//         2. apabila di sheetView menggunakan spesifik data model maka binding tidak bisa digunakan
//         */
//        VStack(spacing: 20) {
//            Button("Button 1") {
//                randomModel = RandomModel(title: "One")
//                showSheet.toggle()
//            }
//            .buttonStyle(.borderedProminent)
//            
//            
//            Button("Button 2") {
//                randomModel = RandomModel(title: "Two")
//                showSheet.toggle()
//            }
//            .buttonStyle(.borderedProminent)
//            .sheet(isPresented: $showSheet) {
//                // jangan gunakan logical apapun disini.
//                // MARK: Cara ke-1
//                sheetView(selectedModel: $randomModel)
//                
//            }
//
//        }
//    }
}


struct sheetView: View {
// MARK: Cara ke-1
//    @Binding var selectedModel: RandomModel
    
// MARK: Cara ke-2
    let selectedModel: RandomModel
    
    var body: some View {
        VStack {
            Text(selectedModel.title)
                .font(.largeTitle)

            Text(selectedModel.id)
                .font(.callout)
        }
    }
}


#Preview {
    NavigationStack {
        MultipleSheetBootcamp()
            .navigationTitle("Multiple Sheets")
            .navigationBarTitleDisplayMode(.automatic)
    }
    
}

// small summary

/*
 Multiple Sheet Bootcamp
 Present Multiple Sheet Bootcamp merupakan sebuah cara untuk mempresent/mempresentasikan sheet dalam single view, sehingga kita tidak perlu untuk membuat hseet yang banyak untuk membuat sebuah sheet didalam sebuah view.
 
 
 Multiple sheet dibagi Kedalam Beberapa cara
 1. Use binding di sheetView
 2. Use Multiple Sheet
 3. Use $item

 Penggunaan sheet untuk multiple menggunakan completion di bawah ini, yang merupakan cara ke-3
        .sheet(item: Binding, content: View-identifiable)
 
  
 
 */
