//
//  BackgorundAndOverlaysBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/11/23.
//

import SwiftUI

//struct BackgorundAndOverlaysBootcamp: View {
//    var body: some View {
//        Text("Hello World")
//            .foregroundColor(.black)
//            .background(
////                Color.red
////                LinearGradient(
////                    gradient: Gradient(colors: [Color.gray, Color.blue]),
////                    startPoint: .leading,
////                    endPoint: .trailing)
//                Circle()
//                    .fill(LinearGradient(
//                        gradient: Gradient(colors: [Color.red, Color.blue]),
//                        startPoint: .leading,
//                        endPoint: .trailing)
//                    )
//                    .frame(width: 300, height: 200, alignment: .center)
//
//            )
//            .background(
//                Circle()
//                    .fill(
//                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]),
//                                       startPoint: .leading,
//                                       endPoint: .trailing)
//                    )
//                    .frame(width: 350, height: 350, alignment: .center)
//            )
//
//
//
//    }
//}

// overlay biasa

//struct BackgroundAndOverlayBootcamp: View {
//    var body: some View{
//        Circle()
//            .fill(
//                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]),
//                               startPoint: .topLeading,
//                               endPoint: .trailing)
//            )
//            .frame(width: 100, height: 150)
//            .overlay(
//                Text("1")
//                    .foregroundColor(Color.white)
//                    .bold()
//                    .fontDesign(.serif)
//                    .font(.title)
//
//            )
//            .background(
//                Circle()
//                    .fill(Color.gray)
//                    .frame(width: 120 , height: 170)
//
//            )
//
//    }
//}



// overlay dengan allignment
//struct BackgoundAndOverlayBootcamp2 : View {
//    var body: some View {
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: 200, height: 150)
//            .overlay(alignment: .center) {
//                Circle()
//                    .fill(Color.blue)
//                    .frame(width: 50, height: 75)
//            }
//            .background(alignment: .center) {
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Color.orange)
//                    .frame(width: 250, height: 200)
//            }
//
//
//    }
//}

// real world example of background an overlay
struct RealWorldExampleOverlayAndBackground : View {
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.title)
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1))]),
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing))
                    .frame(width: 100, height: 100)
                    .shadow(color:
                                Color(#colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)),
                            radius: 10,
                            x: 0.0,
                            y: 10)
                    .overlay(alignment: .bottomTrailing) {
                        ZStack {
                            Circle()
                                .fill(Color.mint)
                                .frame(width: 35, height: 35)
                                .shadow(color: Color.gray, radius: 10, x: 5, y: 5)

                           Text("5")
                                .foregroundColor(Color.white)
                                .font(.subheadline)
                                .fontDesign(.serif)

                        }
                    })
    }
}


// mengkloning logo di my academic edlink
//struct RealWorldExampleOverlayAndBackgorund2 : View {
//    var body: some View {
//
//        ZStack {
//
//            Color("LayeringColor")
//
//            HStack(spacing: 30) {
//                VStack(spacing: 15) {
//                    Image(systemName: "person.crop.square.filled.and.at.rectangle.fill")
//                        .font(.system(size: 20))
//                        .foregroundColor(Color.orange)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.orange.opacity(0.35))
//                                .frame(width: 45 , height: 40)
//                    )
//
//                    Text("Home")
//                        .font(.caption)
//                        .bold()
//                }
//
//                VStack(spacing: 15) {
//                    Image(systemName: "qrcode.viewfinder")
//                        .font(.system(size: 20))
//                        .foregroundColor(Color.green)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.green.opacity(0.35))
//                                .frame(width: 45, height: 40)
//                    )
//
//                    Text("Qr Code")
//                        .font(.caption)
//                        .bold()
//                }
//
//                VStack(spacing: 15) {
//                    Image(systemName: "list.bullet.clipboard.fill")
//                        .foregroundColor(Color.blue)
//                        .font(.system(size: 20))
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color.blue.opacity(0.35))
//                                .frame(width: 45, height: 40)
//                    )
//
//                    Text("Transkrip")
//                        .font(.caption)
//                        .bold()
//                }
//            }
//        }
//        .frame(width: .infinity, height: 300)
//        .cornerRadius(10)
//    }
//}




struct BackgorundAndOverlaysBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        BackgroundAndOverlayBootcamp()
//        BackgorundAndOverlaysBootcamp()
//        BackgoundAndOverlayBootcamp2()
        RealWorldExampleOverlayAndBackground()
//        RealWorldExampleOverlayAndBackgorund2()
    }
}



// my small summary
/*
 1. backgrounds (.backgorund ())
 pada backgorund terdapat beberapa attribut yang bisa digunakan Misalkan pada background menginherit dari view yang artinya kita bisa menambahkan beberaapa attribut kedalam si background.
 1. bisa Menggunakan Color
 2. bisa Menggunakan gradient
 3. bisa Menggunakan Shapes
 
 background dibagi menjadi beberapa bagian
 1. backround biasa (.background())
 2. background dengan allignment ( .backgtound(alignment: ) { code } )
 
 2. Overlays. (.overlay () )
 merupakan sebuah elemen yang akan di tambahkan di bagian depan dari elemen utama, misalkan pada circle akan di tambahkan elemen di depannya berupa apa saja, bisa tombol teks dan yang lainnya.
 overlay dibagi menjadi
 1. overlay biasa ( .overlay() )
 2. overlay menggunakan allignment (.overlay (allignment: .leading) { code })
 
 
 // real world example.
 INGAT INGAT
 1. utamakan fill dulu baru framing, framing paling akhir aja
 
 
 
 
 
 */
