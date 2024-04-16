//
//  AlignmentGuidesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 15/04/24.
//

import SwiftUI

struct AlignmentGuidesBootcamp: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, World")
                .background(Color.blue)
                .alignmentGuide(.leading) { dimension in
                    /*
                     disarankan menggunakan alignment guide daripada menggunakan geometry reader untuk mendapatkan actual size dari si objek text. Gunakan alignment guide untuk hal-hal kecil dan gunakan geometry reader untuk hal-hal besar yang menyangkut banyak objek serta banyak element
                     */
                    return dimension.width * 0.5
                }
            
            
            Text("This is some other text")
                .background(Color.pink)
        }
        .background(Color.orange)
    }
}

struct AlignmentGuidesChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            row(title: "row 1", showIcon: false)
            row(title: "row 1", showIcon: true)
            row(title: "row 1", showIcon: false)
            
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(40)
    }
    
    private func row(title: String, showIcon: Bool) -> some View {
        HStack(spacing: 10) {
            if showIcon {
                Image(systemName: "info.circle")
                    .resizable()
                    .bold()
                    .frame(width: 30, height: 30)
//                    .opacity(showIcon ? 1.0 : 0) // bisa
            }
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .alignmentGuide(.leading) { dimensions in
            return showIcon ? 40 : 0
        }
    }
}

#Preview {
//        AlignmentGuidesBootcamp()
        AlignmentGuidesChildView()
}


// small summary
/*
 Allignment Guides Bootcamp
 Alignment Guides merupakan perataan yang ada pada framework Swift UI, dimana perataana atau alignment menyangkut .leading, .trailing, .center dan lain sebagainya
 
 Jika menggunakan padding atau offfset biasa, tidak mendapatkan background dari parent vstack tetapi apabila kita menggunakan alignmnent guide, akan mendapatkan background dari vstack. Bedanya disitu
 
 vertical containers VStack membutuhkan horizontal alignments dan horizontal alignments membutuhkan vertical alignment, sedangkan zstack membutuhkan horizontal dan vertical alignments
 */

