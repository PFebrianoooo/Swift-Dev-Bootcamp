//
//  ColorPickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 17/12/23.
//

import SwiftUI

struct ColorPickerBootcamp: View {
    
    @State var pickColor: Color = .white
    
    var body: some View {
        VStack {
            Image("Image-2")
                .resizable()
                .frame(width: 150, height: 150)
                .overlay {
                    Circle()
                        .stroke(pickColor, lineWidth: 5)
                }
                .clipShape(Circle())
                
                ColorPicker("Change Your border color".capitalized, selection: $pickColor, supportsOpacity: true)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(Color.gray)
                .cornerRadius(10)
            
            
            
         }
        .padding(.horizontal)
    }
}

struct ColorPickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerBootcamp()
    }
}

// small summary
// Color PIcker

/*
 Color Picker Merupakan components dimana kkta bsia memilih warna untuk impact pada komponen lain dalam code kita.
 gampangnya Color Picker berguna untuk membuat user memilih warna dan mengganti warna dari ui yang mereka lihat.
 
 macam - macam Color Picker
`1. ColorPicker("string", selection: Binding<Color>, supportsOpacity: Bool)
    support OPacity adalah optional akan ditambahkan apabila dia true
 
 */
