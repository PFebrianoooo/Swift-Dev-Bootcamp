//
//  TwitterProfileClone.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 28/11/23.
//

import SwiftUI

struct TwitterProfileClone: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                headerView
                
                editProfileAndBell
                
                profileInfo
                                
            
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    // attributes definition
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color.blue
                .ignoresSafeArea()
            
            Image("Image-2")
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 90, height: 90)
                .offset(x: 20, y: 35)
            
        }
        .frame(height: 150)
    }
    
    var editProfileAndBell: some View {
        HStack {
            Spacer()
                    Button {
                        // actions
                    } label: {
                        Image(systemName: "bell.badge")
                            .foregroundColor(.black)
                            .font(.title3)
                            .overlay {
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1.5)
                                    .frame(width: 25, height: 25)
                            }
                    }
        
                    
        
                    Button {
                        // actions
                    } label: {
                        Text("Edit Profile".capitalized)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 15)
                            .padding(.top, 5)
                            .offset(y: -2)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1.5)
                                    
                                    
                            )
        
                    }
                }
        .padding(.horizontal, 25)
        .padding(.top, 2)
        .frame(width: .infinity)

    }
    
    var profileInfo: some View {
        VStack(alignment: .leading, spacing: 20) {
            // name and chceckmark
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("Heath Ledger")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                        
                    Spacer()
                }
                .frame(width: .infinity)
                
                // id twitter
                Text("@ledgerss")
                    .font(.caption)

            }
            .frame(width: .infinity)
            
            
            // captions
            Text("your favorite kids movie and inspirational")
                .font(.body)
                .fontWeight(.semibold)
            
            
            // followers and link
            HStack(alignment: .center) {
                // followers
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                        .font(.title3)
                    
                    Text("40 Mutuals Followers")
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
                // link
                HStack {
                    Image(systemName: "link")
                        .foregroundColor(.gray)
                        .font(.title3)
                    
                    Text("https://ledgerss.com")
                        .foregroundColor(.gray)
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
         
            
            // following and followers
            HStack(alignment: .center) {
                // following
                Text("10")
                    .fontWeight(.semibold) +
                Text(" Following")
                    .foregroundColor(.gray)
                    .font(.headline)
                
                // followers
                Text("13")
                    .fontWeight(.semibold) +
                Text(" Followers")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(width: .infinity)

    }
}

struct TwitterProfileClone_Previews: PreviewProvider {
    static var previews: some View {
        TwitterProfileClone()
    }
}
