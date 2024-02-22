//
//  PickerBootcap.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/12/23.
//

import SwiftUI

struct PickerBootcap: View {
    
    @State private var pickOptions: String = "Enable"
    
    
    // picker options
    var options: [String] = [
        "Enable", "Disable", "Ringing"
    ]
    
    
    
    // this come from UI Kit
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.gray
        
        
        let attributes: [NSAttributedString.Key : Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    var body: some View {
//        VStack {
//            HStack {
//                Text("age: \(pickOptions)")
//            }
//
//
//            Picker(selection: $pickOptions) {
//                ForEach(18..<100) { items in
//                    Text("\(items)").tag(items)
//                }
//            } label: {
//                Image(systemName: "house")
//            }
//            .tint(Color.black)
////            .pickerStyle(InlinePickerStyle())
//            .pickerStyle(WheelPickerStyle())
//
//        }
        
        
//        NavigationStack {
//            VStack {
//                VStack {
//                    Text(pickOptions.description)
//                }
//
//
//                HStack {
//                    Text("Notification Options")
//                        .font(.headline)
//                        .fontWeight(.semibold)
//
//                    Spacer()
//
//                    Picker(selection: $pickOptions) {
//                        ForEach(options, id: \.self) { items in
//                            Text(items).tag(items)
//                        }
//                    } label: {
//                        Text("Pick Me")
//                    }
//                    .tint(.black)
//                }
//
//                Spacer()
//            }
//            .navigationTitle("Setings")
//        }
        
        Picker(selection: $pickOptions) {
            ForEach(options, id: \.self) { items in
                Text(items).tag(items)
            }
        } label: {
            Text("Picker")
        }
        .pickerStyle(SegmentedPickerStyle())
        
    }
}

struct InformationProfile: View {
    @State var userInput1: String = ""
    @State var userInput2: String = ""
    @State var userInput3: String = ""
    @State var userPick: String = "@gmail.com"
    
    var body: some View {
        VStack {
            Text("Edit shipping info".capitalized)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            VStack {
                initializer(UserInput: $userInput1 , imageName: "person.fill")
                initializer(UserInput: $userInput2, imageName: "location.fill")
                initializer2(imageName: "envelope.fill", UserInput: $userInput3, PickEmail: $userPick)
                
            }
        }
    }
}


struct initializer: View {
    @Binding var UserInput: String
    var imageName: String
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 23, height: 23)
                
            TextField("", text: $UserInput)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2.5)
                )
                .cornerRadius(10)
            
            
        }
        .padding(.horizontal)
    }
}

struct initializer2: View {
    var imageName: String
    @Binding var UserInput: String
    @Binding var PickEmail: String
    @State var pickOptionsUser: [String] = [
    "@gmail.com", "@yahoo.com", "@bitbucket.com"
    ]
    
    
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 24, height: 23)
                
            TextField("", text: $UserInput)
                .padding(.vertical, 5)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2.5)
                )
                .cornerRadius(10)
            
            Picker(selection: $PickEmail) {
                ForEach(pickOptionsUser, id: \.self) { items in
                    Text(items)
                        .tag(items)
                }
            } label: {
                Text("Pick Mail Options")
            }
            .pickerStyle(MenuPickerStyle())
            .tint(Color.black)
            .background(Color.blue.opacity(0.2))
            .cornerRadius(10)
            
        }
        .padding(.horizontal)
    }
}



struct PickerBootcap_Previews: PreviewProvider {
    static var previews: some View {
        PickerBootcap()
        InformationProfile()
    }
}


// small Summary
// PIcker Bootcamp
/*
 picker adalah sebuah komponen dimana user dapat memilih komponen dimana user mengalami situasi dimana harus memilih different options.
 
 macam macam picker
 1. Picker(selection: <#T##Binding<Hashable>#>, content: <#T##() -> View#>, label: <#T##() -> View#>)
 
 
 // penjelasan modifier
 default picker style adalah menuPickerStyle() / inlinePickerMenu()
 label berguna saat stylepicker menuPickerStyle()
 .navogationtitle meruapakan picker style yang dapat digunakan berbarengan dengan navigationstack
 
 
 */

