//
//  PopoverModifierBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 23/02/24.
//

import SwiftUI

struct PopoverModifierBootcamp: View {
    @State private var isPresented: Bool = false
    @State private var option: [String] = [
    "Very Happy","Average","Very Bad"
    ]
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Button("rate my apps".capitalized) {
                    isPresented.toggle()
                    
                }
                .foregroundStyle(Color.white)
                .fontWeight(.semibold)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .background(
                    .thinMaterial
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
                // material discussions
    //            .popover(isPresented: $isPresented) {
    //                // can place content in here
    //                PopoverModifierBootcamp.popOverView
    //                    .presentationCompactAdaptation(.popover)
    //            }
                
                
                .popover(
                    isPresented: $isPresented,
                    attachmentAnchor: .point(.top)) {
                            ScrollView(.vertical, content: {
                                VStack(alignment: .leading) {
                                    ForEach(option, id: \.self) { optionFeedback in
                                            Button(optionFeedback.capitalized) {
                                                // actions
                                            }
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                            
                                            if optionFeedback != option.last {
                                                Divider()
                                            }
                                        }
                                    }
                                .padding(20)
                                .presentationCompactAdaptation(.popover)
                            })
                }
                
                
//                Spacer()

            }
        }
        
    }
}

#Preview {
    PopoverModifierBootcamp()
}

extension PopoverModifierBootcamp {
    static var popOverView: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Color.blue)
            
            Text("Hello you are in Pop Over")
                .fontWeight(.semibold)
                .font(.headline)
            
        }
        
    }
}


// small summary

/*
POPOVER MODIDIER FROM SWIFTUI FRAMEWORK
 popover merupakan sebuah cara yang dilkaukan untuk mepopup atau menampilkan sebauh layar kepada user apabila mengklik button atau item dan akan menampilkan sebuah popover dari bottom of the screen. Sama halnya seperti full screen cover dan sheet
 
 popover dibagi menjadi 2
 1. .popover(item: T##Binding<Identifiable?>, attachmentAnchor: T##PopoverAttachmentAnchor, arrowEdge: T##Edge, content: T##(Identifiable) -> View)
 2. .popover(isPresented: .constant(true), attachmentAnchor: .point(UnitPoint.bottom), arrowEdge: .top, content: { /* isi dari content */ })
 
 
 NB:
 attachment achor digunakan untuk angkur atau patokan dari popover itu sendiri
 
 
 

 modifier tambahan untuk content popover
 1. .presentationCompactAdaptation(.sheet)
 modifier diatas untuk pengaturan untuk ukuran size berbeda pada fisik hp, diatur untuk visualnya atau gambarannya sama dengan yang kita atur ex: sheet
 tapi untuk modifier full screen cover dibutuh kan environment tambahan untuk mendismiss popover view
 
 
 TIPS:
 1. untuk popover bisa ditaruh dimana saja untuk kebutuhannya dan merupakan modifier, jadi bisa di tempel dimana saja baik dalam stacking ataupun dalam elements.

 */
