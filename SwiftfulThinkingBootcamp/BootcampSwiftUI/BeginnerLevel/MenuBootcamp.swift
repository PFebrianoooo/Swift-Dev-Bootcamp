//
//  MenuBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 23/02/24.
//

import SwiftUI

struct MenuBootcamp: View {
    var body: some View {
        VStack {
            Menu("Iam a menu") {
                Button("Button 1") {
                    // args
                }
                Button("Button 2") {
                    // args
                }
                
                Button("Button 3") {
                    // args
                }
            }
            .foregroundStyle(Color.blue)
            
            Menu {
                Button("Button 1") {
                    // args
                }
                Button("Button 1") {
                    // args
                }
                Button("Button 1") {
                    // args
                }
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(
                        .thinMaterial
                    )
            }


        }
    }
}

#Preview {
    MenuBootcamp()
}

// small summary

/*
 menu dapat digunakan di kondisi
 1. bebrapa berkaitan dengan filter
 2. pop up dimana menghadirkan multiple options, dsb
 3. mungkin untuk date picker dimana mendisplay untuk 1 minggu hari, 2 minggu hari dan lain sebagainya.
 */
