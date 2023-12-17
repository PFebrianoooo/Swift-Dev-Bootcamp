//
//  TextEditorBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/12/23.
//

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State private var textInput: String = ""
    
    @State var dataSave: [String] = [String]()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextEditor(text: $textInput)
                    .frame(width: 350, height: 200)
                    .colorMultiply(Color.gray.opacity(0.8))
                    .cornerRadius(10)
                
                Button {
                    addItems()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .buttonStyle(.borderedProminent)

                
                ForEach(dataSave, id: \.self) { items in
                    Text(items)
                }
                Spacer()
            }
//            .background(Color.green)
            .navigationTitle("TextEditor Bootcamp")
        }
    }
    
    func addItems() {
        dataSave.append(textInput)
        textInput = ""
    }
}


struct TextEditorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextEditorBootcamp()
    }
}

// small summary
// text editor

/*
 text editor adalah modifier yang bisa digunkaan untuk membuat input text dalam multiline input, dimana pada textfield sebelumnya hanya one line input. Dan pada text editor menggunakan multiline input text, seperti penggunaan input bio dimana memiliki banyak komponen dalam isinya.
 
 penggunaan text editor pada mobile
 1. Bio
 2. Product Desctiption
 */
