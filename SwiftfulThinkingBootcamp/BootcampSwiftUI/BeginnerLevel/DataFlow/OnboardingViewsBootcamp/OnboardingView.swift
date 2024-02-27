//
//  OnboardingView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/02/24.
//

import SwiftUI

struct OnboardingView: View {
    // onboarding state :
    /*
     0 - welcome screen
     1 - add name
     2 - add age
     3 - add gender
     */
    
    // onboarding inputs
    @State var onboardingState: Int = 0
    @State var name: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    
    // transitions
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // for alert
    @State var alertInfo: Bool = false
    
    
    // for app storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // content
            ZStack {
                switch onboardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    genderSection
                        .transition(transition)
                default:
                    Text("User Signed in")
                }
            }
            
            // button
            VStack {
                Spacer()
                bottomButton
                
            }
            .padding(20)
        }
        .alert("Please check again", isPresented: $alertInfo) {
            Button("Ok", role: .cancel) {
                onboardingState = 1
            }
        } message: {
          Text("Please check again your name !, at least 3 charactered long in that field name")
        }
    }
    

}

#Preview {
    OnboardingView()
        .background {
            Color.grapeColor
        }
}


// MARK: Components
extension OnboardingView {
    private var bottomButton: some View {
        // cara yang panjang
//        if onboardingState == 0 {
//            Text("Sign Up")
//                .font(.headline)
//                .frame(height: 45)
//                .frame(maxWidth: .infinity)
//                .background(Color.white)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .onTapGesture {
//                    handleNextButtonPressed()
//                }
//
//        }else if onboardingState <= 2 {
//            Text("Next")
//                .font(.headline)
//                .frame(height: 45)
//                .frame(maxWidth: .infinity)
//                .background(Color.white)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .onTapGesture {
//                    handleNextButtonPressed()
//                }
//
//        } else {
//            Text("Finish")
//                .font(.headline)
//                .frame(height: 45)
//                .frame(maxWidth: .infinity)
//                .background(Color.white)
//                .clipShape(RoundedRectangle(cornerRadius: 10))
//                .onTapGesture {
//                    handleNextButtonPressed()
//                }
//
//        }
        
        
        // short handed version dengan ternary operator
        Text(
            onboardingState == 0 ? "Sign Up" :
            onboardingState == 3 ? "Finish" :
            "Next"
        )
            .font(.headline)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .animation(nil, value: onboardingState)
            .onTapGesture {
                checkOnboardingContents()
            }

   }
    private var welcomeSection: some View {
        VStack(spacing: 20) {
            // you can place image logo or something in here
            // this is just example
            Spacer()
            Image("Image-Profile")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("Find your match.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .foregroundStyle(.white)
                        .frame(height: 3)
                        .offset(y: 2)
                }
            
            Text("This is number #1 application to looking for dating, and implemented all everything that i know when learning swift ui")
                .font(.body)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .foregroundStyle(.white)
                        .frame(height: 3)
                        .offset(y: 2)
                }
            
            TextField("Your name here....", text: $name)
                .font(.headline)
                .frame(height: 45)
                .padding(.horizontal)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .foregroundStyle(.white)
                        .frame(height: 3)
                        .offset(y: 2)
                }
            
            Text(String(format: "%.0f", age))
                .foregroundStyle(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Slider(value: $age, in: 18...100, step: 1)
                .tint(Color.white)
            Spacer()
            Spacer()
        }
        .padding(30)

    }
    private var genderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .foregroundStyle(.white)
                        .frame(height: 3)
                        .offset(y: 2)
                }
            
            

            Picker(selection: $gender, content: {
                Text("Male")
                    .tag("Male")
                
                Text("Female")
                    .tag("Female")
                
                Text("Non-Binary")
                    .tag("Non-Binary")
                                
            }, label: {
                Text("HEllo there")
                    .font(.largeTitle)
            })
            .tint(Color.purple)
            .frame(height: 45)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .pickerStyle(.menu)

            Spacer()
            Spacer()
        }
        .padding(30)

    }
}

// MARK : Functions
extension OnboardingView {
    
    func handleNextButtonPressed() {
        // user sugned in
        if onboardingState == 3 {
            signIn()
            onboardingState += 1
        }else {
            withAnimation(.spring()) {
                onboardingState += 1
            }
        }
        
    }
    
    func checkOnboardingContents() {
        if onboardingState == 1 && name.count <= 3 {
            alertInfo.toggle()
        }else {
            handleNextButtonPressed()
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = Int(age)
        currentUserGender = gender
        withAnimation(.spring()) {
            currentUserSignedIn = true
        }
    }
}
