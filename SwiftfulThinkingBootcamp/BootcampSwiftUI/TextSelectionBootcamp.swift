//
//  TextSelectionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 19/12/23.
//

import SwiftUI

struct TextSelectionBootcamp: View {
    var body: some View {
        VStack {
            Text("hello there")
            Text("This is Putra Pebriano Nurba")
                .textSelection(.enabled)
            Text("son of Bahrudin")
        }
    }
}

struct TextSelectionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TextSelectionBootcamp()
    }
}

// text selection Bootcamp
// small Summary
/*
 text selection merupakan preferensi untuk text ketika dia di toggle akan memunculkan popup bahwa text ini apakah mau di copy ataupun mau di share.
 penggunaanya mudah banget, dan berguna untuk neghiglight text text yang penting
 */
