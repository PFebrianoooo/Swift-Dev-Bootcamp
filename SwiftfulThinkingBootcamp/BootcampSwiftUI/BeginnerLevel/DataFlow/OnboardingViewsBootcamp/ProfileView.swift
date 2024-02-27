//
//  ProfileView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/02/24.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("your current name is \(currentUserName ?? "no name" )" )
                .font(.title)
            Text("your age right now is \(currentUserAge ?? 0) years old" )
                .font(.headline)
            Text("your gender is \(currentUserGender ?? "Unknown")")
                .font(.headline)
            
            Button("Sign Out") {
                signOutButton()
            }
            .foregroundStyle(Color.white)
            .buttonStyle(.borderedProminent)
               
        }
        .foregroundStyle(.purple)
        .padding(20)
        .background(
            Color.white
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 20)
        
    }
    
    func signOutButton() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
