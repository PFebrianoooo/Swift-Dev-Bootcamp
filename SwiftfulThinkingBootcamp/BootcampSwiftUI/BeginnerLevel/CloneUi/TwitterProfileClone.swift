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
                
                Divider()
                
                cardView
            }
        }
        .ignoresSafeArea(edges: .top)
    }
    
    
    // attributes definition
    
    var cardView: some View {
        VStack {
            // button info profile horizontal
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center , spacing: 35) {
                    Button {
                        // put an action in here
                    } label: {
                        Text("Posts")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                    
                    Button {
                        // put an action in here
                    } label: {
                        Text("Replies")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                    }
                    
                    Button {
                        // put an action in here
                    } label: {
                        Text("Highlights")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                    }

                    Button {
                        // put an action in here
                    } label: {
                        Text("Media")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                    }

                    Button {
                        // put an action in here
                    } label: {
                        Text("Likes")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical,5)
            }
            
            Divider()
            
            // card info
            ForEach(0..<10) { Items in
                VStack {
                    captionCard()
                }
            }

        }

    }
    
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

struct captionCard: View {
    var body: some View {
        HStack {
            Image("Image-2")
                .resizable()
                .frame(width: 55, height: 55)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack(spacing: 3){
                    Text("Heath Ledgers")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Text("@ledgerss")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                    
                    Spacer()
                }
                
                Text("siap sedia tiap ku bercerita. kuberuntung jadi anakmu bunda")
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                
                
                HStack {
                    Image(systemName: "bubble.left")
                    Spacer()
                    Image(systemName: "arrow.2.squarepath")
                    Spacer()
                    Image(systemName: "heart")
                    Spacer()
                    Image(systemName: "paperplane")
                }
                .padding(.vertical, 2)
                
            }
            .frame(width: 290)
            
            Spacer()
            Image(systemName: "ellipsis")
                .offset(y: -35)
        }
        .frame(width: .infinity)
        .padding(.horizontal, 10)
        .padding(.vertical, 3)
        Divider()

    }
}

// display preview.
struct TwitterProfileClone_Previews: PreviewProvider {
    static var previews: some View {
        TwitterProfileClone()
    }
}



