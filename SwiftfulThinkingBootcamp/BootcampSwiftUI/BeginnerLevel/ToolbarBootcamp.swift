//
//  ToolbarBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/12/23.
//

import SwiftUI

struct ToolbarBootcamp: View {
    @State private var paths: [String] = []
    var body: some View {
        NavigationStack(path: $paths) {
            ZStack {
                // background layer
                Color.indigo.ignoresSafeArea()
                
                // foreground layer
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(0..<1000) { x in
                            Text("Hello Putra pebriano Nurba   \(x)".capitalized)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.title3)
                        }
                    }
                }
            }
            .navigationTitle("Bootcamp swiftUI".capitalized)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.white)
                }
                ToolbarItem(
                    placement:
//                            .automatic
//                        .bottomBar
//                        .cancellationAction
//                        .confirmationAction
//                        .destructiveAction
//                        .keyboard // dia adanya pada saatu buka keyboard di run on simulator
//                        .navigation
//                        .navigationBarLeading
//                        .navigationBarTrailing
//                        .primaryAction
                        .principal
//                        .secondaryAction
//                        .status
                
                ) {
                    // untuk logo
                    Text("HEllo teheran iran".capitalized)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .fontWidth(.compressed)
                    
                    // untuk button
//                    Image(systemName: "gear")
                }
            }
            
            // modifier hiding toolbar
//            .toolbar(.hidden, for: .navigationBar)
//            .toolbar(.hidden, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleMenu {
                Button("Hello screen 1") {
                    paths.append("screen - 1")
                }
                Button("Hello screen 2") {
                    paths.append("screen - 2")
                }
                
            }
            .navigationDestination(for: String.self) { destinations in
                Text("new screen \(destinations)")
            }
        }
    }
}

struct ToolbarBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarBootcamp()
    }
}

// small summary
// toolbar
/*
 toolbar merupakan cara atau versi terbaru untuk mengatur leading and trailing button pada navigation stack. seperti navigation bar ites leading
 
 keuntungan
 1. lebih suppoert manu devices
 */
