//
//  EdLinkHomeClone.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 01/12/23.
//

import SwiftUI

struct EdLinkHomeClone: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            
            
            Text("Explore View")
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
            
            
            
            Text("ClassRoom")
                .tabItem {
                    Label("Class Room", systemImage: "person.3.fill")
                }
            
            
            
            Text("Chat")
                .tabItem {
                    Label("Home", systemImage: "text.bubble.fill")
                }
            
            
            
            Text("Account")
                .tabItem {
                    Label("Home", systemImage: "person.fill")
                }
        }
        .tint(.green)
        .background(Color.red)
    }
}

struct EdLinkHomeClone_Previews: PreviewProvider {
    static var previews: some View {
        EdLinkHomeClone()
    }
}


struct HomeView: View {
    var body: some View {
        ZStack {
            Color("edlinkBackground")
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    view1()
                    
                    view2()
                    
                    view3()
                    
                    view4()
                    
                    view5()
                    
                    view6()
                                        

                }
            }
        }
        .ignoresSafeArea(edges: .top)
        

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
            .padding(.top, 35)
            .padding(.horizontal, 10)
            .padding(.vertical, 30)
            

                
    }
}


struct view2: View {
    @State var background: Bool = false
    @State private var isChanging: Bool = false
    @State private var isChanging1: Bool = false
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading) {
                Text("my to-do list".capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text("Assignment or quiz you need to work on.")
                    .font(.caption)
            }
            .padding(.bottom, 15)
            .padding(.horizontal, 10)
            
            HStack(spacing: 5) {
                Button {
                    isChanging.toggle()
                } label: {
                    Text("All Subject")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(isChanging ? Color.green : Color.white)
                        .frame(width: 110, height: 20)
                        .background(isChanging ? Color.white : Color.green)
                        .cornerRadius(10)
                }
                
                Button {
                    isChanging1.toggle()
                } label: {
                    Text("Al Islam III")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(isChanging1 ? Color.white : Color.green)
                        .frame(width: 110, height: 20)
                        .background(isChanging1 ? Color.green : Color.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 15)
            
            ForEach(0..<4) { items in
                HStack {
                    Image(systemName: "list.bullet.clipboard.fill")
                        .font(.title3)
                        .foregroundColor(Color.blue.opacity(0.7))
                        .frame(width: 40 ,height: 40)
                        .background(
                            Color.blue.opacity(0.4)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    
                    VStack(alignment: .leading) {
                        Text("Review")
                            .font(.callout)
                            .fontWeight(.semibold)
                        Text("Deadline : Not Set")
                            .font(.caption)
                    }
                    
                    
                    Spacer()
                    
                    Image(systemName: "line.3.horizontal")
                }
                .padding(.vertical, 15)
                .padding(.horizontal, 10)
                .overlay(
                    Rectangle()
                        .stroke(lineWidth: 0.2)
                )

            }
        }
        .padding(.vertical, 15)
        .background(Color.white)

    }
}


struct icon: View {
    var imageSystem: String
    var backgroundColor: Color
    var nameIcon: String

    var body: some View {
        VStack {
            Image(systemName: imageSystem)
                .font(.title)
                .foregroundColor(backgroundColor)
                .frame(width: 50, height: 50)
                .background(
                    backgroundColor.opacity(0.2)
                        .cornerRadius(10)
                )
            
            Text("\(nameIcon)")
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        .frame(width: 72, height: 100)
        .padding(.all, 10)
    }
}

struct view3: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("My Academic")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.leading, 15)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    icon(imageSystem: "qrcode", backgroundColor: .green, nameIcon: "Presence QR Code")
                    icon(imageSystem: "person.text.rectangle.fill", backgroundColor: .orange, nameIcon: "Student e-Card")
                    icon(imageSystem: "note.text.badge.plus", backgroundColor: .blue, nameIcon: "Invoice Payment")
                    icon(imageSystem: "list.bullet.clipboard.fill", backgroundColor: .green, nameIcon: "Registered Course")
                }
                HStack {
                    icon(imageSystem: "list.bullet.rectangle.fill", backgroundColor: .green, nameIcon: "Exam Result")
                    icon(imageSystem: "book.fill", backgroundColor: .green, nameIcon: "Exam Result")
                    icon(imageSystem: "person.crop.circle.fill.badge.questionmark", backgroundColor: .green, nameIcon: "Lecturer Consultation")
                    icon(imageSystem: "graduationcap", backgroundColor: .orange, nameIcon: "Transcript")
                }
                HStack {
                    icon(imageSystem: "a.book.closed.fill", backgroundColor: .orange, nameIcon: "Learning Progress")
                    icon(imageSystem: "chart.line.downtrend.xyaxis", backgroundColor: .green, nameIcon: "Assesment")
                    icon(imageSystem: "list.bullet.clipboard.fill", backgroundColor: .green, nameIcon: "Input KRS")
                    icon(imageSystem: "graduationcap.circle.fill", backgroundColor: .orange, nameIcon: "Academic Data")
                }
                HStack {
                    icon(imageSystem: "building.2.fill", backgroundColor: .green, nameIcon: "Acreditation")
                    icon(imageSystem: "building.columns", backgroundColor: .purple, nameIcon: "Majors Acreditation")
                    }
            }
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .frame(width: UIScreen.main.bounds.width)
        .background(
            Color.white
        )

    }
}


struct view4: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            HStack {
                Text("Campus News")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Button {
                    // actions
                } label: {
                    HStack(spacing: 0) {
                        Text("See All ")
                        Image(systemName: "arrow.right")
                    }
                    .font(.caption2)
                    .foregroundColor(.green)
                    .frame(width: 80, height: 25)
                    .background(
                        Color.green.opacity(0.2)
                            .clipShape(Capsule())
                    )

                }

            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { items in
                        VStack(alignment: .leading, spacing: 10) {
                            Text("jadwal kuliah fakultas teknik umj semester ganjil 2023/2024".capitalized)
                                .font(.callout)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                            
                            Text("Assalamualaikum WR.WB. kepada YTH Bapak/Ibu Dosen, Mahasiswa/i. Kami Sampaikan Jadwal Kuliah untuk semester Ganjil 2023/2024")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 20)
                        .multilineTextAlignment(.leading)
                        .frame(width: 290, height: 150)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }

                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 25)
        .background(Color.white)

    }
}

struct view5: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            HStack {
                Text("Helpdesk Edlink")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                Button {
                    // actions
                } label: {
                    HStack(spacing: 0) {
                        Text("See All ")
                        Image(systemName: "arrow.right")
                    }
                    .font(.caption2)
                    .foregroundColor(.green)
                    .frame(width: 80, height: 25)
                    .background(
                        Color.green.opacity(0.2)
                            .clipShape(Capsule())
                    )

                }

            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { items in
                        VStack(alignment: .leading, spacing: 0) {
                            Image("Image-3")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250, height: 170)
                            
                            Spacer(minLength: 0)
                            VStack(alignment: .leading ,spacing: 8) {
                                Text("Gabung ke kelas yang sudah di tentukan sebelumnya".capitalized)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Text("Halo sobat setia EdLink! ada yang terbaru dari edlink yaitu penambahan fitur yang ada. untuk bisa bergabung ke kelas yang sudah di tentukan sebelummnya oleh dosen anda")
                                    .font(.caption2 )
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .multilineTextAlignment(.leading)
                        }
                        
                        .frame(width: 250, height: 250)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))

                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 25)
        .background(Color.white)

    }
}

struct view6: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Helpdesk Edlink")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                
                Text("Discover good news, stories about education world")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(0..<5) { items in
                        ZStack {
                            Image("Image-4")
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                                .contrast(0.2)
                            
                            VStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Indonesia capai kesepakatan dengan china untuk menjual pesawat nr219".capitalized)
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .frame(width: .infinity, height: 70)
                                    
                                    Text("Good news from Radar Republika. Indonesia telah menandatangani kontrak kerja dengan tiongkok")
                                        .font(.caption)
                                        .frame(width: .infinity, height: 40)

                                }
                                .foregroundColor(.white)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 25)

                                
                                Button {
                                    // actions
                                } label: {
                                    Text("Read More")
                                        .font(.callout)
                                        .foregroundColor(.white)
                                        .frame(width: 120, height: 50)
                                        .background(
                                            Color.green
                                                .cornerRadius(10)
                                        )
                                }
                            }
                            .frame(width: 300, height: 300)
                        }
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)

                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 25)
        .padding(.bottom, 25)
        .background(Color.white)

    }
}
