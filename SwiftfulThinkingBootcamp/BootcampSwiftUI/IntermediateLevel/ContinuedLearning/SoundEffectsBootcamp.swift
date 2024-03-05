//
//  SoundEffectsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Putra Pebriano Nurba on 05/03/24.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager() // Singleton Class
    
    var avPlayer: AVAudioPlayer?
    
    enum soundOptions: String {
        case badum = "Badum-tss"
        case duckQuack = "Duck-quack"
    }
    
    func playAudioSounds(sounds: soundOptions) {
        guard let url: URL =  Bundle.main.url(forResource: sounds.rawValue , withExtension: ".mp3") else {return}
        /*
         // do try catch
         kurang lebih sama seperti if else statement, tetapi pada kasus in ido try catch berguna untuk catching error.
         Bedanya ini adalah do artinya lakukan dulu, coba link diatas, kalo gabisa print error ke console
         */
        do {
            avPlayer = try AVAudioPlayer(contentsOf: url)
            avPlayer?.play()
        } catch let error {
            print("cannot played sound because \(error.localizedDescription)")
        }
    }
}

struct SoundEffectsBootcamp: View {
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Play sound 1".capitalized) {
                SoundManager.instance.playAudioSounds(sounds: .badum)
            }
            
            Button("Play sound 2".capitalized) {
                SoundManager.instance.playAudioSounds(sounds: .duckQuack)
            }
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    SoundEffectsBootcamp()
}

// small summary
/*
 sound effect
 sound effect merupakan sebuah cara untuk menggunakan sound yang terdapat pada device iphone, dimana sound effect akan berguna untuk memberikan notifikasi untuk aplikasi yang dibuat.
 Untuk memanage sound, dibutuhkan sebuah CLASS atau kelas untuk memanage sound sound yang ada didalam device apple.
 
 
 
 MARK: Alert !!!!
 SINGLETON
 Merupakan sebuah data flow untuk class untuk mempermudah distribusi daripada value atau isi dari class untuk digunakan di seluruh view yang ada. Karena sebelumnya kita harus mendeinisikan dulu melalui @stateObject atau variable biasa, maka dari itu singleton datang untuk mempermudah agar tidak berulang kali untuk menuliskan @stateObject atau var.
 
 Example of singleton
    class SoundManager {
        static let instance = SoundManager() // Singleton
    }
 
 
 NEW FRAMEWORK !
 Import AVKit stand for audio and video kit, dimana kita bisa memutar video atau memainkan musik menggnakan framework ini.
 */
