//
//  SwipeActionsForListBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/12/23.
//

import SwiftUI

struct SwipeActionsForListBootcamp: View {
    @State private var listFruits: [String] = ["Watermelon", "banana", "mangosteen", "avocado"]
    var body: some View {
        VStack {
            List {
                ForEach(listFruits, id: \.self) {
                    Text($0.capitalized)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                            Button("Delete") {
                                // actions
                            }
                            .tint(Color.yellow)
                            Button("Save") {
                                // actions
                            }
                            .tint(.green)
                            Button("Archive") {
                                // actions
                            }
                            .tint(Color.accentColor)
                        }
                }
                .onDelete(perform: deleteItem)
            }
        }
    }
    
    func deleteItem(indexset: IndexSet) {
        listFruits.remove(atOffsets: indexset)
    }
}

struct SwipeActionsForListBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsForListBootcamp()
            
    }
}

// smalll summary
// list Swipe Actions
/*
 swipe actions merupakan modifier baru untuk menswipe list. dan mofier baru ini berkaitan dengan list. sebelumnya cuma punya delete sekarang lebih banyak lagi modifier baru untuk list modifier ini.
 
 initialisations
 1.  .swipeActions(edge: horizontalEdge, allowsFullSwipe: Boolean, content: content)
 */
