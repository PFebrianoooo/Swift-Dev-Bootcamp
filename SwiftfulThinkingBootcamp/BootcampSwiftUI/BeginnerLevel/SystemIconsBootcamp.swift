//
//  SystemIconsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/11/23.
//

import SwiftUI

struct SystemIconsBootcamp: View {
    var body: some View {
//     how to use system icons
        Image(systemName: "heart")
//            .font(.title)
//            .font(.system(size: 408))
            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .scaledToFit()
            .scaledToFill()
            
            .frame(width: 300, height: 300)
            .foregroundColor(Color("ThemeColors"))
//            .clipped()
    }
}

struct SystemIconsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SystemIconsBootcamp()
    }
}


// My Summary
// how to use system icons, multicolorIcons and SF symbols
/*
 Systemsymbols
 Image(systemName: "string")
 
 Modifiernya.
 .font() merubah sesuai media Queries systems
 .font(.system(size: CGfloat)) merubah sesuai dengan yang dimau kita
 .foregroundColor() merubah warna icons/systemsymbols
 .resizeable() mereset ukuran sf symbols sesuai dg frame
 .frame() ukuran/batasan bagi es symbols yang suadah di resizeable()
 .aspectRatio() merupakan ukuran si gambar yang disesuaikan dg frame apakah rasionya .fill / fit
        .fill artinya object gambar memenuhi sampai keluar frame memaksimalkan ketinggian/height
        .fit artinya object gambar memenuhi tapi tidak keluar frame memaksimalkan width
        shortcutnya
            .scaledTofit()
            .scaledToFill()
 .clipped() memotong object gambar yang keluar dari frame
 
 cara membuka liblary atau resources yang disediakan oleh apple cms+shift+L
 */
