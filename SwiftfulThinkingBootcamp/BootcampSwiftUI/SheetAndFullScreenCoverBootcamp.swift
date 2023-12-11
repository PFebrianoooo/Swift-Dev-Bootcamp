//
//  SheetAndFullScreenCoverBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/12/23.
//

import SwiftUI

struct SheetAndFullScreenCoverBootcamp: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color("edlinkBackground")
                .ignoresSafeArea()
            
                
            Button {
                showSheet.toggle()
            } label: {
                Text("Press Me")
                    .foregroundColor(.white)
            }
            .buttonStyle(.borderedProminent)


            
//            learning material
//            .sheet(isPresented: $showSheet) {
//                // jangan gunakan if else statement di argument ini.
//                // dan jangan pernah. Akan menghasilkan error saja.
//                ViewSheets()
//
////                    .presentationDetents([.height(250), .medium])
//                    .presentationDetents([.fraction(0.5), .large])
//                    .presentationDragIndicator(.automatic)
//            }
            
            .fullScreenCover(isPresented: $showSheet) {
//                ViewSheets()
                FullScreenCover()
                
                    .presentationDetents([.fraction(0.5), .large])
                    .presentationDragIndicator(.automatic)

                    
            }
            
            
            
        
        }
    }
}

// penerapan pada sheet
struct ViewSheets: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.68)
                .ignoresSafeArea()
            VStack {
                Text("Links")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                
                Button {
                    
                } label: {
                    HStack(spacing: 25) {
                        Image(systemName: "link")
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 0.5)
                                    .frame(width: 50, height: 50)
                            }
                        
                        VStack(alignment: .leading) {
                            Text("Alamat Toko")
                                .fontWeight(.semibold)
                            
                            Text("https://github.com/PFebrianooo")
                                .font(.caption)
                                .tint(Color.white)
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.bottom, 25)

                }

                
                HStack(spacing: 25) {
                    Image(systemName: "link")
                        .font(.title)
                        .foregroundColor(.white)
                        .overlay {
                            Circle()
                                .stroke(Color.white, lineWidth: 0.5)
                                .frame(width: 50, height: 50)
                        }
                    
                    VStack(alignment: .leading) {
                        Text("Alamat Toko")
                            .fontWeight(.semibold)
                        
                        Text("https://github.com/PFebrianooo")
                            .font(.caption)
                            .tint(Color.white)
                            
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                }
                
            }
            .padding(.horizontal, 15)
            .padding(.top, 30)
            
        }
    }
}


// penerapa pada fullscreencover yang harus dilengkapi dengan dismiss
struct FullScreenCover: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View  {
        ZStack(alignment: .topLeading) {
            Color.gray
                .ignoresSafeArea()
            
            VStack {
                Button {
                    dismiss()
                    
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                        .background(
                            Color.white
                                
                        )
                        .clipShape(Circle())
                        .padding(.all)
                }

            }
        }
    }
}


struct SheetAndFullScreenCoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
            SheetAndFullScreenCoverBootcamp()
//            ViewSheets()
//            FullScreenCover()
//        }
    }
}

// small summary
//sheet and fullscreen cover bootcamp
/*
 .sheet (Bottom Sheet)
 sheet adalah popupscreen segue yang kita bisa hadirkan di bagian zstack layar. di bagian depan layar. dimana sheet berukuran setengah layar
 
 .fullScreenCover
 fullscreencover adalah pada dasarnya adalah sama seperti sheet tetapi fullscreencover ukurannya memenuhi layar hanphone dan berada di top zstack layar, namun pada fullscreencover membutuhkan environment presentationmode dismiss dalam ios 16 ++
        
 
 modifier sheet dan fullscreencover
    .Presentation detends
        .presentationDetents([.height(250), .medium])
        .presentationDetents([.medium])
        Mengatur ukuran dari sheet yang diinginkan yang didalamnya berisi array, untuk mengatur ukuran dari sheet, dan indeks .height menyatakan ketika layar pertama kali di pop up ke view hirarki, dan medium menyakatakan kondisi maksimal layar bisa di drag
 
        Kalo yang kedua menyatakan ukuran saat pertama kali di pop up dan maksimal ukuran ketinggian dari heights

            Modifiernya
        1. fraction Berguna untuk tampilan saat pertama kali sheet pop up berdasarkan ukuran maksimal sheet yaitu pada index ke 2
        2. medium untuk mengatur setengah sheet
        3. height() untuk ngatur ketinggian sheet
        4. large untuk mengatur maksimal sheet
 
    .presentation drag indicator
        ikon garis yang uncul di top sheet, seperti tautan link di instagram, fungsi presnentation drag indicator untuk mengatur visibilitas dari tombol tsb.
 
 
fullsceencover dan sheet tidak bisa digunakan berbarengan harus salah satu per view hirarki.
fullscreencover dan sheet hampir sama perbedaanya adalah pada sheet tidak bisa full satu layar sedangkan fullscreencover bisa satu layar penuh untuk view hierarchy, gampangnya dia bisa full satu layar.
 
 fullscreen cover tidak bisa di drag, so jadi perlu adanya dismiss
 
 
 
 // deprecated in ios 16
 // bagaimana kita mendismiss/menutup sheet PROBLEM
 @environment (\.isPresented) var isPresented
 
 gunakan @environment (\.dismiss) var dismiss
 
 
 
 
 */
