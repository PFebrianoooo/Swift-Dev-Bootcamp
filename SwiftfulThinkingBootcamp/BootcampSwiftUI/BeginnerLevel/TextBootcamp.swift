//
//  TextBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 03/11/23.
//

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        // ngetes huruf formatting
        Text("hello guys this is my channel to understand more about swift and more and more and more hahahhahah ternya aku menemukannmu saat hariini ku mulai merapuhh") // .uppercased() .lowercased())
        
        // ngetes huruf modifier
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        // Modifier Text
//            .font(.title)
//            .fontWeight(.semibold)
//            .underline(true, color: .red)
//            .italic()
//            .strikethrough(true, color: .blue)
//            .fontDesign(.serif)
//            .foregroundColor(.brown)
//            .font(.system(size: 30, weight: .semibold, design: .serif))
        
        // Formatting Text
//            .baselineOffset(10)
//            .kerning()
            .multilineTextAlignment(.leading)
            .frame(width: 200, height: 100, alignment: .leading)
            .minimumScaleFactor(0.6)
        
        
    }
}

struct TextBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextBootcamp()
    }
}


// Litte Summary.
/*
 components.
 Text() // menambahkan text ke Ui
 
 Modifier Text.
 mengubah tipe huruf besarnya huruf dan juga mengubah warna huruf bisa dibaca dibawah untuk memahami apa itu modifier
 
 .font() // untuk menentukan size fonts, seperti title, caption, headline dan lainnya.
 .fontWeight() // untuk menentukan berat atau ketebalan fonts seperti bold, light, ultralight dan lainnya atau bisa dengan menggunakan modifier langsung seperti .bold(), .ultralight(), .semibold()
 .underline() // menggaris bawahi text bisa menggunakan modifier apakah aktif garisbwahnya dan jjuga color dari garis bawahnya.
 .italic() // memiringkan huruf
 .striketrough() // menggaris tengahkan huruf (memotong huruf)
 .fontdesign() // menentukan tipe huruf yang digunakan seperti times new roman, helvetica dan lainnya
 .foregrundColor() // mengganti warna pada huruf yang ada
 .font(.system(size: , weight: , design: )) // untuk mengubah huruf dengan beberapa modifier dalam satu baris menggunakan size artinya kita menggunakan size kita sendiri tanpa melibatkan font size yang disediakan oleh systems tetapi font tetap tidak berubah seiring berganti device atau media queries, weight sama halnya dengan fontWeight() , dan design sama dengan fungsi fonDesigh() di compund dalam satu baris
 
 Formatting text
 .multilineTextAllignment() // mengatur huruf lebih dari satu baris serta perataanya
        .leading // mengatur huruf agar rata kir
        .center // this is default pengaturan di swiftUI
        .trailing // mengatur huruf agar rata kanan
 .baselineOffset() // mengatur line spacing antar baris
        aturan dengan Double apabila ( - ) maka mengatur atasnya baris kalo ( + ) mengatur keseluruhan
 .kerning // mengatur jarak antar huruf
 .frame () // mengatur keseluruhab batas baris sesuai height width jadi kalo make frame apabila hurufnya di framekan maka apabila sudah mentok pada frame maka huruf akan kebawah dan yang tidak masuk ke frame akan diabaikan dengan ...
    height // mengatur ketiggian batasan
    width // mengatur lebar batasan
    allignment // mengatur perataan huruf di compund dalam frame
 .minimumScaleFactor() // mengatur ukuran huruf asli didalam frame agar bisa muat didalam frame
 .lowercase() // mengatur agar huruf semuanya kecil
 .uppercase() // mengatur agar huruf semuanya besar
 .capitalized() // mengatur huruf agar depannya besar
 keduanya ditulis pada ujung doublecolon(") huruf.
 
 
 */

