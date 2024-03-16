//
//  SortFilterAndMapBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 06/03/24.
//

import SwiftUI

struct UserModelMappingArray: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class MappingArraysViewModel: ObservableObject {
    @Published var userData: [UserModelMappingArray] = []
    @Published var filteredArrays: [UserModelMappingArray] = []
    @Published var mapingArray: [String] = []
    
    init () {
        getUsers()
        filteredData(name: "this parameter for challenge")
        
    }
    
    func submitTrigger(inputText: String) {
        withAnimation(.easeInOut) {
            self.filteredData(name: inputText)
        }
    }
    
    func filteredData(name: String) {
        // sort
        /*
         filteredArrays = userData.sorted { ( user1, user2 ) -> Bool in
             return user1.points > user2.points
         }
         
         filteredArrays = userData.sorted(by: {$0.points < $1.points})
         */
        
        // filtered
        /*
        filteredArrays = userData.filter({ user  in
        //             return user.isVerified
        //             return user.name.contains(name)
        //             return !user.isVerified
        //             return user.points > 15
                 })
        
                 filteredArrays = userData.filter({
                     $0.isVerified
         //            !$0.isVerified
         //            $0.name.contains("n")
         //            $0.points > 10
                 })
         */
        
        // map
         mapingArray = userData.compactMap({ (user) -> String in
             return user.name
         })
        
//         mapingArray = userData.compactMap({ $0.points })
    }
    
    func getUsers() {
        let user1 = UserModelMappingArray(name: "Putra", points: 75, isVerified: true)
        let user2 = UserModelMappingArray(name: "Jamal", points: 150, isVerified: false)
        let user3 = UserModelMappingArray(name: "Samantha", points: 200, isVerified: true)
        let user4 = UserModelMappingArray(name: "Blair", points: 250, isVerified: true)
        let user5 = UserModelMappingArray(name: "Ariana", points: 10, isVerified: false)
        let user6 = UserModelMappingArray(name: "Kurt Cobain", points: 25, isVerified: false)
        let user7 = UserModelMappingArray(name: "Gangga", points: 50, isVerified: true)
        let user8 = UserModelMappingArray(name: "Junaidy", points: 125, isVerified: false)
        let user9 = UserModelMappingArray(name: "Jurgenn", points: 5, isVerified: true)
        let user10 = UserModelMappingArray(name: "Klopp", points: 15, isVerified: false)
        
        userData.append(contentsOf:[
            user1, user2, user3, user4, user5, user6, user7, user8, user9, user10
        ])
        
    }
    
}

struct SortFilterAndMapBootcamp: View {
    @StateObject var VM: MappingArraysViewModel = MappingArraysViewModel()
    @State var inputText: String = ""
    var body: some View {
        mappingArray
    }
    
    // MARK: Challenge
    var challenge: some View {
        VStack(spacing: 0) {
            VStack {
                TextField("Search Here", text: $inputText)
                    .frame(maxWidth: .infinity)
                    .frame(height: 35)
                    .padding(.leading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1.0)
                    )
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .submitLabel(.search)
                    .onSubmit {
                        VM.submitTrigger(inputText: inputText)
                    }
            }
            .padding(.vertical, 5)
            .background(Color.grapeColor)
            
            ScrollView(.vertical) {
                VStack {
                    if inputText.isEmpty {
                        ForEach(VM.userData) { items in
                            VStack(alignment: .leading ,spacing: 0){
                                Text(items.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Text("Points: \(items.points)")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                    Spacer()
                                    
                                    if items.isVerified {
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundStyle(Color.blueberryColor)
                                    }
                                }
                            }
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(
                                Color.gray
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                            .padding(.horizontal)
                        }
                    } else {
                        ForEach(VM.filteredArrays) { items in
                            VStack(alignment: .leading ,spacing: 0){
                                Text(items.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                HStack {
                                    Text("Points: \(items.points)")
                                        .font(.subheadline)
                                        .fontWeight(.light)
                                    Spacer()
                                    
                                    if items.isVerified {
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundStyle(Color.blueberryColor)
                                    }
                                }
                            }
                            .foregroundStyle(Color.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(
                                Color.gray
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            )
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 10)
            }
            .scrollIndicators(.hidden)
        }
    }
    
    // MARK: Learning Material
    var mappingArray: some View {
        ScrollView(.vertical) {
            ForEach(VM.mapingArray, id: \.self) { items in
                Text(items)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
            }
        }
        .scrollIndicators(.hidden)
    }
        
    var filteredArray: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(VM.filteredArrays) { items in
                    VStack(alignment: .leading ,spacing: 8){
                        Text(items.name)
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        HStack {
                            Text("Points: \(items.points)")
                                .font(.subheadline)
                                .fontWeight(.light)
                            Spacer()
                            
                            Image(systemName: items.isVerified ? "checkmark.seal.fill" : "")
                                .foregroundStyle(Color.blueberryColor)
                        }
                    }
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(
                        Color.gray
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                    .padding(.horizontal, 10)
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SortFilterAndMapBootcamp()
}


// small summary
/*
 Sort, Filter and Map DataArrays
 Operasi data arrays merupakan sebuah teknik untuk sorting filtering and mapping data array, dnegan tujuan untuk memberikan sebuah opsi kepada developer untuk manipulate based on user inginkan.
     Sorting
     1. Melakukan sorting berdasarkan user yang diinginkan baik Ascending atau Descending. A ke Z atau Z ke A
     
     Filter data
     1. User bisa memfilter data berdasarkan nama tertentu, Ex: menampilkan content Premuim atau Free
     
     Map
     1. Melakukan pengubahan data kedalam bentuk bentuk lainnya, Ex: Int ke Double
 
 
 
 */
