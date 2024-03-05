//
//  HapticsAndVibrationsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 05/03/24.
//

import SwiftUI

class HapticVibrations {
    /*
     Apabila ingin memberikan gaya haptics yang berbeda beda, maka gunakan enum di setiap parameter inputnya.
     Tergantung dengan keinginan daripada programmer dan si tukang design
     */
    static let instance = HapticVibrations() // singleton Class
    
//    enum hapticType:
    
    func notifications(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsAndVibrationsBootcamp: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Haptic Notifications")
                .fontWeight(.semibold)
            
            Group {
                Button("Success") { HapticVibrations.instance.notifications(type: .success) }
                Button("Error") { HapticVibrations.instance.notifications(type: .error) }
                Button("Warning") { HapticVibrations.instance.notifications(type: .warning) }
            }
            .buttonStyle(.borderedProminent)
            Divider()
            
            Text("Type of the vibrations or the impact")
                .fontWeight(.semibold)
            
            Group {
                Button("Soft") { HapticVibrations.instance.impact(style: .soft) }
                Button("Rigid") { HapticVibrations.instance.impact(style: .rigid) }
                Button("Medium") { HapticVibrations.instance.impact(style: .medium) }
                Button("Light") { HapticVibrations.instance.impact(style: .light) }
                Button("Heavy") { HapticVibrations.instance.impact(style: .heavy) }
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    HapticsAndVibrationsBootcamp()
}

// smalll summary
/*
 Haptics And Vibration Bootcamp
 Haptics and vibration merupakan sebuah fitur yang ada pada ios app dimana pada haptics and vibrations berfungsi untuk memberikan efek kejut kepada user,
 
 Example Case:
 1. Ketika user click sesuatu pada eleement view, maka akan diberikan haptics atau getara.
 2. Ketika user mendapatkan sebuah notifikasi, user akan mendapatkan sebauh vibrations atau getaran
 
 HANYA BISA DIGUNAKAN DI REAL IPHONE, NOT SIMULATOR
 */
