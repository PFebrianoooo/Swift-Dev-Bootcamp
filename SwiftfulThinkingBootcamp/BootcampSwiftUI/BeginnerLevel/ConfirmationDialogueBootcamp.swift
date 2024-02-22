//
//  ActionSheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/12/23.
//

import SwiftUI

struct ActionSheetBootcamp: View {
    @State var confDialogue: Bool = false
    
    var body: some View {
        VStack {
            Button("Press Me") {
                confDialogue.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            // ios 16 or higher
            .confirmationDialog("This is title", isPresented: $confDialogue, titleVisibility: .visible) {
                Button("Delete", role: .destructive) {
                    
                }
                Button("Share"){
                    
                }
            } message: {
                Text("all in here this is a message in botton of the title, and will appear when we click the button")
            }
            
            
            // ios 16 lower
//            .actionSheet(isPresented: $confDialogue) {
//                ActionSheet(title: Text("this is title"),
//                            message: Text("this is message"),
//                            buttons: [
//                                .default(Text("default"))
//                            ]
//                )
//            }

            
            
        }
    }
}

struct instagramFeed: View {
    @State private var showConfDialog: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 50, height: 50)
                VStack {
                    Text("P.Febrianoo_")
                        .fontWeight(.semibold)
                        
                    Text("Location or songs")
                        .font(.caption)
                        .fontWeight(.light)
                }
                
                Spacer()
                
                Button {
                    showConfDialog.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            
            Image("Image-2")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
        }
        .confirmationDialog(title(), isPresented: $showConfDialog, titleVisibility: .visible) {
            Button("Share") {
             // put the logic ation in here
            }
            Button("Report", role: .destructive) {
            // put the logic button in here
            }
        } message: {
            message()
        }
    }
    
    
    
    
    // functions for all
    func message() -> Text {
        return Text("are you sure want to delete this options".capitalized)
    }
    
    func title() -> Text {
        return Text("Please ensure you have a good choice".capitalized)
    }
}

struct ActionSheetBootcamp_Previews: PreviewProvider {
    static var previews: some View {
//        ActionSheetBootcamp()
        instagramFeed()
    }
}

// confirmation dialogue
// smal summary
/*
 confirmation dialogue sebetulnya sama seperti alert. dimana alet popup kelayar sedangkan actionsheet popup dari bottom of the screen. dimana pada alert kita hanya dibatasi oleh 2 button, tetapi pada actionsheet bisa menggunakan lebih dari 2 button didalamnya
 
 
 // example code
 .confirmationDialog(titleKey: LocalizedStringKey, isPresented: Binding<Bool>) { code }
 
 
 // deprecated in ios 16 or lower
 .actionSheet(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> ActionSheet#>)
 */
