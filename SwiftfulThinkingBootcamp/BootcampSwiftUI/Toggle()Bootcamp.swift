//
//  Toggle()Bootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/12/23.
//

import SwiftUI

struct Toggle__Bootcamp: View {
    
    @State private var toggles: Bool = false
    var body: some View {
        VStack {
            Image(systemName: "lamp.ceiling.fill")
                .foregroundColor(toggles ? Color.yellow : Color.black)
                .font(.system(size: 300))
                .animation(.easeInOut(duration: 1.5), value: toggles)
            
            Spacer()
            
            Toggle(isOn: $toggles) {
                Text("Sakelar Lampu")
            }
            .padding(.horizontal)
            .tint(.yellow)
        }
        
    }
}

struct Toggle__Bootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Toggle__Bootcamp()
    }
}

// how to use toggle
// .toggle()

// small summary
/*
 toggle berfungsi untuk switching, dimana switch on switch off. pada materi sebelumnya. dimana toggle berguna untuk swithing boolean dimana apabila belum di toggle maka false, apabila di toggle maka menjadi true dan apabila di toggle kembali maka menjadi false, begitupun seterusnya.
 
 macam macam toggle
 1. Toggle(isOn: <#T##Binding<Bool>#>, label: <#T##() -> _#>)
 
 */
