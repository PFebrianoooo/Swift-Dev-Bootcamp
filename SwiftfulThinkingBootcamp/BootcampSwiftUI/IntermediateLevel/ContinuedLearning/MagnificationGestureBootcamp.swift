//
//  MagnificationGestureBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 29/02/24.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    @State var currentAmountReal: CGFloat = 0
    
    var body: some View {
//        firstMaterial
                
        realWorldExample
    }
}

#Preview {
    MagnificationGestureBootcamp()
}


// small Summary
/*
 Magnification Gesture
 
 Magnification Gesture aka magnificationGesture() merupakan modifier fungsi dimana berguna untuk zoom in atau zoom out daripada element yang ada didalam view, magnification gesture dapat ditemukan pada instagram photo post. Dimana kita bisa zoom in dan zoom out photo yang ada di profile orang tersebut.
 
calling Magnification gesture
 .gesture (
    magnificationGesture()
)
 
 NB:
 jadi pada magnificationgesture dapat berjalan di simulator bukan di preview, lalu magnification gesture membutuhkan state variable dan .scaleEffect() untuk mengatur skala gambar ketika di zoom in atau out
 .onchanged berguna pada saat melakukan gesure zoom in atau out.
 .onended berguna pada saat setelah melakukan gesture akan menjalan kode didalamnya
 
 */


extension MagnificationGestureBootcamp {
    private var firstMaterial: some View {
        Text("Magnification Gesture")
            .multilineTextAlignment(.center)
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(width: 190, height: 70)
            .background(Color.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .scaleEffect(1 + currentAmount + lastAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged{ value in
                        currentAmount = value - 1
                    }
                    .onEnded { value in
                        lastAmount += currentAmount
                        currentAmount = 0
                        
                    }
            )
        
        // penjelasan syntaxes
        /*
         untuk tipe ini bekerja apabila sudah selesai gesture tidak akan stay ke posisi awal, melaikan stay pada saat posisi akhir berhenti gestue
         */

    }
    
    private var realWorldExample: some View {
        // fitur instagram post photo
        ScrollView(.vertical) {
            VStack {
                // header Profile info
                HStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 0) {
                        Text("p.febrianoo_")
                            .font(.subheadline)
                        Text("Raja Ampat, Papua")
                            .font(.caption)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .padding(.horizontal)
                
                Image("Image-2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width ,height: 350)
                    .scaleEffect(1 + currentAmountReal)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                    currentAmountReal = value - 1
                            }
                            .onEnded { value in
                                withAnimation(.spring()) {
                                    currentAmountReal = 0
                                }
                                
                            }
                    )

            }
            .scrollIndicators(.hidden)
        }
    }
    
    // penjelasan syntaxes
    /*
     jadi pada tipe ini bekerja ketika di gesture akan menzoom in atau out, tetapi apabila selesai gesture akan kembali ke posisi awalnya, makanya gunakan satu state variable saja
     */
}
