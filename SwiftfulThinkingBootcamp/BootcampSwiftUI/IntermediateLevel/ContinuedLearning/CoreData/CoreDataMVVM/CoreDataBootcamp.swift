//
//  CoreDataBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 07/03/24.
//

import SwiftUI
import CoreData

// MVVM Architecture
/*
 View -> UI (SwiftUI)
 Model -> Data Point (CoreData)
 ViewModel -> manaage the data for UI (Class)
 */

class CoreDataViewModel: ObservableObject {
    @Published var saveEntity: [FruitEntity] = []
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { desciption, error in
            if let error = error {
                print("Error Load Core Data : \(error)")
            }else {
                print("Success Load Core Data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
            try saveEntity = container.viewContext.fetch(request)
        }catch let error {
            print("Error Fetcing Core Data : \(error)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        }catch let error {
            print("Error Message : \(error)")
        }
    }
    
    func deleteItems(offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let getIndex = saveEntity[index]
        container.viewContext.delete(getIndex)
        saveData()
    }
    
    func updateData(entity: FetchedResults<FruitEntity>.Element, inputName: String) {
        guard let currentName = entity.name else { return }
        let newName = currentName + "" + inputName
        entity.name = newName
        saveData()
    }
}

struct CoreDataBootcamp: View {
    @StateObject var VM: CoreDataViewModel = CoreDataViewModel()
    @State var userInputtedText: String = ""
    
    var body: some View {
        NavigationView {
                VStack {
                    // Inputted text
                    HStack {
                        TextField("Add here".capitalized, text: $userInputtedText)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.7)
                            )
                         
                        
                        Button {
                            guard !userInputtedText.isEmpty else { return }
                            VM.addFruit(text: userInputtedText)
                            userInputtedText = ""
                        } label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .imageScale(.small)
                                .padding(.all, 7)
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    
                    // displayed and delete and update items
                    List {
                        ForEach(VM.saveEntity) { entity in
                            NavigationLink {
                                UpdateViewCoreDataBootcamp(VM: VM, fruits: entity)
                            } label: {
                                if let text = entity.name {
                                    Text(text)
                                        .font(.headline)
                                }
                            }
                        }
                        .onDelete(perform: VM.deleteItems)
                    }
                    .listStyle(.plain)
                    .padding(.top)
                }
            .navigationTitle("CoreData Implement")
        }
    }
}

#Preview {
    CoreDataBootcamp()
}

// core data tinggal update function doang.
