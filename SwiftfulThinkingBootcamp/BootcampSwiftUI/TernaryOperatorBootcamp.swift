//
//  TernaryOperatorBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 05/12/23.
//

import SwiftUI

struct TernaryOperatorBootcamp: View {
    @State private var isChanging: Bool = false
    @State private var showCircle: Bool = false
    
    var body: some View {
        VStack {
            
            // tutorial 1.2
//            Button {
//                showCircle.toggle()
//            } label: {
//                Text("Click Here")
//                    .foregroundColor(.black)
//                    .padding(.all, 10)
//                    .background(
//                        Color.gray
//                            .cornerRadius(10)
//                    )
//            }
//
//
//
//            // cara sebelumnya
//            if showCircle {
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 100, height: 100)
//            } else {
//                Circle()
//                    .fill(Color.green)
//                    .frame(width: 100, height: 100)
//            }

//            Spacer()
            
            
            // Implementation of Ternary Operator
            // conditional ? true : false
            // berdasarkan state variable
            Button {
                isChanging.toggle()
            } label: {
                Text("Click Here")
                    .foregroundColor(isChanging ? Color.black : Color.pink)
                    .padding(.all, 10)
                    .background(isChanging ? Color.green : Color.blue)
                    .cornerRadius(10)
            }
            
            Text(isChanging ? "STARTING STATE" : "ENDING STATE")
            
            RoundedRectangle(cornerRadius: 10)
                .fill(isChanging ? Color.blue : Color.gray)
                .frame(
                    width: isChanging ? 200 : 250,
                    height: 150
                )
            
                
                
            
            Spacer()
        }
    }
}

struct TernaryOperatorBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TernaryOperatorBootcamp()
    }
}

// small summary
// ternary oprator
/*
 ternary operator adalah shorthand dari if else statement dimana bentuk argumennya hanya segaris. jadi dengan ternary operator kita tidak melakukan prinsip dry dimana kita menulis kode sebanyak 2 kali padahal isinya berbeda sedikit saja.
        // lihat tutorial diatas 1.2
 
            basic ternary operator
            kondisi ? true : false
 
    kurang efisien menurut UI perspective karena kita menuliskan 2 hal yang sama yang hanya memiliki perbedaan di warna saja. dan melanggar prinsip DRY.
        oleh karena itu menggunakan ternary operator jauh lebih efisien untuk kasus seperti ini
 
    REMEMBER !!
 untuk kasus apapun berkaitan dengan modifier akan bisa menggunakan ternary operator. jadi berlaku untuk semua modifier
 */
