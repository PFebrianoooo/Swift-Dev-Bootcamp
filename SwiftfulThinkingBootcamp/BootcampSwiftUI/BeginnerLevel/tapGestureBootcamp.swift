//
//  tapGestureBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 23/12/23.
//

import SwiftUI

// first material
struct tapGestureBootcamp: View {
    @State var isAnimated: Bool = false
    @State var isAnimated2: Bool = false
    @State var count: Int = 0
    var body: some View {
        // instagram like with tap gesture
        VStack {
            ZStack(alignment: .center) {
                Image("Image-Profile")
                    .resizable()
                    .frame(height: 500)
                    .cornerRadius(10)
                    .padding()
                    .onTapGesture(count: 2) {
                        withAnimation(Animation.linear(duration: 0.5)) {
                            isAnimated.toggle()
                            isAnimated2 = true
                            count += 1
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isAnimated.toggle()
                            }
                        }
                    }
                    
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 150, height: 150)
                    .opacity(isAnimated ? 1.0 : 0)
                    .animation(Animation.linear, value: isAnimated)
                                    
            }
            
            HStack {
                Image(systemName: isAnimated2 ? "heart.fill" : "heart")
                    .foregroundColor(isAnimated2 ? Color.red : Color.black)
                    .onTapGesture {
                        isAnimated2.toggle()
                        count += 1
                    }
                Text("\(count)")
            }
        }
    }
}

// second material bootcamps
struct secondMaterial: View {
    @State private var changeColor: Color = .brown
        var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(changeColor)
                .frame(height: 250)
//                .onTapGesture {
//                    withAnimation(Animation.easeOut(duration: 0.5)) {
//                        changeColor = .blue
//                    }
//                }
                .onTapGesture(count: 2) {
                    withAnimation(Animation.easeOut(duration: 0.5)) {
                        changeColor = .blue
                    }
                }
                
            
            Button {
                withAnimation(.easeOut(duration: 0.5)) {
                    changeColor = .yellow
                }
            } label: {
                Text("Press Me!")
                    .fontWeight(.semibold)
                    .font(.subheadline)
            }
            .buttonStyle(.borderedProminent)
            
            

                
        }
        .padding(.horizontal)
    }
}

struct tapGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        tapGestureBootcamp()
        secondMaterial()
    }
}

// tap gesture
// small summary
/*
 on tap gesture pada dasarnya memberikan sebuah button pada sebuah view atau componenents dimana kealkuanya seperti memberikan sebuah button. dan tap gesture dapat diatur beberapa kali hitungan tap nya untuk memberikan sebuah actions.
 
 pada dasrnya tap gesture adalah kita kelik sesuatu tanpa memperlukan sebuah button
 
 macam macam tap gesture
 1. .onTapGesture { code/actions }
    untuk memberikan gesture tap diikuti dengan action tanpa perhitungan
 2. .onTapGesture(count: Int) { Code/Actions }
    untuk memberikan gesture tap tetapi dengan syarat minimal untuk tapping. syaratnya adalah liat pada countnya. dan default count adalah 1.
 
 penerapan.
 1. Pada instagram photo post dimana apabila kita klik 2 kali maka akan membuat tombol like.
 */
