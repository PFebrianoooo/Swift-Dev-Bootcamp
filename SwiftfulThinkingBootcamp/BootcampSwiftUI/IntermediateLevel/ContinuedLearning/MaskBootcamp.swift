//
//  MaskBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/03/24.
//

import SwiftUI

struct MaskBootcamp: View {
    @State private var countStar: Int = 0
    
    var body: some View {
        VStack {
            starsView
                .overlay(overlayView.mask(starsView))
            
            starsView
                .overlay(overlayView.mask(starsView))
            
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [Color.grapeColor, Color.blueberryColor]), startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: CGFloat(countStar) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                // kalo menggunakan syntax ini, tidak reusable
//                    .foregroundStyle(countStar >= index ? Color.yellow : Color.gray)
                    .foregroundStyle(Color.gray)
                    .shadow(radius: 7)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            countStar = index
                        }
                    }
            }
    }
    }
}

#Preview {
    MaskBootcamp()
}

// small summary
/*
 Mask Bootacamp
 Mask merupakan lapisan topelng dimana lapisan topeng tersebut terletak diatas layer daripada sebuah element dibawahnya. Misalkan kita punya text dan kita panggil modifier mask, maka mask tersebut akan berada di bagian depan daripada teks tersebut. Masking adalah modifier tambahan untuk overlay.
 Masking berkaitan erat dengan animations.
 
 FWI:
 .allowsHitTesting(Bool) merupakan sebuah modifier untuk memperbolehkan untuk hit testing, maksudnya adalah apabila merupakan overlay, maka overlay tersebut seakan-akan transparent padahal ada secara visual tidak dengan behind the scenes.
 
 */
