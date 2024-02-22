//
//  TravelAppsUiHome.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 13/12/23.
//

import SwiftUI

struct TravelAppsUiHome: View {
    
    @State var categories: [String] = [
        "Mountain", "Nature", "Ocean", "Hiking", "Walk"
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // top View
                    VStack {
                        HStack {
                            Image(systemName: "text.alignleft")
                                .fontWeight(.semibold)
                                .padding(.all, 8)
                                .background(
                                    Color.gray
                                        .clipShape(Circle())
                                )
                            
                            Spacer()
                            
                            VStack(alignment: .center) {
                                Text("Current Location")
                                    .font(.caption)
                                    .fontWeight(.light)
                                
                                HStack(alignment: .center, spacing: 0) {
                                    Image(systemName: "location.fill")
                                        .fontWeight(.thin)
                                        .foregroundColor(.blue)
                                    Text("Denpasar, Bali")
                                        .fontWeight(.semibold)
                                        
                                }
                            }
                            
                            Spacer()
                            
                            Image(systemName: "person.fill")
                                .font(.system(size: 25))
                                .padding(.all, 8)
                                .background(
                                    Color.mint
                                        .clipShape(Circle())
                                )
                        }
                    }
                    .padding(.top, 10)
                    
                    // category View
                    VStack {
                        HStack {
                            Text("Category")
                                .font(.title3)
                                .fontWeight(.semibold)
                                
                            Spacer()
                            

                            NavigationLink {
                                Text("Category full menu")
                                
                            } label: {
                                    HStack(spacing: 0) {
                                        Text("View all")
                                        Image(systemName: "arrow.right")
                                    }
                                    .fontWeight(.semibold)
                                    .font(.caption)
                                    .padding(.horizontal, 7)
                                    .padding(.vertical, 2)
                                    .background(
                                        Color.blue.opacity(0.4)
                                            .clipShape(Capsule())
                                    )
                            }


                        }
                    }
                    .padding(.vertical, 20)
                    
                    // scrollable category
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            ForEach (categories ,id: \.self) { items in
                                Button {
                                    
                                } label: {
                                    HStack(spacing: 0) {
                                        Image(systemName:"mountain.2.fill")
                                            .foregroundColor(.purple)
                                        Text("\(items)")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.all, 10)
                                    .background(
                                        Color.black.opacity(0.1)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        )

                                }
                                .padding(.leading)

                            }
                        }
                    }
                    
                    // scrollable sections
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0..<5) { items in
                                ZStack(alignment: .bottom) {
                                    Image("Image-4")
                                        .resizable()
                                    
                                    VStack(spacing: 0) {
                                        HStack{
                                            Text("Rinjani Mountain")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            Spacer()
                                            Text("$40")
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }
                                        HStack{
                                            HStack(spacing: 0) {
                                                
                                                Image(systemName: "location.fill")
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                                
                                                Text("Rinjani Mountain")
                                                    .font(.system(size: 9))
                                                    .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                            }
                                            Spacer()
                                            Text("Lombok")
                                                .font(.system(size: 9))
                                                .foregroundColor(.white)
                                                .fontWeight(.semibold)
                                        }

                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.bottom)
                                        
                                }
                                .frame(width: 220, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 15))

                            }
                        }
                    }
                    .padding(.vertical, 20)
                    
                    // list View Popular destinations
                    VStack {
                        HStack {
                            Text("Popular Destination")
                                .font(.title3)
                                .fontWeight(.semibold)
                                
                            Spacer()
                            
                            Button {
                                // actions
                            } label: {
                                HStack(spacing: 0) {
                                    Text("View all")
                                    Image(systemName: "arrow.right")
                                }
                                .fontWeight(.semibold)
                                .font(.caption)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 2)
                                .background(
                                    Color.blue.opacity(0.4)
                                        .clipShape(Capsule())
                                )
                            }

                        }
                        .padding(.vertical)
                        
                        VStack(spacing: 10) {
                            ForEach(0..<5) { items in
                                HStack {
                                    Image("Image-4")
                                        .resizable()
                                        .frame(width: 90, height: 95)
                                        .cornerRadius(10)
                                    
                                    
                                    VStack(alignment: .leading) {
                                        Text("The Pink Beach")
                                            .font(.system(size: 17))
                                            .bold()
                                        Text("Locations")
                                            .font(.caption)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.blue)
                                        
                                        Text("this is description on this list of travels apps and this multiline based on the design.")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                            .baselineOffset(0.5)
                                            
                                        
                                        HStack {
                                            Text("$price")
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                            Text("locations city")
                                                .font(.caption)
                                                .fontWeight(.semibold)
                 
                                        }
                                    }
                                    
                                }
                                .frame(width: .infinity)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    Color("Travel")
                                        .cornerRadius(10)
                                )
                                
                                

                            }
                        }
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        
    }
}

struct TravelAppsUiHome_Previews: PreviewProvider {
    static var previews: some View {
        TravelAppsUiHome()
    }
}
