//
//  AnyLayoutBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 26/02/24.
//

import SwiftUI

// https://useyourloaf.com/blog/size-classes/
struct AnyLayoutBootcamp: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 12) {
         // cara untuk mengetahui apakah layarnya compact atau regular
            Text("Vertical : \(verticalSizeClass.debugDescription)")
            Text("Horizontal : \(horizontalSizeClass.debugDescription)")
            
            
            // mengatur size orientation compact and regular manual
            
            // long Syntax
//            if horizontalSizeClass == .compact {
//                VStack {
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gamma")
//                }
//            }else {
//                HStack {
//                    Text("Alpha")
//                    Text("Beta")
//                    Text("Gamma")
//                }
//            }
            
            
            // shorten syntax
            // harus menggunakan ternary operator dalam pendefinisiannya
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout {
                    Text("Alpha")
                    Text("Beta")
                    Text("Gamma")
            }
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}

// small summary
/*
 Any Layout
 merupakan layout protocol untuk mengatur macam-macam view seperti stacking dalam view dan lain sebagainya. Gampangnya Any Lyaout merupakan pengaturan layout berdasarkan device orientation apakah portrait atau landscape, dnegan menggunakan bantuan envronment horizontal dan vertical size class
 
 Berguna untuk:
 1. mengatur adaptasi daripada aplikasi untuk bisa adapt landscape atau portrait mode
 2. biasanya aplikasi besar hanya dapat menggunakan satu size orientation, yaitu Portrait Mode
 
 
 */
