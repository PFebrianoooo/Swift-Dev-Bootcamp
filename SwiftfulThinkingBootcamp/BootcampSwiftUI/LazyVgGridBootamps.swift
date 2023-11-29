//
//  LazyVgGridBootamps.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 18/11/23.
//

import SwiftUI

//struct LazyVgGridBootamps: View {
//
//    // jadi fungsi di ini mewakilkan kolom, apabila array isinya 10 maka kolomnya 10, menyesuaikan isi dari array untuk kolom yang dimiliki
//    let columns: [GridItem] = [
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil)
//    ]
//
//    // images arrays
//    var myImage: [String] = ["Image-2", "Image-2","Image-2","Image-2","Image-2","Image-2"]
//
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 2) {
//                ForEach(myImage.indices, id: \.self ) { items in
//                    ZStack(alignment: .top) {
//                        Color.blue
//                            .frame(width: 130, height: 250)
//                            .cornerRadius(10)
//
//                        Image("\(myImage[items])")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 130, height: 200)
//                        .cornerRadius(10)
//                    }
//                }
//            }
//            .padding(.horizontal,4)
//            .ignoresSafeArea()
//        }
//    }
//}


struct LazyVGridBootcamps: View {
    
    // setting kolom
    // spacing disini berguna untuk mengatur space atau jarak pada antar kolom
    let Columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
//     maksudnya dibagi 3 adalah merepresentasioan kolom pada columns
//     membuat objek yang mau di gridkan membagi ukuran sesuai layar ui
    let screenSize = UIScreen.main.bounds.width / 3
    
    var body: some View {
        
        
            ScrollView {
                Rectangle()
                    .frame(width: .infinity, height: 400)
                    .overlay {
                        Text("Basic template instagram profile, u can put information profile in here".lowercased())
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                // spacing pada lazy vrid untuk atur space vertical/baris diantara 2 objek horizontal
                LazyVGrid(columns: Columns, spacing: 0) {
                    ForEach(0..<45, id: \.self ) { _ in
                            Image("Image")
                            .resizable()
                            .border(Color.white, width: 0.5)
                            .scaledToFit()
                            .frame(width: screenSize, height: screenSize)
                        
                    }
                    
                }
            }
        
        
        
    }
}


// implementation lazy vgrid little advance

struct LazyVGridBootcamps2: View {
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil)
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
//        ScrollView(.horizontal, showsIndicators: false) { // use this if use lazyHGrid
            
            // lazy vrid little advance argue and v grid
//            LazyVGrid // use this if want to make lazy
                LazyHGrid(
//                     columns: columns // use this if is lazy v grid
                    rows: columns,
                    alignment: .center,
                    spacing: 6,
                    pinnedViews: [.sectionHeaders], content: {
                    // section content view
                        // berisi section argument dan header
                        Section {
                            ForEach(0..<12, id: \.self) { items in
                                Rectangle()
                                    .frame(width: 100)
//                                    .frame(height: 100) // user thisif is lazyVgrid
                            }
                        } header: {
                            HStack(spacing: 20) {
                                Image("Image")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                
                                Text("Section 1")
                                    .font(.headline)
                                    .bold()
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.all, 5)
                        }
                        
                        Section {
                            ForEach(0..<45) { items in
                                Rectangle()
                                    .frame(width: 100)//                                    .frame(height: 100) // user this if is lazyVgrid
                            }
                            
                        } header: {
                            HStack(spacing: 20){
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Text("Section 2")
                                    .font(.headline)
                                    .bold()
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(.all, 5)
                            
                        }

                        
                        
                })
            
            
            // lazy VGrid and  HGrid beginner basic argue
//            LazyVGrid(columns: columns) {}
//            LazyHGrid(columns: columns) {}
            
        }
            
    }
}


// insytagram profile clone SwiftUI
// implementation of lazy vrid and whole material until lazy v grid
struct InstagramProfile: View {
    let columns : [GridItem] = [
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil)
    ]
    
    
    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                // top profile
                
                HStack {
                    HStack(spacing: 30){
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .bold()
                        
                        Text("p.febrianoo_".lowercased())
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10) {
                        Image(systemName: "plus")
                            .font(.title2)
                            .bold()
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.title2)
                            .bold()
                    }
                }
                .padding(.horizontal ,10)
                
                // image and followers info
                HStack(spacing: 60) {
                    Image("Image-2")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
 
                    HStack(spacing: 20){
                        VStack {
                             Text("1")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Posts")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        VStack {
                             Text("1,355")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Followers")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        VStack {
                             Text("728")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Following")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.all ,5)
                
                
                // profile username and status and mutual friends
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("404 Not Found")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Text("Welkam Tu De Jangel")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    
                    HStack{
                        HStack(spacing: -15) {
                            ForEach(0..<3) { _ in
                                Image("Image-2")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 35, height: 35)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 1)
                                    )
                            }
                        }
                        
                        Text("Followed by Ga.gelas,septiagrni_ and 48 others")
                            .font(.caption2)
                            .fontWeight(.semibold)
                        
                    }
                }
                .padding(.horizontal ,15)
                
                //  button following and message
                HStack(alignment: .center) {
                    Button {
                        // action
                    } label: {
                        Text("Following")
                            .font(.subheadline)
                            .foregroundColor(.green)
                            .fontWeight(.semibold)
                            .frame(width: 157, height: 35)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(10)
                    }
                    
                    Button {
                        // action
                    } label: {
                        Text("Message")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .frame(width: 157, height: 35)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(10)
                    }
                    
                    Button {
                        // action
                    } label: {
                        Image(systemName: "person.badge.plus")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .frame(width: 35, height: 35)
                            .background(Color(uiColor: .systemGray4))
                            .cornerRadius(10)
                    }

                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal ,10)
                
                
                
                
                // stories queue
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<6) { items in
                            VStack(spacing: 2) {
                                Image("Image-2")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())

                                
                                Text("Highlight \(items + 1)")
                                    .font(.caption)
                                    .fontWeight(.semibold)
                            }

                        }
                    }
                    .padding(.all ,10)
                }
                
                Divider()
                
                HStack(alignment: .center, spacing: 150) {
                    Image (systemName: "circle.grid.3x3.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "person.crop.rectangle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .frame(maxWidth: .infinity)
                
                Divider()
                
                
                // grid items
                VStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(0..<51) { items in
                                    Image("Image-2")
                                    .resizable()
                                    .frame(height: 125)
                                    .border(Color.white, width: 0.5)
                            }
                        }
                    }
                }
                
                
                
            }
        }
    }
}




struct LazyVgGridBootamps_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            //        LazyVgGridBootamps()
                    LazyVGridBootcamps()
                    LazyVGridBootcamps2()
            InstagramProfile()
        }
    }
}




// small summary
/*
 Lazy Vgrid
 lazy vgrid and Hgrid merupakan sebuah keyword atau fungsi yang hidup di swift dimana lazy vgrid berfungsi untuk mengatur gambar yang ada didalam kotak grid
 
 jadi lazy vgrid bekerja apabila data yang ada belum di scroll maka data tersebut belium dibuat, apabila di scroll kebawah maka data tersebut akan dibuat.
 
 lazyVgrid { args }
 
 pada Colums merupakan array dari items intinya kita mau berapa besar kolom yang dimau
 
 3 option untuk ukuran atau size
 1. fixed artinya ukuran maksimal width atau lebar kolom sesuai yang di atur dalam float. di container dalam array GridItems
 apabila ditetapkan fixed maka di code objek hanya ditaruh height nya aja.
 
 2. flexible yang artinya dia akan memenuhi daripda frame atau layar
 dimana pada flexible terdapat min and max
 fleksible sangat cocok untuk different platform, maksudnya grid akan menyesuaikan ukuran layar yang dimiliki, akann menyesuaikan sesuai dengan screen width and height.
 
 3. adaptive dalam kasus grid items array dimana apabila terdapat 3 kolom pada lazy vrid, maksudnya adaptive, jika satu kolom di deklarasikan di array grid item, maka seluruh ketiga kolom sebelummnya akan dianggap menjadi satu, dan diukur dalam minimum colom dan maksimum colom, apabila di grid item array 2 maka 3 kolom sebelumnya dibagi 2, dan seterusnya.
 
 
 lazy vgrid little advance
 inisialisasi
 
 LazyVGrid(columns: [GridItem], alignment: HorizontalAlignment, spacing: CGFloat?, pinnedViews: PinnedScrollableViews) {
     // args
 }
 
 untuk columns, spacing dan alignment sama seperti lazy vgrid beginner. array dan juga spacing antar barisnya dan alligment semua itemsnya.
 perbedaan hanya terdapat pada content dimana, pada content, bisa memiliki beberapa opsi view
    1. section, terdapat hedaer and footer
        dimana pada header kita bisa menaruh apapun di header, misalkan button, Imagesystem name dan lain sebagainya.
 untuk pinned views terdapat 2 opsi yaitu header dan footer, dimana memiliki efek pada saat kita scrool layar tersebut.
 
 
 LazyHGrids
 pada dasarnya h grid sama saja dengan vgrid bedanya h grid ini horizontal dan kolomnya merepresentasikan baris yang dimiliki, deklarasi columns menandakan baris yang dimau dan scroll view harus horizontal
 
 
 
 
 
 */
