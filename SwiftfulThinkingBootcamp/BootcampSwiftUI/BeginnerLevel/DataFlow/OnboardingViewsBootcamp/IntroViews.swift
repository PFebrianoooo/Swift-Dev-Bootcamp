//
//  IntroViews.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/02/24.
//

import SwiftUI

struct IntroViews: View {
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                gradient: Gradient(colors: [Color.grapeColor, Color.blueberryColor]),
                center: .topLeading,
                startRadius: 5,
                endRadius: 1200)
            .ignoresSafeArea()
            
            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }

        }
    }
}

#Preview {
    IntroViews()
}
