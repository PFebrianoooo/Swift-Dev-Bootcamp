//
//  ListBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 14/12/23.
//

import SwiftUI


struct NameFruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let likeOrNo: Bool
}


// My Own Imagination List
struct ListBootcamp: View {
    
    @State var fruitArray: [NameFruitModel] = [
        NameFruitModel(name: "Mango", likeOrNo: false),
        NameFruitModel(name: "Orange", likeOrNo: true),
        NameFruitModel(name: "Jack Fruit", likeOrNo: true),
    ]
    
    var body: some View {
    
        List {
            Section {
                ForEach(fruitArray) { items in
                    Text(items.name)
                }
            } header: {
                Text("fruits List")
            }
            // background
//            .listRowBackground(Color.pink)
//            .moveDisabled(false)
        }
        // formatting list
        .listStyle(GroupedListStyle()) // style atau gaya dari list
        
        
    }
}



// MATERIAL LIST OF IOS 16 OR NEWER
struct InstagramProfileModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let captions: String
    let isVerified: Bool
    
}

struct IOS16List: View {
    
    
    // default display
    @State var modelProfile: [InstagramProfileModel] = [
        InstagramProfileModel(name: "Putra Pebriano Nurba", captions: "Love Family", isVerified: true),
        InstagramProfileModel(name: "Muhammad Faji", captions: "Love Daddy", isVerified: false),
        InstagramProfileModel(name: "Muhammad Panji", captions: "Love All People", isVerified: true)
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                // list section starts
                List {
                    Section {
                        ForEach(modelProfile) { profile in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(profile.name)
                                        .font(.headline)
                                        .fontWidth(.compressed)
                                        .fontWeight(.semibold)
                                    
                                    Text(profile.captions)
                                        .font(.caption)
                                        .foregroundColor(.green)
                                }
                                Spacer()
                                
                                Image(systemName: profile.isVerified ? "checkmark.circle.fill" : "checkmark.circle")
                                    .resizable()
                                    .foregroundColor(profile.isVerified ? Color.blue : Color.red)
                                    .frame(width: 20, height: 20)
                            }
                        }
                        
                        // pantau disini
                        .onDelete(perform: deletePerform)
                        .onMove(perform: movePerform)
                        
                    } header: {
                        Text("This is My Small Family")
                    }
                }
                .listStyle(SidebarListStyle())
            // list sections ends
            
            // navigation tittle modifiers starts
            .navigationTitle("List Bootcamps")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // default systems
                    EditButton()
                        .buttonStyle(.borderedProminent)
                        
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addButton()
                    }
                    .buttonStyle(.borderedProminent)
                }
                }
            // navigation tittle modifiers starts
            }
        }
    }
    
    // functions
    // swkarusnya put in viewModel cause this is logic
    
    func deletePerform (currentIndex : IndexSet) {
        modelProfile.remove(atOffsets: currentIndex)
    }

    func movePerform(indices: IndexSet, newIndices: Int) {
            modelProfile.move(fromOffsets: indices, toOffset: newIndices)
    }
    
    func addButton() {
        modelProfile.append(InstagramProfileModel(name: "Epinn", captions: "Loving His Family", isVerified: true))
    }
    
}

struct ListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ListBootcamp()
        IOS16List()

    }
}


// list Bootcamps
// Small Summary
/*
 list adalah specialize Vstack dimana kita bisa memodifikasi daripada list tersebut, dengan beberapa operasi sperti CRUD (create read update delete).
 list secara default sudah bisa di scroll. so dengan scollview akan membuat mereka error
 
 apabila kita punya list dimana ingin menambkan kan header atau footer, maka gunakan section tunuk mengcover itu.
 
 shift + curly bracket, untuk mewrapp kedalam curly braces
 
 jadi kalo kita mau menggunakan list yang perform on delete and on move harus menggunakan dinamic array. gampangnya itu adalah dengan membuat add button terlebih dahulu baru kita tambahkan ke
 
 */

