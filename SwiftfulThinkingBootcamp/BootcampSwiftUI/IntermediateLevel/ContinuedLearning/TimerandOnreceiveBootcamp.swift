//
//  TimerandOnreceiveBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 24/03/24.
//

import SwiftUI

struct TimerandOnreceiveBootcamp: View {
    // jadi kalo every itu adalah detik semaking kecil semakin berulangnya cepet
    let timer = Timer.publish(every: 5 , on: .main, in: .common).autoconnect()
    
    // current time
    /*
    @State var currentDate = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
     */
    
    // countdown
    /*
    @State var countdown: Int = 10
    @State var finishedText: String? = nil
     
    func countdownTime() {
     if countdown <= 1 {
         finishedText = "Happy new year 2024"
     }else {
         countdown -= 1
     }
     */
    
    // countdown based date
    /*
    @State var timeRemaining: String = ""
    // ngeset waktu yang diperlukan untuk countdown
    let futureDate: Date = Calendar.current.date(byAdding: Calendar.Component.minute, value: 1, to: Date()) ?? Date()
    
    func updateRemaining() {
        // negbuat component yang digunakan untuk membuat waktu remaining atau tersisa dari future time dan current date
        let remaining = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        
        timeRemaining = "\(hour) : \(minute) : \(second)"
    }
    */
    
    // animate counter
    /*
    @State var count: Int = 0
    func animateLoading() {
        withAnimation(.easeInOut(duration: 0.5)) {
            if count == 3 {
                count = 1
            }else {
                count += 1
            }
        }
    }
     */
    
    // automatic page tabView autoscroll
    @State var pageSelection: Int = 1
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.accentColor, Color.blue, Color.black], center: .topTrailing, startRadius: 5, endRadius: 600)
                .ignoresSafeArea()
            
            /*
            Text(timeRemaining)
                .font(.system(size: 40, weight: .semibold, design: .rounded))
                .foregroundStyle(Color.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
             */
            
            /*
            HStack {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .foregroundStyle(.white)
            .padding(.horizontal, 150)
            */
            
            TabView(selection: $pageSelection) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.grapeColor)
                    .tag(1)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.yellow)
                    .tag(2)

                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blueberryColor)
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always ))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .onReceive(timer, perform: { _ in
                withAnimation(.linear) {
                    if pageSelection == 3 {
                        pageSelection = 1
                    } else {
                        pageSelection += 1
                    }
                }
            })
            
        }
        .onReceive(timer, perform: { _ in
//            currentDate = valuePublish
                        
//                updateRemaining()
            
//            animateLoading()
            
        })
    }
}

#Preview {
    TimerandOnreceiveBootcamp()
}

// small summary
/*
 timer and on receive bootcamp
 timer and on receive bootcamp merupakan sebuah modifier yang digunakan untuk membuat custom animations dimana animasi tersebut digunakan untuk mempercantik tampilan ui atau Views
 
 yang bisa dilakukan dengan timer
 1. countdown timer
 2. custom animations
 3. membuat jam
 */
