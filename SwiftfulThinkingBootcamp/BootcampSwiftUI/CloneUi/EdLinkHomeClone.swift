//
//  EdLinkHomeClone.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 01/12/23.
//

import SwiftUI

struct EdLinkHomeClone: View {
    var body: some View {
        view1()
    }
}

struct EdLinkHomeClone_Previews: PreviewProvider {
    static var previews: some View {
        EdLinkHomeClone()
    }
}

struct view1: View {
    var body : some  View {
        VStack(spacing : 35) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello, Putra Pebriano Nurba")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Text("Lets start youd day. Cheer up!")
                        .font(.subheadline)
                }
                .foregroundColor(.white)

                Spacer()

                Image(systemName: "bell.fill")
                    .font(.title2)
                    .offset(y: -35)
                    .foregroundColor(.white)
            }

            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Today Schedule")
                            .font(.subheadline)

                        Text("Friday, 1 dec 2023")
                            .fontWeight(.semibold)
                    }

                    Spacer()

                    Button {
                        //
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Schedule")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.green)
                        .padding(.horizontal, 15)
                        .padding(.vertical, 5)
                        .background(
                            Color.green.opacity(0.3)
                                .clipShape(Capsule())
                        )
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)

                Divider()

                Spacer()

                Text("No classes Today")
                    .font(.subheadline)

                Spacer()

            }

            .frame(width: 350, height: 175)
            .background(Color.white)
            .cornerRadius(10)

        }
        .padding(.horizontal, 8)
        .frame(width: .infinity, height: 320)
        .background(Color("edlinkBackground"))
        
    }
}
