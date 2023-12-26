//
//  MarkupAndDocumentationBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 20/12/23.
//

import SwiftUI

struct MarkupAndDocumentationBootcamp: View {
    
    // MARK: ATTRIBUUTES
    @State var dataItems: [String] = [
    "Apples", "Oranges", "Bananas"
    ]
    
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    // Putra - working copy -> thing to do
    /*
    1. fix title
    2. fix data items
    3. fix color on list and make a new modifier
    */
    
    // Juanidy - working on -> things to do
    /*
     1. fix bugs
     2. fix another view
     */
    
    var body: some View {
        NavigationStack { // START: Nav
            ZStack {
                // background layer
                Color.secondary
                    .ignoresSafeArea()
                
                
                // foreground layer
                foregoundLayer
            }
            
            
            
            // navigation bar items
            .navigationTitle("Documentation")
            .toolbar { // Toolbar: Start
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        actionButton(showalert: showAlert)
                    } label: {
                        Text("Alert")
                            .fontWeight(.semibold)
                            .tint(Color.green)
                    }
                    
                }
            } // End: Toolbar
            .alert(titleAlert, isPresented: $showAlert) {
                Button("Confirm") {}
                Button("Delete", role: .destructive) {}
            } message: {
                messageAlert(text: "this is a place to give some message to alert")
            }
            
        } // END: Nav
    }
    
    // MARK: EXTRACTING VIEW
    /// foreground layer is usefor presented layer foregound in home view. and this is an example of summary
    private var foregoundLayer : some View {
        ScrollView(.vertical, showsIndicators: false) { // Start: scrollView
            ForEach(dataItems, id: \.self) { items in
                Text(items)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
            }
        } // End: Scrolly
    }
    
    
    // MARK: FUNCTIONS STARTS
    private var titleAlert: String {
        return  "This is alert title"
    }
    
    ///  function for returning a text, use for message allert
    /// - Parameter text: String Protocol
    /// - Returns: returning Text, confronts to View
    private func messageAlert(text: String) -> Text {
        return Text(text)
    }
    
    /// this is argument function for button for using show alert to toggle an state variable argument
    /// and this argment may contain a multiple comment documentation like this
    ///  ***
    ///     actionButton(showalert: showAlerts)  = showAlerts.toggle() = false/true
    ///  ***
    ///  - Warning: dont use this function without state variable
    /// - Parameter showalert: parameter state variable. this variable can be another state variable
    private func actionButton(@State showalert: Bool) {
        showalert.toggle()
    }
}

// MARK: PREVIEW
struct MarkupAndDocumentationBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MarkupAndDocumentationBootcamp()
    }
}

// markup and documentations
// small summary
/*
 basic documentation digunakan untuk membuat faham programmer lain dalam memebaca sebuah kode yang dibuat. jadi fungsi dari markup dan documentation adalah memebrikan gambaran kepada programmer lain untuk bisa memahami code yang dibuat. fungsi ini untuk apa, fungsi ini untuk apa dan lain sebagainya.
 
 fold shortcut command + option arrow ( left for close and right for open )
 */
