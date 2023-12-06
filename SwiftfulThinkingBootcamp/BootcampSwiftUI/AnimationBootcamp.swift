//
//  AnimationBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 05/12/23.
//

import SwiftUI

struct AnimationBootcamp: View {
    
    @State var isAnimated: Bool = false
    var body: some View {
        VStack {
            Button("Button") {
                // with animation
//                withAnimation(Animation.default.repeatCount(5, autoreverses: false)) {
                    isAnimated.toggle()
//                }
                
                
            }
            
            Spacer()
            
                
            
                RoundedRectangle(cornerRadius: isAnimated ? 10 : 25)
                    .fill(isAnimated ? Color.red : Color.green)
                    .frame(
                        width: isAnimated ? 300 : 50,
                        height: isAnimated ? 300 : 50)
                    .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                    .offset(x: isAnimated ? -30 : -160)
//                    .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
            
            // animations
                    .animation(
                        Animation
                            .easeOut(duration: 1.0)
                            .repeatCount(5, autoreverses: true),
                    value: isAnimated)
//
            
            
//            RoundedRectangle(cornerRadius: 10)
//                .fill(isAnimated ? Color.red : Color.blue)
//                .frame(width: 50, height: 50)

            
            Spacer()
            
            
            
        }
    }
}


struct AnimationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBootcamp()
    }
}

// Small Summary
// how to use .animation() and withAnimation()
/*
 .animation() and withAnimation()
 merupakan modifier untuk menganimasikan ui agar meningkatkan UX pengguna. dan juga membuat aplikasi kita lebih bagus dan lebih professional
 
 with animations ditaruh di bagian argument button didalamnya berisi toggle
    
    Penjelasan withAnimations
    withAnimation(<#T##body: () throws -> Result##() throws -> Result#>)
 
    body() menyatakan tipe animasi apa yang mau digunakan dengan klik ( . ) akan terbuka liblarynya
    
    agar lebih enak gunakan sintaks seperti ini
 
 1. withAnimation()
 
        withAnimation(Animation.tipeAnimasi.liblaryTipeAnimasi) {
            
        }
 
 2. .animation()
        
        .animation(Animation.default, value: isinya boolean yang di toggle)
 
    
 
 modifiers
 liblary animasi dan penjelasan liblary tipe animasi
 1. .default
    transisi animasi deafult dari sistem
 
 autoreverses = Bool
    artinya false animasi tidak akan tektok melainkan hanya 1 arah saja
    artinya true animasi akan tektok sebanyak 2 arah dan mengakhiri di posisi yang diinignkan

 
 
 
 PERBEDAAN .animation() dan .withAnimation()
 penggunaan .animation dilakukan untuk menspesifikasi view atau objek yang diigninkan. jadi semua objek yang berkaitan dengan variable yang di toggle akan mengalamani animasi. Karena itu .animation ditaruh di bagian paling bawah modifier.
 
 penggunaan .withAnimation() digunakan untuk menganimasi argument variable yang di toggle, jadi yang berkaitan dnegan variable yang di toggle pada .withAnimation akan mengalami animasi
 
 NB:
 apapun yang berkaitan dengan isChanging akan teranimasi
 menaruh rotation effect sebelum atau sesudah offset akan memengaruhi hasil
 */
