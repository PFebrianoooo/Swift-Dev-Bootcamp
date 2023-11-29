//
//  ZstackVstackHstackBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/11/23.
//

import SwiftUI

struct ZstackVstackHstackBootcamp: View {
    var body: some View {
//// jajal ilmu untuk pertama kali
//        ZStack(alignment: .center) {
//            Rectangle()
//                .fill(.yellow)
//                .frame(width: 350, height: 500)
//
//            VStack(alignment: .center) {
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.red)
//                    .frame(width: 150, height: 150)
//
//                RoundedRectangle(cornerRadius: 10)
//                    .fill(Color.green)
//                    .frame(width: 100, height: 100)
//
//                HStack(alignment: .center) {
//                    Rectangle()
//                        .fill(.purple)
//                        .frame(width: 50, height: 50)
//
//                    Rectangle()
//                        .fill(.red)
//                        .frame(width: 80, height: 80)
//
//                    Rectangle()
//                        .fill(.blue)
//                        .frame(width: 100, height: 100)
//
//
//                }
//            }
//        }
        
        
        
// material course.
// basic vstack hstack and Zstack
// change v h and z into vstack embedded change the value to (H, V, Z)
// and uncomment all second frame for using zstack
//        VStack(alignment: .trailing, spacing: nil) {
//            Rectangle()
//                .fill(.gray)
//                .frame(width: 100, height: 100)
////                .frame(width: 150, height: 150)
//
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 100, height: 100)
////                .frame(width: 125, height: 125)
//
//            Rectangle()
//                .fill(.red)
//                .frame(width: 100, height: 100)
////                .frame(width: 90, height: 90)
//        }
        
        
        
// implement zstack vstack and h stack on real world example
        
        ZStack {
            Color(uiColor: .secondarySystemFill)
                .cornerRadius(10)

            LazyVStack(alignment: .leading) {
                Text("Implementation Of Stacking")
                    .font(.headline)

                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack {
                        VStack {
                            ForEach(0..<3) { _ in
                                cardListView()
                            }
                        }
                        VStack {
                            ForEach(0..<3) { _ in
                                cardListView()
                            }
                        }
                        VStack {
                            ForEach(0..<3) { _ in
                                cardListView()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(width: .infinity, height: 370)
        
        
//        implementation again
        
        
    }
}

struct ZstackVstackHstackBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ZstackVstackHstackBootcamp()
    }
}

// my small summary
/*
zstack vstack and hstack
zstack adalah stacking atau tumpukan dari depan kebelakang arti z index adalah belakang kedepan (back to front)
vstack adalah stacking atau tumpukan dari atas kebawah gampangnya adalah vertical
hstack adalah stacking atau tumpukan dari kiri ke kanan gampangnya adalah horizontal
 
penggambaran secara skala x y and z
 
  * _________
    |       |
    |       |       V
    |_______|
                _________
                |       |
          H     | () () |     H
                |_______|
                            _________
                            |       |
                    V       |       |
                            |_______|
                                     *
 bintang ke bintang = z stack
 v ke v = vertical
 h ke h = horizontal
 
 ketiga items tersebut memiliki attribut
 Hstack(alignment: , spacing: ) { code }
 Vstack(alignment: , spacing: ) { code }
 Zstack(alignment: , spacing: ) { code }
 
 terlihat sama namun pada alignment ketiga items tersebut berbeda, gunakan . after allignment untuk melihat opsi pertataan nya.
 
 perlu diingat bahwa z stack dapat digunakan untuk backgroundkan sesuatu
 
 terdapat liblary baru yaitu
 1. lazyHstack
 2. lazyVstack
 
 dimana keduanya sama seperti HStack dan VStack biasa tetapi lazy maksudnya adalah apabila data belum di load atau terllihat di layar maka objek tidak akan dibuat, apabila objek appear dilayar baru dibuat tampilannya/objeknya. menggunakan lazy akan jauhlebih cepat dibandingkan dengan stacking biasa
 
 1. rotationEffect // dugunakan untuk merotasikan object
 
 
 
 
 
 */

struct cardListView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)), Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1)), Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 175, height: 100)
                
                HStack(alignment: .center) {
                    VStack (alignment: .leading) {
                        Text("Cintailah Cinta")
                            .font(.subheadline)
                            .bold()
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .kerning(0.5)
                        Text("Release on January,1990".lowercased())
                            .font(.system(size: 7.3))
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    Spacer()
                    Image(systemName: "person.2.square.stack")
                        .resizable()
                        .foregroundColor(.indigo)
                        .frame(width: 70, height: 75)
                        .rotationEffect(.degrees(-15))
                }
                .padding(.horizontal,3)
            }
            .frame(width: 175, height: 100)
        .clipped()
        }
    }
}
