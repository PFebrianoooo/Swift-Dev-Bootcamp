//
//  BackgroundMaterialsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct BackgroundMaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Text("this is system materials".capitalized)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 450)
            .background(
//                .thinMaterial
//                .thickMaterial
//                .regularMaterial
                .ultraThinMaterial
//                .ultraThickMaterial
                
            )
            .cornerRadius(15)
            
            
        }
        .ignoresSafeArea()
        .background(Image("Image-Profile"))
    }
}

struct BackgroundMaterialsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundMaterialsBootcamp()
    }
}

// small summary
// background materials
/*
 background material seperti background pada umumnya tapi ini keren. seperti ada background blur dan fitur fitur keren lainnya unuk background. biasanya digunakan untuk sheet atau PopOver
 */

