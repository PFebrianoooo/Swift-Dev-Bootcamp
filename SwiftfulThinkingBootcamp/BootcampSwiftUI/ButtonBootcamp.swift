//
//  ButtonBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 22/11/23.
//

import SwiftUI

struct ButtonBootcamp: View {
    
    // jadi kita punya nilai default pada saat belum ada yang di pencet button nya apabila di pencet button maka tittle : String akan berubah sesuai argument di action Button.
   @State var title : String = "this is my title"
    
    
    
    var body: some View {
        
        VStack(spacing: 50) {
            
            
            VStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Counting in 1")
                    .font(.largeTitle)
                    .fontWeight(.semibold)

            }
            
            // contoh button pertama
            VStack(spacing : 30) {
                Button("Button 1") {
                    title = "Button 1 was pressed"

                }
                .foregroundColor(.black)
//                .foregroundColor(.black)
//                .fontWidth(.compressed)
//                .font(.title3)
//                .background(
//                    Color.blue
//                        .frame(width: 100, height: 35)
//                        .cornerRadius(10)
//                )
                
                
            // contoh button yang kedua. (more dinamic)
                Button {
                    self.title = "Button 2 was pressed"
                } label: {
//                     kita bisa menambahkan semua yang sudah dipelajari sebelumnya disini.
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 100, height: 35)
                        )
                        .shadow(color: Color.red, radius: 7.5 , x: 5, y: 5)
                    
                    
                    // ide yang muncul
//                    buttonName()
//                        .foregroundColor(Color.black)
                }
                
                
            // contoh button yang ketiga
                Button {
                    title = "Button 3 was pressed"
                } label: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 100, height: 50)
                        .shadow(color: Color.black, radius: 8)
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .fill(Color.black)
                                .overlay {
                                    Image(systemName: "suit.heart.fill")
                                        .font(.title)
                                        .foregroundColor(.red)
                                }
                        }
                }
                
                
                
            // Contoh Button yang ke 4
                Button {
                    title = "Button 4 was pressed"
                } label: {
                    Text("Finish")
                        .foregroundColor(.gray)
                        .fontWidth(.compressed)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray, lineWidth: 2)
                                .frame(width: 100, height: 35)
                                
                                
                        }
                }


            }
            


            

            
            
            
            
        }
    }
}


// membuat sebuah button style dan menaruh di label button.

struct buttonName: View {
    var body: some View {
            Image(systemName: "trash")
            .font(.title)
            .background(
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color.red,Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 55, height: 55)
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 2)
                    )
            )
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
//        buttonName()
    }
}

// my small summary
// button Bootcamps
/*
 button atau tombol yang terdiri atas action dan modifier, most of application in ios is using a button, dimana apabila kamu menbuat button dan melakukan action ke suatu tempat.
 we click and go to the directions. that we set before
 
 // important.
 @state Var
 merupakan sebuah variable yang dapat berubah isinya. berkaitan erat dengan button. memberikan sebuah kemampuan kepada variable agar bisa berubah isinya di swift ui.
 
 jadi kalo var biasa itu tidak bisa di swift ui. harus memiliki sebuah
 
 
 
 button dibagi menjadi beberapa bagian
 1. button with string protocol and actions. dimana button ini harnya berisi sebuah kalimat dan bisa di modify atau diberikan modifier. contoh pertama.
 
 2. button with action and label. maksudnya adalah button mampu hold beberapa modifier dalam label. dimana kita bisa menambahkan semua yang sudah dipelajari sebelumnya. kita bisa menambahkan sebuah view pada label. dan ini merupakan sebuah button yang jauh lebih dinamis dibandingkan button pertama.
 
 
 */
