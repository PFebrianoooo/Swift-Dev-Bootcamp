//
//  EnvironmentObject.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 26/12/23.
//

import SwiftUI

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    init() {
        getdata()
    }
    
    func getdata() {
        self.dataArray.append("IPhone")
        self.dataArray.append("Ipad")
        self.dataArray.append(contentsOf: ["Imac", "I Watch"])
    }
    
    func addData() {
        let item: String = "Aku Sayang Kamu Sahabat"
        dataArray.append(item)
    }
    
    func deleteData() {
        dataArray.remove(at: 0)
    }
}

struct EnvironmentObjectProperty: View {
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { dataArray in
                    NavigationLink {
                        detailView(textData: dataArray)
                    } label: {
                        Text(dataArray)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(0..<5) { items in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red)
                        .frame(width: 200, height: 250)
                    
                }
            }
        }
        //            .navigationTitle("EnvironmentObject")
        .environmentObject(viewModel)
    }
}

struct detailView: View {
    @Environment (\.dismiss) private var dismiss
    let textData: String
    var body: some View {
        ZStack {
            // baclgorund
            Color.orange .ignoresSafeArea()
            
            // foreground layer
            VStack {
                NavigationLink {
                    detailView1()
                } label: {
                    Text(textData)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                Button("Dismiss Button") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)

            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct detailView1: View {
    // sebagai developer harus tau bahwa ada passing data environment object di view diatasnya. dan pasti ada property yang di passing diatasnya untuk dipergunakan view dibawahnya atau sub view dibawahnya.
    @EnvironmentObject var viewModel: EnvironmentViewModel
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            // background
            LinearGradient(colors: [Color.gray, Color.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            // foreground
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.dataArray, id: \.self) { dataArray in
                        Text(dataArray)
                    }
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top)
                }
                
                Button("dismiss Button") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                
                
                Button("add items from third screen") {
                    viewModel.addData()
                }
                .buttonStyle(.borderedProminent)
                
                Button("delete items from third screen") {
                    viewModel.deleteData()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
struct EnvironmentObjectProperty_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectProperty()
    }
}

// small summary
// environment object  @environmentObject
/*
 environmentObject adalah property wrapper atau data flow untuk mempassing data secara background dalam view hirarki. object yang di passing akan mendapatkan semua property kelas.
 
 hubungan ataran environment dengan stateObject
 dimana state object akan dibuat menjadi environment. shingga sub view atau child view tidak perlu lagi memaki observedObject untuk sub view. tetapi langsung bisa menetima data model direcly
 
 
 REMEMBER
 @EnvironmentObject adalah sebuah property wrapper untuk pull atau menarik data model atau ViewModel yang sebelumnya dideklarasikan sebagai .environmentObject() untuk bisa dipergunakan bagi yang menariknya.
 
 apabiila kita menghapus data menambahkan data dari third view maka seluruh yang menginherit dari viewMOdel akan terpengaruh terhadap perubahan yang terjadi
 
 
 REKAPAN PROPERTY WRAPPER. HARUS DIINGAT TERUS
 DIMANA PADA PROPERTY WRAPPER SEMUA VIEW YANG MENGINHERIT DARI VIEWMODEL AKAN TERPENGARUH KERENA OBSERVABLE OBJECK ITU. ARTI OBESERVABLE OBJECT ADALAH OBJEK YANG DIOBSERVASI, APABILA ADA PERUBAHAN, MAKA KABARKAN KE SEMUA VIEW YANG INHERITNYA.
 STATE DIGUNAKAN UNTUK PARENT VIEW
 OBSERVEDOBJECT DIGUNAKAN UNTUK SUBVIEW
 ENVIRONMENTOBJECT DIGUNAKAN UNTUK SUB VIEW YANG LEBIH DARI DUA. YANG SEBELUMNYA HARUS DIINISISALISASI DULU DENGAN .ENVIRONMENTOBJECT()
 
 */


// 3 property wrapper
// @stateObject
// @observedObject
// @environmentObject
