//
//  ScrollViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 17/11/23.
//

import SwiftUI

struct ScrollViewBootcamp: View {
    
    let Columns : [GridItem] = [
        GridItem(.flexible(), spacing: nil, alignment: nil)
    
    ]
    var body: some View {
        //        first Material
        //        ScrollView(.vertical, showsIndicators: false) {
        //            VStack {
        //                ForEach(0..<20) { _ in
        //                    RoundedRectangle(cornerRadius: 10)
        //                        .frame(width: 300, height: 200)
        //
        //                }
        //            }
        //        }
        
        //        second material
        //        basic template of netflix or spotify
        
        //        ScrollView {
        //            VStack (spacing: 20) {
        //                ForEach(0..<10) { _ in
        //                    ScrollView(.horizontal, showsIndicators: false) {
        //                        HStack(spacing: 10) {
        //                            ForEach(0..<10) { _ in
        //                                RoundedRectangle(cornerRadius: 15)
        //                                    .frame(width: 150, height: 200)
        //
        //                            }
        //                        }
        //                    }
        //                }
        //            }
        //            .padding()
        //        }
        
        
        //        impleentation in real world ui Make.
        
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // top description view
                    HStack {
                        HStack {
                            Image("Image-2")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            
                            Text("Good Morning")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                        
                        Image(systemName: "bell")
                            .font(.system(size: 25))
                    }
                    
                    
                    //                    horizontal scroll view
                    VStack(alignment: .leading) {
                        Text("Liblary on tour")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack (alignment: .center){
                                ForEach(0..<5) { _ in
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 380, height: 150)
                                }
                            }
                        }
                    }
                    .padding(.bottom,10)
                    //                    .background(.red)
                    
                    Divider()
                    
                    //                    Best writer
                    VStack(alignment: .leading) {
                        Text("Best Writer")
                            .font(.subheadline)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0..<10) { _ in
                                    VStack {
                                        Image("Image-2")
                                            .resizable()
                                            .frame(width: 70, height: 70)
                                            .clipShape(Circle())
                                        
                                        Text("Fiersa Besari")
                                            .multilineTextAlignment(.center)
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                    }
                                    .frame(width: 100, height: 100)
                                    .background(Color.green.opacity(0.3))
                                    .cornerRadius(10)
                                }
                            }
                        }
                    }
                    .padding(.bottom, 10)
                    //                    .background(.blue)
                    
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Best Books")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: Columns, spacing: 10) {
                                ForEach(0..<20) { _ in
                                    HStack {
                                        Image("Image-2")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        
                                        VStack(alignment: .leading) {
                                            Text("Hello list row view")
                                                .font(.system(size: 20))
                                                .bold()
                                            
                                            HStack {
                                                Text("lorem sakara di berikan buku sekitar beberapa buah dan diberikan anak yang sholeh")
                                                    .font(.caption)
                                                
                                                Image(systemName: "cart.badge.plus.fill")
                                                    .font(.system(size: 30))
                                                    .frame(width: 50, height: 50)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                    .frame(width: .infinity, height: 120)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.black, lineWidth: 5)
                                    }
                                }
                            }
                            
                        }
                    }
                    
                    
                }
            }
            .padding(.top, 55)
            .padding(.horizontal, 4.5)
        }
        .ignoresSafeArea()
        
    }
}

struct ScrollViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewBootcamp()
    }
}

//my small summary
/*
 Scroll View
 Scroll View merupakan sebuah keyword yang digunakan untuk mebuat layar agar bisa di scroll secara vertical dan horizontal, scrollview berteman baik dengan stacking dan looping
 
 inisialisasi
 ScrollView(.axes, showsIndicator: ) {args}
 
    .axes terdiri atas 2 bagian yaitu .horizontal and .vertical
 
 divider()
 berfungsi untuk pembatas antara view dengan view lainnya
 berbeda dengan spacer divider tidak me push view ke maksimal frame melainkan membataskan saja antara view objek
 
 */
