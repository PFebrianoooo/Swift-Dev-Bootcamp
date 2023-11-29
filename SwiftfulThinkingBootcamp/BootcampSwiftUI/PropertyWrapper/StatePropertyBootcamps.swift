//
//  StatePropertyBootcamps.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 27/11/23.
// implementations instagram feed like

import SwiftUI

struct StatePropertyBootcamps: View {
    
    @State var count: Int = 0
    @State var image: String = "heart"
    @State var colors: Color = .black
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Image")
                    .resizable()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text("P.Febrianoo_")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal, 6)
            
            
            Image("Image-2")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width ,height: 400)
            
            
            HStack {
                
                Button {
                    count += 1
                    colors = Color.red
                    image = "heart.fill"
                    
                } label: {
                    Image(systemName: "\(image)")
                        .font(.title2)
                        .foregroundColor(colors)
                        

                }

                
                Button {
                    // actions
                } label: {
                    Image(systemName: "bubble.right")
                        .font(.title2)
                        .foregroundColor(.black)

                }
                
                
                Button {
                    // actions
                } label: {
                    Image(systemName: "paperplane")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                
                Spacer()
            }
            
            .padding(.vertical, 5)
            .padding(.horizontal, 6)
            
            
            
            VStack(alignment: .leading, spacing: 3) {
                Text("\(count) Likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text ("P.Febrianoo_ ")
                    .font(.caption)
                    .fontWeight(.semibold) +
                
                Text("Hello this is my first Post !")
                    .font(.caption)
            }
            .padding(.horizontal, 6)
        }
        
    }
}

struct StatePropertyBootcamps_Previews: PreviewProvider {
    static var previews: some View {
        StatePropertyBootcamps()
    }
}
