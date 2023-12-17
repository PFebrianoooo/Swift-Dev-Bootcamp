//
//  TextfieldBootcamps.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/12/23.
//

import SwiftUI

struct TextfieldBootcamps: View {
    @State var userInput: String = ""
    
    @State var userData: [String] = [
    
    ]
    var body: some View {
        NavigationStack {
                VStack {
                    ForEach(userData, id: \.self) { items in
                        Text(items)
                    }

                    Spacer()
                    
                    TextField("Search here", text: $userInput)
                    // .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    // .foregroundColor(.red)
                    .font(.headline)
                    .padding()
                    
                    
                    Button {
                        decisionInput()
                    } label: {
                        Text("Save")
                            .foregroundColor(countInput() ? Color.white : Color.black)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!countInput())
                }
                
                .navigationTitle("TextField Bootcamp")
        }
    }
    
    
    func addItem() {
        userData.append(userInput)
    }
    
    
    func countInput() -> Bool {
        if userInput.count >= 3 {
            return true
        }
        return false
    }
    
    func decisionInput() {
        if countInput() {
            addItem()
        }
        userInput = ""
    }
}



struct textEditor: View {
    @State private var descriptionProduct: String = ""
    
    @State private var modelText: [String] = [String]()

    var body: some View {
        VStack {
            
            ForEach(modelText, id: \.self) { items in
                Text(items)
            }
            
            
            TextEditor(text: $descriptionProduct)
                .frame(height: 200)
            
            Button {
            
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            .buttonStyle(.borderedProminent)
        }
    }
}


struct mengingatKembali: View {
    
    @State var userInputed: String = ""
    var body: some View {
        VStack {
//            TextField("type something here", text: $userInputed)
////                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.vertical,5)
//                .padding(.horizontal)
//                .font(.subheadline)
//                .fontWeight(.semibold)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke(Color.yellow, lineWidth: 1.5)
//                )
            
            
            

            HStack {
                TextField("search here".capitalized, text: $userInputed)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1.7)
                    )
                 
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                        .padding(.all, 7)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
            }
            
                    
                
                
        }
        .padding(.horizontal)
    }
}



struct TextfieldBootcamps_Previews: PreviewProvider {
    static var previews: some View {
//        TextfieldBootcamps()
//        textEditor()
        mengingatKembali()
    }
}

// textfield
// cmall summary
/*
 textfield adalah komponen yang sempurna untuk ditaruh di bagian layar, dimana textfield bekerja pada situasi. dimana users ingin mengetik sesuatu atau inputkan sesuatu kedalam layar.
     dan menggunakan value yang diinputkan usert untuk dipergunakan diseluruh bagian daripada aplikasi.
 
     apabila sedang berada di live preview maka input dilakukan di keyboard pc. but apabila di run di simulator maka akan popup keyboard dari bawah layar.
 
 // macam macam texfield
 1. textfield string protocol and bindingvariable
 TextField(<#T##title: StringProtocol##StringProtocol#>, text: <#T##Binding<String>#>)
 
 // modifier textfield std lib
 .textfieldstyle(textfieldstyle())
 
 
 
 // modifier baru
 .disabled // mematikan atau menghidupkan objek pada view. bisa berupa button
 
// REMMEBR ATURAN FUNGSI, YANG PERLU PAKE INITIALIZER ADALAH YANG DIPERGUNAKAN KEMBALI
 
 
 */
