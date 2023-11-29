//
//  ButtonBootcamps1.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 24/11/23.
//

import SwiftUI

// button bootcamps dnegan app stuff
struct ButtonBootcamps: View {
    
    @State var backgrundColor: Color = .blue
    
    var body: some View {
        VStack {
            // header file
            Rectangle()
                .fill(backgrundColor)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .ignoresSafeArea()
            
            Spacer()
            
            Button {
                backgrundColor = .secondary
            } label: {
                Text("Change Background")
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding()
                    .background(
                        Color.gray
                            .cornerRadius(15)
                            
                    )
            }
            
            

        }
    }
}

struct ButtonBootcamps_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamps()
    }
}

/*
 state property merupakan pengkonfigurasian antara ui dengan argument/action dimana
 hey warnanya biru tetapi dikasih action lagi maka warnanya berubah sesuai action dan kirimkan ini ke ui ke rectangle.
 */



