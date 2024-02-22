//
//  StatePropertyWrapperBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 26/11/23.
//

import SwiftUI

struct StatePropertyWrapperBootcamp: View {
    
    @State private var  background: Color = Color.green
    @State private var title: String = "my first title".capitalized
    @State private var count: Int = 0
    @State private var fontChange : Font = .body
    @State private var spacingChange: CGFloat = 20
    @State private var colorFont: Color = .white
    
    
    
    var body: some View {
        ZStack {
            
            background
                .ignoresSafeArea()
            
            
            VStack(spacing: 20) {
                
                Image(systemName:  "globe")
                    .font(.largeTitle)
                
                
                Text ("\(title)")
                    .font(fontChange)
                    .fontWeight(.semibold)
                
                Text ("Count : \(count)")
                    .font(.title3)
                
                HStack (spacing: spacingChange) {
                        
                    Button("Button 1") {
                        background = Color.indigo
                        title = "Button 1 was pressed !"
                        fontChange = .largeTitle
                        spacingChange = 10
                        count += 1
                        colorFont = .red
                        
                    }
                    
                    Button("Button 2") {
                        background = Color.purple
                        title = "Button 2 was pressed !"
                        fontChange = .title
                        spacingChange = 25
                        count = count - 1
                        colorFont = .mint
                    }
                }
                .foregroundColor(colorFont)
                
                
                Button("Resets") {
                    background = .green
                    count = 0
                }
                .foregroundColor(.white)
            }
        }

    }
}


struct ButtonAndState: View {
    @State private var count: Int = 0
    var body: some View {
        VStack {
            
            Text ("dzikir apps".capitalized)
                .font(.title2)
                .fontWeight(.semibold)
            
            
            
            Text("Say Subhanallah")
                .fontWeight(.semibold)
                .fontWidth(.compressed)
            HStack {
                Button {
                    count += 1
                } label: {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.red, radius: 10)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(Color.black)
                        }
                }
                
                Spacer()
                
                Text("\(count)")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Button {
                    count -= 1
                } label: {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 50, height: 50)
                        .shadow(color: Color.red, radius: 10)
                        .overlay {
                            Image(systemName: "minus")
                                .foregroundColor(Color.black)
                        }
                }
            }
            
            .frame(width: 250)
        }
    }
}

struct StatePropertyWrapperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatePropertyWrapperBootcamp()
            ButtonAndState()
        }
    }
}


// my summary
// state property wrapper.
/*
state gampangnya dalah beritahukan kepada view bahwa variable state ini akan berubah dan apabila berubah maka kirimkan ke view.
 
Contoh : @state var name: String
 oke perhatikan variable name, dia bisa berubah. apabila name nya berubah maka kirimkan ke view. apabila tidak maka gunakan nilai default nya.
 
 
 inisialisasi
 @State accessSprecifier var nameVariable : dataTypes = value
 
 fungsi daripada state properties kita bisa mengekstrak sesuatu kedalam variable dan ui tau bahwa variable tersbut akan berubah.
kita bisa mengekstrak sesuatu yang ada didalam kode dan merubahnya apabila kita mau. bisa warna, font size, spacing, lalu tipe data biasa ataupun UI. dan masih banyak lagi.
 */
