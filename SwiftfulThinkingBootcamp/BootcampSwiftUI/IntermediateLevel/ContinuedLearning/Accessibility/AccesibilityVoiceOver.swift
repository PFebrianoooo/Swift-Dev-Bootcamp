//
//  AccesibilityVoiceOver.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 13/04/24.
//

import SwiftUI

struct AccesibilityVoiceOver: View {
    
    @State private var volumeIsOn: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    /*
                     both of this items is work, but for accessibility pusposes is not working, thats why we prefer used native component than custom component.
                     Because native, supporting accessibility purpose.
                     In other case, if necessary for using native component use them, but if haven't native component we abolutely used custom components. But for supporting   Accessibility voice over we need add modifier
                     
                     .accessibilityElement(children: .combine)
                     meaning combine, for combining all items in stack container
                     
                     */
                    Toggle("Volume", isOn: $volumeIsOn)
                    
                    HStack {
                        Text("Volume")
                        
                        Spacer()
                        
                        Text(volumeIsOn ? "TRUE" : "FALSE")
                            .accessibilityHidden(true)
                    }
                    .background(Color.black.opacity(0.0001))
                    .onTapGesture {
                        volumeIsOn.toggle()
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityAddTraits(.isButton)
                    .accessibilityValue(volumeIsOn ? "Is On" : "Is Off")
                    .accessibilityHint("Double tap to toggle settings.")
                    .accessibilityAction {
                        volumeIsOn.toggle()
                    }
                    
                } header: {
                    Text("Preferences")
                }
                
                
                Section {
                    Button("Favorites") {
                        
                    }
                    .accessibilityRemoveTraits(.isButton)
                    
                    Button {
                        
                    } label: {
                      Image(systemName: "heart.fill")
                    }
                    .accessibilityLabel("Favorites")
                    
                    
                    Text("Favorites")
                        .onTapGesture {
                            
                        }
                        .accessibilityAddTraits(.isButton)
                    
                } header: {
                    Text("applications")
                }
                
                VStack {
                    Text("Content".uppercased())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .accessibilityAddTraits(.isHeader)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 15) {
                            ForEach(1..<11) { x in
                                VStack {
                                    Image("Image-Profile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                    
                                    Text("Item \(x)")
                                    
                                }
                                .onTapGesture {
                                    
                                }
                                .accessibilityElement(children: .combine)
                                .accessibilityAddTraits(.isButton)
                                .accessibilityLabel("Item \(x), image of Putra Pebriano")
                                .accessibilityHint("Double tap to segue to another screen")
                                .accessibilityAction {
                                    
                                }
                                
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationTitle("Voice Over Bootcamp")
        }
    }
}

#Preview {
    AccesibilityVoiceOver()
}

// small summary
/*
 Accesibility Voice Over
 Voice over support ditunjukkan untuk user yang tidak bisa melihat layar, agar user yang tidak bisa melihat layar dapat menggunakan aplikasi seperti layaknya orang normal dengan bantuan voice over.
 
 
 Perbedaan native component pada iphone dan build manually
 Pada native component pada iphone, sudah support voice over by default. Jadi voide over sudah mengenali bahwa itu merupakan component toggle for example, jadi akan diberitahukan, ini toggle volume dan keadannya off.
 Hal tersebut sangat penting dan kita harus tahu bawa orang blind akan kesulitan mengenali apabila tidak tahu apa componentnya
 
 Modifier Baru dalam Voice over
 1. AccessibiltyElement(children: ) untuk menggabungkan element agar bisa disebut oleh voice over
 2. AccessibilityAddTraits(.isButton) untuk menentukan macam apakah element ini
 3. AccessibilityMint() untuk memberikan keterangan tambahan
 4. AccessibilityRemoveTraits(.isButton) untuk mengilangkan keterangan default native component agar bisa di customisasi
 */
