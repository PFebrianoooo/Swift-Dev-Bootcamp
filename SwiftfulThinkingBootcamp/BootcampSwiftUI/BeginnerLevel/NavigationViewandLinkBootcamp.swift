//
//  NavigationViewandLinkBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 13/12/23.
//

import SwiftUI





struct NavigationViewandLinkBootcamp: View {
    struct dataModel: Identifiable, Hashable {
        let id: String = UUID().uuidString
        let text: String
        let background: Color
    }
    
    
    let items: [dataModel] = [
        dataModel(text: "Hello Foia", background: .red),
        dataModel(text: "Hello Putra", background: .green),
        dataModel(text: "Hello Fajri", background: .blue)
    ]
    
    @State var isTransition: Bool = false
    @State var isAnimated: Bool = false
    
    var body: some View {
//        GeometryReader { reader in
            NavigationStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("categories".capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                
                                Spacer()
                                
                                // IMPLEMENTED NAVLINK IN NAVSTACK
                                    NavigationLink {
                                        withAnimation(.easeInOut(duration: 4.2)) {
                                            NewView()
                                                .transition(.move(edge: .leading))
                                        }
                                    } label: {
                                        Text("Press Me")
                                            .foregroundColor(.gray)
                                            .fontWeight(.semibold)
                                            .fontWidth(.condensed)
                                            .padding(.all, 7)
                                            .background(
                                                Color.black
                                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                            )
                                    }
                                
                                
                                
                            }
                            
                        }
                        
                        
                        // implement Custom array data model and nav link
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(items) { barangan in
                                        NavigationLink {
                                            Text("Next destination")
                                        } label: {
                                            viewNav(content: barangan.text, Color: barangan.background)
                                        }
                                    }
                                
                                }
                            }
                        }
                        

                    }
                    .padding(.horizontal, 10)
                }
                
               // NAVIGATION ITEMS AND TITTLE MENU
                .navigationTitle("this is tittle")
                .navigationBarTitleDisplayMode(.automatic)
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "house")
                            .fontWeight(.semibold)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Text("Toolbar placement")
                            .fontWeight(.semibold)
                    }
                }
            }
//        }
    }
}


struct NewView: View {
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("This is new View")
                }
                .padding(.horizontal, 10)
                
                HStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "person.3.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .foregroundColor(.green)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct viewNav: View {
    var content: String
    var Color: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.opacity(0.2))
                
            
            VStack {
                Text(content)
            }
        }
        .frame(width: 200, height: 150)

    }
}

struct NavigationViewandLinkBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewandLinkBootcamp()
    }
}


// small summary
// Navigation View and Navigation Link
/*
 Navigation View Merupakan container dimana kita bisa menaruh view didalamnya, pada navigation view terdapat beberapa modifier antara lain, navigation tittle dan toolbar
 ketika kita didalam navigaition view, kita bisa menambahkan navigation link dimana navigation link, dimana navigation view adalah fungsi yang dapat mensegue ke another screen with super eazy, dan memiliki effect yang bagus ketika mempush/segue ke layarnya dari sebelah kanan.
 pada dasarnya navigation tittle sama halnya dengan button di swift ui.
 
 mavigation view adalah container, kalo naro scrollview didalamnya.
 
 navigation view was deprecated, in ios 16.0 use navigation stack to use navogation in new version ios
 
 .navigationbarbackbuttonhidden(bool)
    pengaturan untuk menu navigation backbutton default ayatems
 
 REMEMBER
 SEMUA YANG BERKAITAN DENGAN NAVIGATIONSTACK AKAN MEMILIKI NAVIGATION LINK (BISA DILIHAT DALAM NEWVIEW STRUCT), DAN ATTRIBUT DEFAULT DIDALAM NAVIGATION STACK, SEGALA BENTUK MODIFIERNYA YANG ADA PADA NAVIGATION STACK BISA DI HILANGKAN ATAU DITAMPILKAN. NAVIGATION STACK BERFUNGSI UNTUK MENGHIRARKIKAN COLLCETION VIEW.
 NAVIGATION VIEW HANYA PERLU DI DEFINISIKAN SEBANYAK 1 KALI
 
 
 INTINYA KALO YANG BRKAITAN SAMA CONTAINER, CONTAINER ITU SENDIRI BERADA PALING LUAR DARI KODE, DAN PALING PERTAMA DIDEFINISIKAN
 
 
 */
