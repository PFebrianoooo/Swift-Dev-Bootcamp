//
//  PopoverBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 11/12/23.
//

// sheet
// animation
// transition

import SwiftUI

struct PopoverBootcamp: View {
    
    @State private var showScreen: Bool = false
    

    var body: some View {
        ZStack(alignment: .top) {
            Color.orange
                .ignoresSafeArea()
            
            VStack {
                Button {
                    withAnimation(Animation.easeInOut(duration: 1.2)) {
                                showScreen.toggle()
                        }
                } label: {
                    Text("Press Me! \(showScreen.description)")
                }
                .buttonStyle(.borderedProminent)
            }
            
//            METHOD 1 USING SHEET
//                .sheet(isPresented: $showScreen) {
//                    ViewScreen()
//                }
                
//               METHOD 2 USING TRANSITIONS
//            ZStack {
//                    if showScreen {
//                        ViewScreen(showScreen: $showScreen)
//                            .padding(.top, 100)
//                            .transition(
//                                .move(edge: .bottom)
//                            )
//                            .animation(.easeInOut(duration: 1.2), value: showScreen)
//                    }
//            }
//                    .zIndex(1.2)
//                membuat seluruh z stack ini akan selalu berada di depan vstack button agar tidak terjadi issing
                
//               METHOD 3  USING ANIMATIONS OFFSET
//            ViewScreen(showScreen: $showScreen)
//                .padding(.top, 100)
//                .offset(y: showScreen ? 0 : UIScreen.main.bounds.height)
            
//            METHOD 4 FULLSCREENCOVER
            .fullScreenCover(isPresented: $showScreen) {
                UseCaseExample()
                    .transition(.move(edge: .bottom))
            }

           
                
        }
    }
}



struct ViewScreen: View {
    
    
    // METHOD 1
    @Environment (\.dismiss) var dismiss
    
    // METHOD 2 AND 3
    @Binding var showScreen: Bool
    
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.green
                .ignoresSafeArea(.all)
            
            VStack {
                Button {
//                  dismiss()
                    showScreen.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                        .padding(.all, 5)
                        .background(
                            Color.white
                                .clipShape(Circle())
                        )
                }
                .padding(.all, 10)

            }
        }
    }
}


// use case dalam kehidupan sehari hari
struct UseCaseExample: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Image("Image-Profile")
                    .resizable()
                    .scaledToFill()
                // description
                    percobaan()
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct percobaan: View {
    
    let url = URL(string: "https://github.com//PFebrianoooo")
    let url2 = URL(string: "https://linkedin.com//PutraPebrianoNurba")
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Meet The Contributor")
                .font(.title2)
                .fontWeight(.semibold)
                .fontWidth(.condensed)
                .padding(.top, 10)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Putra Pebriano nurba".capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("University Of Muhamadiyah Jakarta")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("iOS Developer")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                }
                .padding(.top, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Meet me on another platforom just click on button below, if you want to feel better maybe you need to come with me together, i very like to looking for something new, until right now i havent a girlfriend, i just have a family. i love my all family and still love them till i die.".lowercased())
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                    
                    Text("Im still looking for a internship, if you wanted me to join you can call me or just click the button below".lowercased())
                        .font(.callout)
                        .multilineTextAlignment(.leading)
                    
                    VStack {
                        Text("find me on other platform".capitalized)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .fontWidth(.condensed)
                        
                        HStack(alignment: .center, spacing: 20) {
                            Spacer()
                            // github
                            if let url {
                                Link(destination: url) {
                                    Text("GitHub")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .padding(.all)
                                        .background(Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }

                            }
                            
                            
                            // linkedin
                            if let url {
                                Link(destination: url) {
                                    Text("linkedin")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .padding(.all)
                                        .background(Color.gray)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }

                            }
                            Spacer()
                        }
                        
                        Button {
                            dismiss()
                        } label: {
                            Text("Kembali")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.all)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))

                        }

                    }
                    .padding(.vertical)
                    
                    
                    }
                .padding(.top, 10)

            }
            .padding(.horizontal, 10)
                        
            
        }
        .background(Color.white)
        .cornerRadius(10)
        .offset(y: -50)
        
    }
}




struct PopoverBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        PopoverBootcamp()
//        ViewScreen()
        UseCaseExample()
        ScrollView {
            percobaan()
        }
    }
}


// sheet, animation and transitions
// Small Summary

/*
 bagaimana kita menggunakan sheet transitiond and animation untuk mendapatkan sebuah output yang sama menggunakan 3 cara berbeda.
 
 // REMEMBER
    sheet tidak menggunakan dismiss environment
    fullscreenCover Menggunakan dismiss environment.
    transitions and animastion using dismiss environment
 
 jadi untuk mengdismiss atau menegasikan state varaible caranya dnegan environment variable dismiss
 
 
 
 */
