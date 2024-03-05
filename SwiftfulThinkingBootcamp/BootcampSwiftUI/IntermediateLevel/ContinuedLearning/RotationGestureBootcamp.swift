//
//  RotationGestureBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 29/02/24.
//

import SwiftUI

struct RotationGestureBootcamp: View {
    @State var angle: Angle = .degrees(0)
    @State var lastAngle: Angle = .degrees(0)
    @State var angleOn: Bool = false
    var body: some View {
        Text("Rotation Effect")
            .font(.headline)
            .foregroundStyle(Color.white)
            .padding(.vertical)
            .padding(.horizontal)
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .rotationEffect(angle /*+ lastAngle*/)
            .gesture(
                RotationGesture()
                    .onChanged { value in
                        angle = value
                    }
                    .onEnded { value in
                        // back to normal
                        withAnimation(.spring()) {
                            angle = .degrees(0)
                        }
                        
                        // untuk stay di akhir
//                        lastAngle += angle
//                        angle = .degrees(0)
                    }
            )
            
        
    }
}

#Preview {
    RotationGestureBootcamp()
}
