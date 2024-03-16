//
//  UpdateViewCoreDataBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 08/03/24.
//

import SwiftUI

struct UpdateViewCoreDataBootcamp: View {
    @ObservedObject var VM: CoreDataViewModel
    @State var updateItems: String = ""
    @Environment(\.dismiss) var dismiss
    
    let fruits: FetchedResults<FruitEntity>.Element
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text("Tambahkan items dibelakangnya !")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                TextField("Add Here", text: $updateItems)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1.7)
                    )
                    .padding(.horizontal)

                
                Button {
                    VM.updateData(entity: fruits, inputName: updateItems)
                    updateItems = ""
                    dismiss()
                } label: {
                    Text("Update")
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(
                            Color.blue
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        )
                        .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Update Items")
    }
}

