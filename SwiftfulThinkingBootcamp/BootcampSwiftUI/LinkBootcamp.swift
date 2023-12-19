//
//  LinkBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 19/12/23.
//

import SwiftUI

struct LinkBootcamp: View {
    
    let url: URL? = URL(string: "https://github.com//PFebrianoooo")
    let url2: URL? = URL(string: "https://github.com//PFebrianoooo")
    var body: some View {
        VStack {
            
            if let url {
                Link("Linkedin Profile", destination: url)
                    .font(.subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
            }
            
            
            if let url2 {
                Link(destination: url2) {
                    HStack(spacing: 0) {
                        Image(systemName: "person.fill")
                        Text("Connect with other People".capitalized)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(
                        Color.gray
                            .cornerRadius(10)
                    )
                }
            }
        }
    }
}

struct LinkBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LinkBootcamp()
    }
}

// Link Bootcamp
// small summary
/*
 merupakan cara untuk mendisplay link dimana kita bisa membuka secara direnct default browser  apabila mengklik link tersebut, ini modifier yang bagus untuk memberikan inforamsi tambahan untuk detailview ataupun sesuatu yang perlu detail lebih lanjut
 
 penggunaan link harus menggunakan unwrap optional value agar aplikasi tidak crash
 
 kalo kita klik link, langsung akan segue layar ke tujuan atau destinasi url nya. maka dari itu ini bagus atau mantepnya dari url
 macam macam link
 1. Link("", destination: URL)
 2. Link(destination: URL, label: )

 */
