//
//  SoundsBootcamp.swift
//  SwiftIntermediate
//
//  Created by Denys on 15.05.2022.
//

import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager() //Singltone
    
    var player : AVAudioPlayer?
    
    enum SoundOption: String {
        case tada
        case duck
    }
    
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else {return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Eror Playing Sound \(error.localizedDescription)")
        }
        
        
    }
}

struct SoundsBootcamp: View {
    
    var soundManager = SoundManager()
    
    var body: some View {
        VStack(spacing: 40) {
            Button("Play sound1") {
                SoundManager.instance.playSound(sound: .tada)
            }
            Button("Play sound2") {
                SoundManager.instance.playSound(sound: .duck)
            }
        }
    }
}

struct SoundsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        SoundsBootcamp()
    }
}
