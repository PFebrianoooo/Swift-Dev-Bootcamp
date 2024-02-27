//
//  SaveAreainSetsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 23/02/24.
//

import SwiftUI

struct SaveAreainSetsBootcamp: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(0..<20) { items in
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            // Scrollview Modifier
            .scrollIndicators(.hidden, axes: .vertical)
            
            // Nav Stack Modifier
            .navigationTitle("Save area in sets")
            
        }
        // in other way to place item in safe area in sets, without using standard liblary
//        .overlay(alignment: .bottom) {
//            Text("Hii")
//                .frame(maxWidth: .infinity)
//                .background(Color.yellow)
//        }
        
        
        // using safe area in sets
        .safeAreaInset(edge: .bottom, alignment: .center, spacing: nil) {
            Text("Hii")
                .frame(maxWidth: .infinity)
                .background(Color.yellow)

            
        }
        
        
    }
}

#Preview {
    SaveAreainSetsBootcamp()
}
