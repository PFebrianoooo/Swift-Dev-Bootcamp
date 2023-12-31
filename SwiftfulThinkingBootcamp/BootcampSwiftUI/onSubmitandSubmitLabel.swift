//
//  onSubmitandSubmitLabel.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/12/23.
//

import SwiftUI

struct onSubmitandSubmitLabel: View {
    @State private var textValue: String = ""
    @State private var dataArray: [String] = []
    var body: some View {
        VStack {
            TextField("Username", text: $textValue)
                .fontWeight(.semibold)
                .font(.subheadline)
                .colorMultiply(Color.red)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .submitLabel(.search)
                .onSubmit {
                    dataArray.append(textValue)
                }
                
            
            
            ForEach(dataArray, id: \.self) { items in
                Text(items)
            }

            
        }
        .padding(.horizontal)
    }
}

struct onSubmitandSubmitLabel_Previews: PreviewProvider {
    static var previews: some View {
        onSubmitandSubmitLabel()
    }
}

// small summary
// on submit and submit label
/*
 kedua modifier ini adalah sebuah modifier untuk keyboard dimana bisa mengibubah retun keyboard menjadi beberapa modifier pada saat di tekan , dan tampilan pada saat belum di tekan.
 
 on submit label adalah sebuah label atau sebuah mdifier untuk melabelkan atau labeling pada keyboard saat appear, dan onsubmit merupakan argument untuk pada saat mencet tombol submit label maka apa argumennya atau actions nya.
 
 lita bisa mengatur tiap textfield untuk membuat different onsubmit label and setiap textfield kita kasih actionnya masing masing
 
 */
