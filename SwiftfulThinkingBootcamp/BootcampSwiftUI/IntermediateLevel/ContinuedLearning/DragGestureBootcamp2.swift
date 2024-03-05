//
//  DragGestureBootcamp2.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 02/03/24.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    @State var startingPointOffsetY: CGFloat = UIScreen.main.bounds.height * 0.859
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingDragOffsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            Text("\(currentDragOffsetY)")
            
            SignUpView
                .offset(y: startingPointOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingDragOffsetY)

                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                if currentDragOffsetY <= -150 {
                                    endingDragOffsetY = -startingPointOffsetY
                                    
                                }else if currentDragOffsetY != 0 && currentDragOffsetY >= 175 {
                                    endingDragOffsetY = 0
                                }
                                    currentDragOffsetY = 0
                                
                            }
                        }
                )
                
            
        }
        .ignoresSafeArea( edges: .bottom)

    }
}

#Preview {
    DragGestureBootcamp2()
}

extension DragGestureBootcamp2 {
    private var SignUpView: some View {
        VStack(spacing: 20) {
            VStack {
                Image(systemName: "chevron.up")
                Text("Swipe Up")
                    .font(.footnote)
            }
            .padding(.top)
            
            Spacer()
            
            Image(systemName: "flame.fill")
                .resizable()
                .frame(width: 150, height: 200)
            
            
            Text("This is penggunaan daripada drag gesture, digunakan untuk membuat popup sign up, menggunakan framework Swift UI dan bahasa Swift Lang")
                .font(.subheadline)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Sign Up") {
                // actions
            }
            .foregroundStyle(Color.white)
            .fontWeight(.semibold)
            .frame(width: 170, height: 45)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))

            Button("Sign In") {
                // actions
            }
            .foregroundStyle(Color.white)
            .fontWeight(.semibold)
            .frame(width: 170, height: 45)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25))

    }
}
