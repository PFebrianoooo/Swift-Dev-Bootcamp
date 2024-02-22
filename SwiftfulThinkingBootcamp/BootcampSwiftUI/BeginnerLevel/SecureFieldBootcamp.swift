//
//  SecureFieldBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 18/12/23.
//

import SwiftUI

struct SecureFieldBootcamp: View {
    @State var textField: String = ""
    @State var secureField: String = ""
    var body: some View {
        VStack {
            TextField("Username", text: $textField)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                }
                
            
            SecureField("Password", text: $secureField)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                }
            // preferensi dalam menggunakan keyboard
//                .keyboardType(.numberPad)
            // preferensi tipe daripada textfield ataupun ssecurefield
//                .textContentType(.emailAddress)
            // preferensi correcting penulisan dalam textfield atau securefield
//                .textInputAutocapitalization(.characters)
        }
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding(.horizontal)
    }
}

struct SecureFieldBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldBootcamp()
    }
}

// secure Field
// small summary
/*
 secure field merupakan komponen yang sama seperti textfield tetapi dalam securefield kita tidak bisa melihat apa yang di inputkan kedalam fieldnya. bisanya digunakan untuk password yang berkaitan dengan keamanan
 */
