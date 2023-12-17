//
//  ContextMenu.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/12/23.
//

import SwiftUI

struct ContextMenu: View {
    @State private var backgroundChange: Color = .pink
    @State private var textChange: Color = .black
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swift Bootcamp")
                .fontWeight(.semibold)
            Text("How To Use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(textChange)
        .padding(.all)
        .background(backgroundChange)
        .cornerRadius(20)
        .contextMenu {
            Button {
                backgroundChange = .black
                textChange = .white
                
            } label: {
                Label("Share", systemImage: "flame.fill")
            }
            
            Button {
                backgroundChange = .red
            } label: {
                Text("Unlike This Post")
            }
            
            
            Button {
                backgroundChange = .purple
            } label: {
                HStack {
                    Text("Like This Post")
                    
                    Image(systemName: "heart.fill")
                }
            }
        }
            
        
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}


// small summary
// Content Menu
/*
 context menu sejatinya seperti confirmationdialogie dan alert. inimerupakan cara baru yang jarang populer untuk mendisplay menu. dengan menghold click di objek
 
 context menu bisa berisi beberapa button dan kita bisa melakukan action didalam button tersebut.
 
 context menu is often to use because most users didnt know where is the context menu hidden, so we must tell users location of context menu. and its veru often to to use, its not meaning bad. because hidden
 */
