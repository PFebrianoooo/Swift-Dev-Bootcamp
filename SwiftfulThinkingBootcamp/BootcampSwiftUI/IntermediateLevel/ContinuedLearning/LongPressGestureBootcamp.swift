//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/02/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State private var isCompleted: Bool = false
    @State private var isFinish: Bool = false
    var body: some View {
//        firstMaterial
        
        
        realWorldExample
    }
}

#Preview {
    LongPressGestureBootcamp()
}


/*
 Long Press Gesture
 
 Long Press Gesture atau .onLongPressGesture() merupakan modifier seperti on tap gesture. Tetapi pada Long Press Gesture kita bisa ngeset waktu atau durasi yang digunakan untuk menjalankan atau execute code.
 
 */

extension LongPressGestureBootcamp {
    private var firstMaterial: some View {
        Text(isCompleted ? "COMPLETED" : "INCOMPLETED")
            .frame(width: 175,height: 45)
            .foregroundStyle(Color.white)
            .font(.headline)
            .background(isCompleted ? Color.green : Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .onTapGesture {
//                withAnimation(.spring().speed(0.75)) {
//                    isCompleted.toggle()
//                }
//            }
            .onLongPressGesture(
                minimumDuration: 3.0) {
                withAnimation(.spring().delay(0.75)) {
                    isCompleted.toggle()
                }
            }
    }
    
    private var realWorldExample: some View {
        VStack {
            Rectangle()
                .fill(isFinish ? Color.green : Color.blue)
                .frame(maxWidth: isCompleted ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
                
            HStack {
                Text("Click Here")
                    .padding(.vertical, 7)
                    .frame(width: 100)
                    .background(.yellow)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50) {
                            // at min durations
                            withAnimation(.easeInOut) {
                                isFinish = true
                            }
                        } onPressingChanged: { isPressing in
                            // start on press -> min duration
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isCompleted = true
                                }
                            }else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    if !isFinish {
                                        withAnimation(.easeInOut) {
                                            isCompleted = false
                                        }
                                    }
                                }
                            }
                        }

                Text("Reset")
                    .padding(.vertical, 7)
                    .frame(width: 100)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .background(Color.yellow)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            isCompleted = false
                            isFinish = false
                        }
                    }
            }
        }
    }
}
