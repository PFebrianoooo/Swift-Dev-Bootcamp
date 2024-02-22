//
//  ButtonStyleBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct ButtonStyleBootcamp: View {
    var body: some View {
        VStack {
            // manual doing
            Button {
                
            } label: {
                Text("Press ME!")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 11)
                    .background(Color.blue)
                    .cornerRadius(5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1.5)
                    }
            }
            
            
            
            // standard liblary
            Button("Press ME!") {
                
            }
            .fontWeight(.semibold)
            .font(.subheadline)
            .buttonStyle(.borderedProminent)
//            .controlSize(.regular)
            
            Button {
                
            } label: {
                Text("Press ME!")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
            .buttonBorderShape(.capsule)

            
        }
    }
}

struct ButtonStyleBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootcamp()
    }
}


// small summary
// buttonstyle control size
/*
 buttonstyle modifier adalah modifier untuk merubah bentuk atau style dari button yang merupakan preset dari liblary xcode for iOS 15 and higher
 
 BUtton syle mengikuti ukuran dari label completion, dimana memebrsar apabila string  protocolnya membesar. gampangnya mengikuti huruf.
 
control size merupakan ukuran dari button style yang mana merupakan standard liblary dari x code dan untuk ios 15 higher
    kalo mao framing dilakukan dilabael completionnya untuk dan agar button sesuai dengan frame yang kita mau
 
button bordered shape adalah pemberian shaping adau bnetuk pada setiap bingkai dari button 3 opri untuk menggunakannya.
 
 
 */
