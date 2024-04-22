//
//  Dice.swift
//  Crisis game
//
//  Created by 吴征航 on 2024/2/12.
//

import SwiftUI
import AVKit

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    func playSound(){
        guard let url = Bundle.main.url(forResource: "rollDiceSound", withExtension: ".wav") else{return}
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound")
        }
    }
}

struct Dice: View {
    @State var number = 1
    @State var isRolling = false
    var audioPlayer: AVAudioPlayer!
    
    func rollDice() {
            var rollsRemaining = 7 // 更改这个值来调整滚动次数
            Timer.scheduledTimer(withTimeInterval: 0.09, repeats: true) { timer in
                number = Int.random(in: 1...6)
                rollsRemaining -= 1
                if rollsRemaining == 0 {
                    timer.invalidate()
                    isRolling = false
                }
            }
    }
    
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .opacity(0.5)
            
            Image("d\(number)")
                .resizable()
                .frame(width: 220, height: 220)
                .onTapGesture {
                    isRolling = true
                    SoundManager.instance.playSound()
                    rollDice()
                }
        }
        
        
        
    }
}


#Preview {
    Dice()
}
