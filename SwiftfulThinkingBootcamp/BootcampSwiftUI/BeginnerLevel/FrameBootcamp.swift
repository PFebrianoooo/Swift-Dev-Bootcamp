//
//  FrameBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 04/11/23.
//

import SwiftUI

struct FrameBootcamp: View {
    var body: some View {
        Text("Hello this is frame")
            .background(Color.green) // kalo diatas frame untuk objectnya
//            .frame(width: 200, height: 300, alignment: .leading)
//            .background(Color.blue) // dibawah frame untuk framenya
            
        // default arguments complex frame
//            .frame(
//                minWidth: <#T##CGFloat?#>,
//                idealWidth: <#T##CGFloat?#>,
//                maxWidth: <#T##CGFloat?#>,
//                minHeight: <#T##CGFloat?#>,
//                idealHeight: <#T##CGFloat?#>,
//                maxHeight: <#T##CGFloat?#>,
//                alignment: <#T##Alignment#>
//            )
        
            // another combinations frame complex modifier
            
//            .frame(maxWidth: .infinity, alignment: .center)
            .frame(maxWidth: 100, minHeight: 100, alignment: .bottomTrailing)
            .background(Color.blue)
            .frame(maxWidth: 200, maxHeight: 200,alignment: .bottomTrailing)
            .background(Color.red)
            .frame(width: 300, height: 400, alignment: .bottomTrailing)
            .background(Color.gray)
    }
}

struct FrameBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        FrameBootcamp()
    }
}


// frame and allignments
// framing digunakan untuk membatasi area dari object agar tidak keluar dari batas frame yang menjadikan dia kemana-mana didalam canvas atau screenlayar.
// allignment atau perataan digunakan untuk meratakan object didalam frame
        /*
         .leading
         .trailing
         .center default allignments in swiftUI
         .topLeading
         .top
         .topTrailing
         .bottomLeading
         .bottom
         .bottomTrailng
         */

/*
 Modifier
 .backgorund() artinya mengubah backgorund si object bisa meliputi warna dan modifier lainnya
 .
 */


// default arguments Complex frame Modifier.
/*
 .infinity artinya akan memenuhi seluruh modifier yang measign nya.
    maxwidth: .infinity artinya width maksimal yaitu sebesar lebar dari iPhone
        bisa menggunakan max width max height dan lainnya.
*/


/*
 kombinasi yang biasa dilakukan pada framing adalah
 apabila
 1. .frame(maxWidth: .infinity, minHeight : 100, allignment: .leading)
 2. .frame(maxheight: .infinity, minWidth: 100 , allignment: .leading)
 */

