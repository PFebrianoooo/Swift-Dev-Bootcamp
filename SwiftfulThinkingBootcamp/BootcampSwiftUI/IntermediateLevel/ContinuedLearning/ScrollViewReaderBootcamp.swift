//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 02/03/24.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    
    @State var textInput: String = ""
    @State var scrollToIndex: Int = 0
    @State var alertIsOn: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            // text field header
            HStack(spacing: 4) {
                Button {
                    if let index = Int(textInput) {
                        scrollToIndex = index
                    }
                    
                    if let currentIndex = Int(textInput) {
                        if currentIndex > 50 {
                            alertIsOn.toggle()
                        }
                    }
                    
                    textInput = ""
                } label: {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                        .frame(width: 45, height: 45)
                        .background(
                            Color.gray.opacity(0.4)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        )
                        .foregroundStyle(Color.black)
                }
                
                TextField("Search Here", text: $textInput)
                    .padding(.leading)
                    .frame(width: .infinity, height: 45)
                    .background(
                        Color.gray.opacity(0.4)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 5)
            
            
            // elements scroll View
            ScrollView(.vertical) {
                ScrollViewReader { proxy in
                    ForEach(0..<50) { indexes in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(width: 350, height: 200)
                                .shadow(radius: 15)
                            
                            Text("Element Number \(indexes)")
                                
                            
                        }
                        .padding(.vertical, 25)
                        .padding(.horizontal)
                        .id(indexes)
                        
                    }
                    .onChange(of: scrollToIndex) { value in
                        onchangeFunction(values: scrollToIndex, valuePass: proxy)
                    }
                }
            }
            .scrollIndicators(.never)
            .alert("Check your Input", isPresented: $alertIsOn) {
            } message: {
                Text("Please check again you input, make sure is not more than 50 items")
            }
            
        }
    }
    
    
    // MARK: function of code
    func onchangeFunction(values: Int, valuePass: ScrollViewProxy) {
        withAnimation(.spring()) {
            valuePass.scrollTo(scrollToIndex, anchor: .top)
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}

// small summary
/*
 Scroll View Reader
 
 Scroll View Reader merupakan container dimana befungsi untuk memberikan scroll vertikal maupun horizontal, namun pada Scroll View Reader menggunakan tambahan fitur untuk membuat kita bisa mencari apa yang diinginkan dan akan automatic menuju yang objek yang diinginkan.
 
 NB:
 1. penerapan scroll View Reader Digunakan untuk chat app ketika berada didalam percakapan atau group
 2. Scroll View Reader digunakan didalam Scroll View container.
 3. fungsi anchor pada proxy.scrollTo(id: , anchor: ) u/ memberikan display berada ketika selesai ditemukan.
 
 */
