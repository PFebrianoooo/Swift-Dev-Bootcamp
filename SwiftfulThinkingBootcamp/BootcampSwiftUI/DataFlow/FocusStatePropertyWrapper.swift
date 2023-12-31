//
//  FocusState.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct FocusStatePropertyWrapper: View {
    // focustate biasa
//    @FocusState private var usernameInFocus: Bool
//    @FocusState private var passwordInFocus: Bool
    
    // focus state dnegan enum apabila forms nya banyak
    @FocusState private var FieldInFocus: onboardingField?
    
    @State private var usernameFocus: Bool = false
    @State private var passwordFocus: Bool = false
    @State private var username: String = ""
    @State private var password: String = ""
    
    
    enum onboardingField: Hashable {
        case username
        case password
    }
    
    var body: some View {
        VStack {
            TextField("Username".capitalized, text: $username)
//                .focused($usernameInFocus)
                .focused($FieldInFocus, equals: .username)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                }
                .alert("Please check again".capitalized, isPresented: $usernameFocus) {
                    
                }message: {
                    Text("PLease fill teh username filled".capitalized)
                }
            
            SecureField("Password".capitalized, text: $password)
//                .focused($passwordInFocus)
                .focused($FieldInFocus, equals: .password)
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                }
                .alert("Please check your password again".capitalized, isPresented: $passwordFocus) {
                    
                }message: {
                    Text("please fill the password filled".capitalized)
                }
            
            
            Button("Save") {
//                usernameInFocus.toggle()
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                if usernameIsValid && passwordIsValid {
                    print("Sign Up")
                }else if usernameIsValid {
//                    usernameInFocus = false
//                    passwordInFocus = true
                    FieldInFocus = .username
                    usernameFocus = false
                    passwordFocus = true
                }else {
//                    usernameInFocus = true
//                    passwordInFocus = false
                    FieldInFocus = .password
                    usernameFocus = true
                    passwordFocus = false
                    
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            }
//        }
    }
}

struct FocusStatePropertyWrapper_Previews: PreviewProvider {
    static var previews: some View {
        FocusStatePropertyWrapper()
    }
}

// small summary
// focus state
/*
 @focusState Property Wrapper adalah data flow yang memperbolehkan untuk memilih atau tidak memiih component di swift UI, sebagai contoh digunakan pada text field dimana sebelumnya kita tidak bisa mengatur popup keyboard dengan memilih text field. gampangnya adalah ketika user mengisi data pada textfield maka user bisa melanjutkan mengisi text selanjutnya.
 
 @focusState Property Wrapper Berguna
 1. pada saat onboarding app seperti login username, maka dengan mengklik lanjutkan langsung menuju atau mengisi sebuah form untuk membuat akun misalnya. saat onboarding apps
 
 
 penggunaan text field bakalan ribet kalo punya banyak forms jadi kita harus membuat enum untuk memastikan variable nya kecover di enum
 */
