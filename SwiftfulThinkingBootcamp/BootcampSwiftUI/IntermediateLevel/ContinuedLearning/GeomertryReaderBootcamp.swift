//
//  GeomertryReaderBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/03/24.
//

import SwiftUI

struct GeomertryReaderBootcamp: View {
    func getAmountRotation(geo: GeometryProxy) -> Double {
        /*
         apabila ingin diubah dari vertical ke horizontal, maka ubah modifier tambahan dibawah ini.
         harus ngerti yang bikin projct ini
         */
        let maxDistance = UIScreen.main.bounds.width / 2
        let cuurrentCoordinateX = geo.frame(in: .global).midX
        return Double(1 - (cuurrentCoordinateX / maxDistance))
    }
    var body: some View {
//        GeometryReader { content in
//            HStack(spacing: 0) {
//                Rectangle() .fill(Color.red)
//                    .frame(width: content.size.width * 0.8)
//                    
//                
//                Rectangle() .fill(Color.blue)
//                    .frame(width: content.size.width * 0.2)
//            }
//        }
//        .ignoresSafeArea()
        
        ScrollView(.horizontal) {
            HStack(spacing: 10) {
                ForEach(0..<20) { index in
                    GeometryReader { content in
                        Image(systemName: "house.fill")
                            .resizable()
                            .padding()
                            .background(
                                .thickMaterial
                                    
                            )
                            .rotation3DEffect(
                                Angle(degrees: getAmountRotation(geo: content) * 30),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            
                    }
                }
                .padding(.horizontal)
                .frame(width: 400, height: 350)
            }
            
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    GeomertryReaderBootcamp()
}


// small summary

/*
 Geomertry Reader Bootcamp
 Geometry reader Bootcamp Merupakan sebuah container dimana kita bisa mendapatkan viewsize dan lokasi persis untuk objek dilayar. Yang bisa adaptive dengan device orientation. Portrait atau Landscape.
 
 TIP :
 1. Jangan gunakan geometry reader terlalu banyak karena akan membuat aplikasi menjadi little bit slower
 2. Gunakan Geometry Reader seeffektif mungkin, apabila sulit untuk mendapatkan size tertentu maka gunakan geometry reader.
 3. Untuk mengukur geometry reader gunakan namaBebas.size.width/height
 4. Most of the application outside there using potrait orientation, not a landscape. Even Tokopedia just used one device orientations. maka dari itu gunakan UIscreen.main.bounds.width/height apabila applikasi yang anda buat pada portrait device orientation, kalo gunakan landscape orientations ataupun portrait maka gunakan Geometry Reader.
 5. Pada Geometry Reader kita bisa gunakan cool effect untuk mendapatkan animasi bagus, dengan bantuan modifier .rotation3DEffect
 
 
 */
