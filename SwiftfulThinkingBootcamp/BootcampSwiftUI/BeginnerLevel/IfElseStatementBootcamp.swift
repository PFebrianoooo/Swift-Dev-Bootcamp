//
//  IfElseStatementBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 29/11/23.
//

import SwiftUI

struct IfElseStatementBootcamp: View {
    @State var showCircle: Bool = false
    @State var showRectangle: Bool = false
//    @State var showImage: Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack {
            // REAL WORLD EXAMPLE STARTS
            Button {
                isLoading.toggle()
            } label: {
                Text("Loading")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.gray)
                    .clipShape(Capsule())
            }
            
            if isLoading {
                ProgressView()
            }else {
                // put view in here aftor loading
            }

            // REAL WORLD EXAMPLE ENDS
            
            // LEARNING MATERIAL STARTS
//            Button("Button 1 \(showCircle.description)") {
//                // put and argue here
////                showCircle = true
//                showCircle.toggle()
//            }
//
//            Button("Button 2 \(showRectangle.description)") {
//                showRectangle.toggle()
//            }
//
//            Button("Button 3 \(showImage.description)") {
//                showImage.toggle()
//            }
            
            
            // conditional logic
            // if statement starts
            // NORMAL ARGS for true
            // cara yang panjang
//            if showCircle == true {
//                Circle()
//                    .fill(.red)
//                    .frame(width: 100, height: 100)
//            }
            
            // SHORT HAND for true
            // di swift cara shorthand ini di logic showCircle swift udah tau kalo di show circle adalah true. ditulis == true (boleh) tidak ditullis pun boleh. but begginer use
//            if showCircle {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 100, height: 100)
//            }
            
            // NORMAL ARGS for false
//            if showCircle == false{
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 100, height: 100)
//            }
            
                
            // short hand for false if argument
            // note ! (negasi)
//            if !showCircle {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 100, height: 100)
//            }
            
            // if statements end
            
            
            
            
            
            // if else statement starts
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            } else {
//                Circle()
//                    .fill(Color.green)
//                    .frame(width: 100, height: 100)
//            }
            // if else statement end
            
            
            
            
            // nested if else stament starts
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            } else if showRectangle {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 100, height: 100)
//            } else {
//                Text("No one was pressed")
//            }
            
            // jika showCircle dan showRectangle is false maka tidak dijalankan argumennya masing masing dan dijalankan argumen else
            // jika showCircle dan show Rectangle is true maka jalankan argumennya masing masing dan else diabaikan
            // tetapi apabila keduanya true maka yang dijalankan showCircle duluan. karena swift compile by order(urutan) dari atas kebawah
            

            // nested if else statement ends
                
            // and and or
            // menghasilkan true apabila keduanya true
//            if showCircle {
//                Circle()
//                    .frame(width: 100, height: 100)
//            }
//
//            if showRectangle {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: 100, height: 100)
//            }
            
            // and
            // mencari kondisi keduanya benar tergantung kondisional dan nya
            // showCircle && ! showRectangle // true dan false
            // !showCircle && !showRectangle // false dan false
            // akan tampil kalo matching sama kondisinya
            
//            if !showCircle && !showRectangle {
//                Rectangle()
//                    .frame(width: 150, height: 150)
//            }
            
            // or
            // kalo salah satunya memenuhi jalan
            // showCircle || !showRectangle // true dan false
            // !showCircle && !showRectangle // false dan false
            //
            // akan tampil kalo matching sama kondisinya

//            if !showCircle || !showRectangle {
//                Rectangle()
//                    .frame(width: 150, height: 150)
//            }
//
            // and or operator yang diutamakan adalah or dulu baru and
            // jadi kalo di or nya true tetep jalan walapun di and nya false
//            if showCircle || showRectangle && showImage {
//                Image(systemName: "heart")
//                    .resizable()
//                    .frame(width: 100, height: 100)
//            }
            
            // LEARNING MATERIAL ENDS

            
            
            
            
            
            
            
            
            Spacer()
        }
    }
}

struct IfElseStatementBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfElseStatementBootcamp()
    }
}


// small Summary
// conditional if else statement
/*
 merupakan control flow dimana kondisi akan menentukan apakah di eksekusi argumennya atau diabaikan argumennya. kita akan menggunakan if else statement hampir diseluruh pembangunan aplikasi.
penggunaan if else statement menggunakan variable property wrapper yaitu @State. dan if else statement berteman baik dengan boolean serta conditional logic && | ! (and , or , not)
 
 jadi di argumennya dirubah variable statenya dengan
 showCircle = true < tidak sama dengan > showCircle.toggle()
 
.toggle()
maksud dari toggle adalah mengubah variable yang di awal false menjadi true setelah di klik dan berlaku sebaliknya.
 di use case diatas apabila kita set variable showCircle = false maka awal argument variable adalah false. apabila button di klik. maka menjadi true. dan apabila di klik kembali maka jadi false. ketentuan diatas berlaku selama tombol di klik (sehingga argumenya muncul)
 
 jadi kalo di ui. fungsi dari conditional ini meliputi.
 1. if digunakan untuk 1 kondisi
 2. if else digunakan untuk 2 kondisi (kondisi true and false)
 3. if else if else statement digunakan untuk kondisi dilihat pada ui
 
 
 
 // catatan sangat penting
 di ui apabila kondisional memenuhi akan tampil, apabila kondisi tidak terpenuhi maka tidak tampil.
 (aturan harga mati)
 
 
 // if else statement
 if showCircle {
    // ARGUMENT FOR SHOW CIRCLE IS TRUE
 }
 
 if !showCircle {
    // ARGUMENT FOR SHOW CIRCLE IS FALSE
    // USING (!) YANG ARTINYA NOT. !SHOWCIRCLE = FALSE
                                    SHOWCIRCLE = TRUE
 }
 */
