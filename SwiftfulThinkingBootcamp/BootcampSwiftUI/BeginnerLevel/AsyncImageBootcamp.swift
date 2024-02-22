//
//  AsyncImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct AsyncImageBootcamp: View {
    let image: URL? = URL(string: "https://picsum.photos/200")
    var body: some View {
        VStack {
//                AsyncImage(url: image) { returningImage in
//                    returningImage
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 100, height: 100)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                } placeholder: {
//                    ProgressView()
//                }
            
            AsyncImage(url: image) { phaseImage in
                switch (phaseImage) {
                case .empty:
                    // sama seperti placeholder
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "xmark.seal")
                        .imageScale(.large)
                default:
                    Text("Image Not found")
                        .fontWeight(.semibold)
                }
            }
        }

    }
}

struct AsyncImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageBootcamp()
    }
}

// small summary
// async Image iOS 15 higher
/*
async aimager merupakan cara untuk mendowload resource dari internet mengenai gambar. yang kana didwonload dan diupload ke codeproject. dengan mudahnya dengan menambahkan bberapa baris kode saja. Pennggunaan async image seperti menggunakan image pada umumnya dan penggunaannya pun sama.
 gampangnya mendapatkan sebuah image dan ditaruh ke device virtual.
 
 inititalisation
 1. asyncImage(url: URL?, scale: double)
    sscale optional, dan url sama seperti pada link. Bedanya ini di downloads.
 
 2. AsyncImage(url: URL, content: LoopingImage, placeholder: LoadingView)
    async image 3 parameter. dimana url sama seperti sebelumnya, content merupakan loopingnya dan modifier taruh didalamnya. dan placeholder digunakan sebelum gambar di download perlihatkan sesuatu element before.
 
 3. AsyncImage(url: URL?, content: retunringImage,modifier)
    sama seperti sebelumnya mengenai url, tetapi pad content harus diberi case berupa success empty failure untuk mengcover ketiga kemungkinan kalo image kosong, kalo image sukses dan image gagal dimuat. harus menggunakan switch case
 
 
 */
