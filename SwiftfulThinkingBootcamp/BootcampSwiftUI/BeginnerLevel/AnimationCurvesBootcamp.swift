//
//  AnimationCurvesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 06/12/23.
//

import SwiftUI

struct AnimationCurvesBootcamp: View {
    
    @State var isAnimated: Bool = false
    let duration: Double = 10.0
    @State var isButton: Bool = false
    
    
    var body: some View {
        VStack {
            Button("Hello Button") {
//                isAnimated.toggle()
            }
            
//            course material
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(
//                    width: isAnimated ? 350 : 50,
//                    height: 100)
//                .animation(
//                    Animation
////                        .linear
//                        .linear(duration: duration)
//
//                    ,value: isAnimated)
//
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(
//                    width: isAnimated ? 350 : 50,
//                    height: 100)
//                .animation(
//                    Animation
////                        .easeIn
//                        .easeIn(duration: duration)
//
//                    ,value: isAnimated)
//
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(
//                    width: isAnimated ? 350 : 50,
//                    height: 100)
//                .animation(
//                    Animation
////                        .easeOut
//                        .easeOut(duration: duration)
//
//                    ,value: isAnimated)
//
//
//            RoundedRectangle(cornerRadius: 20)
//                .frame(
//                    width: isAnimated ? 350 : 50,
//                    height: 100)
//                .animation(
//                    Animation
////                        .easeInOut
//                        .easeInOut(duration: duration)
//
//                    ,value: isAnimated)
            
//            RoundedRectangle(cornerRadius: 20)
//                .frame(
//                    width: isAnimated ? 350 : 50,
//                    height: 100)
//                .animation(
//                    Animation
//                        .spring(
//                            response: 0.5,
//                            dampingFraction: 0.7,
//                            blendDuration: 1.0)
//                    ,value: isAnimated)

//        Spacer()
            Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundColor(Color.green)
                .offset(x: isAnimated ? 150 : -150)
                .frame(width: .infinity)
                .animation(
                    Animation
                        .easeOut(duration: 1.5).repeatForever(autoreverses: false),
                    value: isAnimated)
                .onTapGesture {
                    isAnimated.toggle()
                }
                .padding(.bottom)
            
            
            
            // example of transitions
            
            VStack {
                ZStack {
                    isButton ? Color.black : Color.brown
                        
                    
                    VStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .offset(x: isButton ? -28 : 28)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 2)
                            .background(
                                isButton ?
                                Image("Image").resizable() : Image("Image-2").resizable())
                            .clipShape(Capsule())
                            .animation(Animation.spring(
                                response: 0.5,
                                dampingFraction: 0.8,
                                blendDuration: 3.0),
                                       value: isButton)
                            .onTapGesture {
                                isButton.toggle()
                            }
                        
                    }
                }
                .animation(Animation.easeInOut(duration: 0.5), value: isButton)
            }
            .frame(width: 300, height: 300)
            .cornerRadius(20)
                
            
            
            
            
            
        }
    }
}




struct AnimationCurvesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        AnimationCurvesBootcamp()
    }
}


// small summary
// fokus course kaliini adalah untuk mendeskripsikan modifier dari Animasi
/*
 modifier Animate
 
 Jangan Sampai Lupa.
 
 .linear
    memiliki animasi speed yang sama saat objek start dan end , pada kasus rectangle.
 
 .easein
    memiliki animasi saat end saja. pertama-tama pelan dulu baru akhirnya cepet
 
 .easeout
    memiliki animasi saat start saja. Pertama cepet ampe akhir baru lambar
 
 .easeinout
    memiliki animasi saat start dan end. pertama tama pelan dulu terus cepet lalu pelan lagi
 
 .spring
    animasi yang sering dipakai pada ui. ketika pop up screen atau show Sebuah view
    modifier
        response:
            response pda dasarnya adalah seperti durasi yang kita miliki pada modifier duration. cepat lambatnya sebuah animasi
        dampingFraction:
            pantulan ketika rounded rectangle sudah sampai di frame maksimal dan memantulkan kebelangang dan menuju frame aslinya. makin kecil pantulannya makin terlihat, main besar maka sebaliknya
        blendDuration:
    
 
 durasi adalah waktu untuk mencapai titik maksimal sebuah view. in this case is frame
 
 */
