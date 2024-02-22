//
//  formBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 18/12/23.
//

import SwiftUI

struct formBootcamp: View {
    @State private var darkTheme: Bool = false
    @State private var notification: String = "Enable"
    
    @State private var dataNotification: [String] = [
        "Enable", "Ringing", "Disable"
    ]
    var body: some View {
        NavigationStack {
            Form {
                Section("Display") {
                    Toggle("dark theme".capitalized, isOn: $darkTheme)
                    Picker("Notification".capitalized, selection: $notification) {
                        ForEach(dataNotification, id: \.self) { items in
                            Text(items)
                                .tag(items)
                        }
                }
                    .pickerStyle(.navigationLink)
                }
                
            }
            .navigationTitle("Settings")
        }
    }
}

struct formBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        formBootcamp()
    }
}
// form Bootcamp
// small summary
/*
 form merupakan memberikan header daripada komponent dibawahnya, diamana konten atau komponent dibawahnya bisa berupa picker, toggle dan lain sebagainya yang berkaitan dengan setting.
 form merupakan container view dimana kita mengrupkan beberapa kontrol dalam aplikasi
 */
