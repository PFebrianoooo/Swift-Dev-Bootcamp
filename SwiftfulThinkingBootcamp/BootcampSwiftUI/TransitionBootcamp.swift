//
//  TransitionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 07/12/23.
//

import SwiftUI

struct TransitionBootcamp: View {
    
    @State var isTransition: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button {
//                    animation ini merefers ke if else statement dulu dimana kalo di logikain dia mau animasi yang
//                    ada di eif else statement. dimana menganimasikan dnegan argument dibawah ini untuk isi dari if
//                    else statement
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        isTransition.toggle()
                    }
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        .padding(.all)
                        .background(Color.black)
                        .clipShape(Circle())
                }

                Spacer()
                
                if isTransition {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.accentColor)
//                        .opacity(isTransition ? 1.0 : 0.0)
                        .frame(height: UIScreen.main.bounds.height * 0.5)
                        
//                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.5)))
//                      .transition(.scale)
//                        .transition(.asymmetric(
//                            insertion: .move(edge: .leading),
//                            removal: .move(edge: .bottom))
//                        )
                        .transition(.move(edge: .bottom))
                    
//                        .animation(.easeInOut(duration: 1.5), value: isTransition)
                        // ternyata ini hanya berlaku pada view yang terlihat, untuk yang tidak terlihat seperti ini gunakan with animation
                }
                                

            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}


struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}

// transition
// small summary
/*
    perbedaan antara animate dan transition
apabila animate adalah kita menganimasi sebuah objekUI yang ada di layar, sedangkan transitions adlaah transisi/animasi untuk sebuah objekUI yang tidak ada di layar dan mau di transisikan kedalam layar dengan .transisi
 lalu pada animate kita tidak gunakan conditional logic, sedangkan transisi menggunakan contional logic.
 
 misalkan kita secara default punya rectangle, dan rectangle staunya lagi ada di off screen. nah ui yang di offscreen itulah ketika ia masuk ke screen kita transisikan.
 
 withanimation vs animation
 animation berlaku untu view yang sudah terliat di layar, sedangkan withanimation berlaku untuk view yang belum terlihat di layar dan mau untuuk dipelihatkan di layar
 
 keyword
 UIscreen.main.bounds.width/height * presentase
 artinya memposisikan frame sebesar layar yang dimiliki. width untuk lebar height untuk tinggi
 
 Transition
    .move (edges: )
        move seperti tempat awal ui bergerak keluar view hirarki dimana modifiernya ada beberapa
            .leading, .trailing, .top, .bottom
    
    
    .scale
        zoom in zoom out the screen
    
 
    asymetric
        transisi yang dimana kita bisa mengatur ketika datang ke layar dan ketika keluar dari layar
            insertion untuk transisi masuk, sedangkan removal untuk transisi keluar
        .transition(.asymmetric(
            insertion:    ,
            removal:      )
            )

    
    
    hak khusus
    .opacity
    khusus penggunaan opacity, pada withanimation dicompund 1 line code kedalam transition, dan menambahkan AnyTransitions untuk bisa compound animation didalamnya dan bisa memanggil modifier lainnya untuk animation
    .transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.5)))
 
  
 */
