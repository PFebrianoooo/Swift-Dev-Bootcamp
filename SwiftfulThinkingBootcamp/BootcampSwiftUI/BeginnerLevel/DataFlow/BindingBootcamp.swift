//
//  BindingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/11/23.
//

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = .green
    @State var title: String = "hello this is my title"
    
    
    var body: some View {
        ZStack {
            // background layer
            backgroundColor
                .ignoresSafeArea()
            
            // content
            VStack(spacing: 30) {
                Text(title.capitalized)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontWidth(.condensed)
                
                // fungsi opsional button Color disini adalah mengubah nilai default yang sudah di assign ke child view yaitu button view.
//                ButtonView(backgroundColor: $backgroundColor, buttonColor: .brown)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
            
            
        }
    }
}


struct ButtonView: View {
    // deklarasi variable binding di subview bebas namanya. but commonly bagi beginner gunakan nama yang sama pada parent view/parent struct agar tidak rancu atau ketuker
    @Binding var backgroundColor: Color
    @Binding var title: String
    
    
    // state hanya relevant kepada apapun didalam struct ini, tidak relevant kepada struct manapun
    @State var buttonColor: Color  = .blue
    
    
    
    var body: some View {
        
            Button {
                backgroundColor = .orange
                buttonColor = .gray
                title = "title was change by another actions"
            } label: {
                Text("Button")
                    .foregroundColor(.black)
                    .padding(.all, 15)
                    .background(buttonColor)
                    .cornerRadius(15)
                    .shadow(color: Color.black, radius: 10)
            }
            
    }
}


// preview structure
struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}


// small summary
/*
 @Binding Property Wrapper.
 binding digunakan untuk mengkoneksikan variable dari parent view ke child view. jadi binding gampangnya adalah mengubah @State di main view dengan mengubahnya di child view dengan @Binding property wrapper.
 
 untuk lebih jelasnya langsung di praktekkan saja dan di famahi apa yang disampaikan.
 
 aturan deklarasi binding di child struct
 1. nama boleh sama ataupun beda.
 2. inherit binding variable dengan state variable harus sama
 3. Memanggil di parent view diawali dengan lambang dollar ($)
 
 IMPORTANT REMEMBER !!!!!
 
 jadi kalo state hanya bisa merubah apa yang ada didalam struct (variable locally). tetapi kalo state binding maka dari subview akan merubah state di parentview dengan actionnya.
 
 
 NB:
 1. permasalahan yang ditemukan biasanya di subview dimana ingin mengubah sesuatu di mainView. maka gunakan state and binding, state pada parent struct, dan binding di child struct
 */

