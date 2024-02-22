//
//  onAppearandonDissapearBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 20/12/23.
//

import SwiftUI

struct onAppearandonDissapearBootcamp: View {
    @State private var title: String = "Start Text"
    @State private var count: Int = 0
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text(title)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: .infinity, height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.title = "this is bootcamp swift UI"
                }
                // on appear sangat bagus apabila kita menginginkan sesuatu atau vomponent assets, akan didownload ketika screen ui tampil ke layar.
            })
            
            .onDisappear(perform: {
                
            })
            .navigationTitle("On Appear \(count)")
            
        }
    }
    
    func dispatchingData(title: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.title = title
        }
    }
}

struct onAppearandonDissapearBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        onAppearandonDissapearBootcamp()
            
    }
}

// small summary
// .onAppear and .onDissapear()
/*
 jadi on appear adalah component yang digunakan untuk menapilkan dan menghilangkan sebuah components. ketika appear dilayar maka data akan di load. dan apabila data tidak terlihat dilayr maka data tersebut bisa di fetch dari database ke screen, dan akan tampil apabila muncul ke layar.
 
 on appear menggunakan lazy Hstack and v stack
 
 jadi berdasarkan kode diatas, ketika fungsi pertama kali di inisialisasi yang pertama kali muncul adalah state variable dulu. nah setelah layarnya terlihat maka yang dijalankan adalah fungsi didalam on appear tersebut.
 
 dispatch queue
 1. DispatchQueue.main.asyncAfter(deadline: <#T##DispatchTime#>, execute: <#T##DispatchWorkItem#>)
    berfungsi untuk mendelay daripada fungsi atau method yang berada didalam on appear modifier dimana akan mengeksekusi isi daripada dispatch queue dengan menunggu waktu dari deadline nya
 
 jadi on dissapear adalah modifier untuk pengkahiran dimana pada on dissapear akan berjala apabila layar yang kita lihat. sudah tidak terlihat lagi di screen. on dissapear juga berkaitan dengan database.
 
 on dissapear and on appeear merupakan 2 modifier yang berbeda, penggunaan on appear pada scrollview, pada objek dan pada navigation view akan berbeda hasil atau impactnya pada view
 
 */
