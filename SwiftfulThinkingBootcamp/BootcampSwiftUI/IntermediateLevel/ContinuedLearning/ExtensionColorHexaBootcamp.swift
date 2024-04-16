//
//  ExtensionColorHexaBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 16/04/24.
//

import SwiftUI

struct ExtensionColorHexaBootcamp: View {
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color(hex: "FFD700"))
        }
    }
}

#Preview {
    ExtensionColorHexaBootcamp()
}

extension Color {
    
    static var primaryColors: Color {
        return Color(hex: "53B175")
    }
        
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
            case 3: // RGB(12 -bit)
                (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
            case 6: // RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            case 8: // ARGB (32-bit)
                (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
            default:
                (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
