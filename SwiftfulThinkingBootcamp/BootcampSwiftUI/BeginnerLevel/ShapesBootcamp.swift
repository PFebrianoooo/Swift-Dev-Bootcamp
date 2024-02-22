//
//  ShapesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 03/11/23.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
//        Shapesnya.
//        Circle()
//        Ellipse()
//        Capsule(style: .circular)
//        Rectangle()
        RoundedRectangle(cornerRadius: 300)
        
        
//        semua modifier dibawah ini bisa diterapkan pada shapes circle, ellipse, capsule, dan Rectangle
//            .fill(Color.red)
//            .foregroundColor(Color.red)
//            .stroke()
//            .stroke(Color.red)
//            .stroke(Color.red, lineWidth: 20)
//            .stroke(Color.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, dash: [20]))
//            .trim(from: 0.2, to: 1.0)
            .frame(width: 350, height: 200)
        
//            modifier tambahan untuk Rectangle
//            .cornerRadius(20)
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}


// My Summary
/*
 Fungsinya shapes
 Circle()
 Elipse()
 Capsule(style: .contoniuous, .circular)
 capsule bagus untuk melatar belakangi sebuah Button agar dan Text telihat lebih menarik
 Rectangle()
 RoundedRectangle()
 rounded rectangle bagus untuk melatarbelakangi sebuah gambar atau text
 
 
 modifiernya.
 .fill() // Mengubah warna dari si shapes (Color.red)
 .foregroundColor() // mengubah warna dari si shapes (Color.red)
 .stroke() // mengatur garis tepi si shapes bisa merubah warnanya (Color.red), tebal tipisnya dengan ( lineWidth: Double), lalu jumlah garis tepi yang dipotong ( dash[] ) , dan bentuk tepinya (linecap: ), dengan bantuan fungsi StrokeStyle .stroke(Color.stroke. , style : StrokeStyle(linewidth: , lineCap: , dash: ))
 .trim() // memotong si shapes trim berkolaborasi dengan .stroke()
 
 */
