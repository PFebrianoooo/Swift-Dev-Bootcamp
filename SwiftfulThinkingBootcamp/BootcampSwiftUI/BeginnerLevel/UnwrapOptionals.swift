//
//  UnwrapOptionals.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 23/12/23.
//

import SwiftUI

struct UnwrapOptionals: View {
    @Environment (\.dismiss) var dismiss
    @State private var isLoading:  Bool = false
    @State private var title: String? = nil
    @State private var userId: String? = " Putra Pebriano"
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text("This is bootcamp safe code")
                    .font(.title)
                    .fontWeight(.semibold)
                
                // nil coalescing
//                Text(title ?? "")
                
//                 if let statements
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
                
                if isLoading {
                    ProgressView()
                }
                
                // force unwrap, DO NOT DO THIS
//                Text(title!)
                                    
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    
                }
            }
            .onAppear {
                loadData2(title: "current user id")
            }
        }
    }
    
    func loadData(title : String) {
        if let userId {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.title = title.capitalized + userId
                isLoading = false
            }
        }
    }
    func loadData2(title: String) {
        guard let userId else {
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.title = title.capitalized + userId
            isLoading = false
        }
        
    }
}

struct UnwrapOptionals_Previews: PreviewProvider {
    static var previews: some View {
        UnwrapOptionals()
    }
}


// small summary
// how to safely unwrap an optionals
/*
 3 cara untuk unwrap an optionals
    1. nil coalescing
    2. if let statements
    3. guard let statements
 
 fungsi dari unwrapping optionals adalah untuk membuat aolikasi kita tidak crash saat memiliki items yang bersifat opsional, misalkan link. apabila link tersebut bisa, maka aplikasi tidak crash, tapi apabila link tersebut tidak berlaku lagi. maka aplikasi kita bisa crash.
 
 guard let digunakan pada fungsi dan if let bisa digunakan langsung di view atau scrren atau UI
 */
