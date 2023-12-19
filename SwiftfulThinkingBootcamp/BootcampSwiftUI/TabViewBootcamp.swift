//
//  TabViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 19/12/23.
//

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var tabViewSelection: Int = 0
    @State var image: [String] = [
        "heart.fill", "lanyardcard.fill", "house.fill"
    ]
    
    @State var animated: Bool = false
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        // first Material of Course
//        TabView(selection: $tabViewSelection) {
//            Group {
//                HomeViewTabView(selectedTabView: $tabViewSelection)
//                    .tabItem {
//                        Image(systemName: animated ? "house.fill" : "house.lodge" )
//                        Text("Home")
//                    }
//                    .tag(0)
//
//                Text("Search func call View")
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }
//                    .tag(1)
//
//                Text("Profile func call View")
//                    .tabItem {
//                        Image(systemName: "person.fill")
//                        Text("Profile")
//                    }
//                    .tag(2)
//            }
//            .toolbarBackground(Color.green.opacity(0.3), for: .tabBar)
//            .toolbarBackground(.visible, for: .tabBar)
//        }
//        .tint(Color.black)
        
        
        
        // second material of course
        TabView (selection: $tabViewSelection){
            ForEach(0..<3) { items in
                    Image(systemName: "\(image[items])")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .foregroundColor(.red)
                }
            .frame(maxWidth: .infinity)
            .frame(height: 400)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray, Color.gray.opacity(0.4)]),
                               startPoint: .topLeading,
                               endPoint: .bottom
                              )
                .cornerRadius(10)
            )
        }
        .frame(height: 395)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onReceive(timer) { _ in
            withAnimation(Animation.easeInOut(duration: 1.5)) {
                tabViewSelection = tabViewSelection < 3 ? tabViewSelection + 1 : 0
            }
        }
        
        
        
    }
}

struct TabViewBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewBootcamp()
    }
}


// extracted View
struct HomeViewTabView: View {
    @Binding var selectedTabView: Int
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                Color.green
                    .ignoresSafeArea(edges: .top)
                
                VStack {
                    Text("Home View ")
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                    
                    Button {
                        selectedTabView = 3
                    } label: {
                        Text("Go to home view".capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .buttonStyle(.borderedProminent)

                }
            }
        }
        .background(Color.red)
        
    }
}


// small summary
// Tab View and Tab View Style
/*
 Tab view adalah component untuk membuat menu pada bagian bawah layar, dimana bisa men segue ke bagian lain dari view dalam aplikasi. tab view adalah container dimana kita bisa mengunakan tabview untuk menswgue ke views lainnya
 
 macam macam TabView
 1. TabView(content: T##() -> View)
 2. TabView(selection: <#T##Binding<Hashable>?#>, content: <#T##() -> View#>)
    jadi pada tabview tipe ini menggunakan binding variable, dimana binding variable ini berguna untuk menentukan mana tab yang dibuka paling duluan pada saat aplikasi dibuka.

 Paging Tab View merupakan component view dimana kita bisa membuat sebuah carousel scroll horizontal. Yang merupaka salah satu conponent dari tab view
 
 INGAT KALO MENGGUNAKAN TABVIEW MERUPAKAN CONTAINER, DAN DEEFINISIKAN MENUNYA MENGGUNAKAN .TABITEM {code}
 
 */
