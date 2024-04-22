//
//  Props.swift
//  Crisis game
//
//  Created by 吴征航 on 2024/3/4.
//

import SwiftUI
import AVFoundation

struct Props: View {
    @State var num = 0
    @State var isInfoTapped = false
    @State private var showAlert = false
    let synthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .opacity(0.5)
            VStack{
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 5)
                        .frame(width: 260,height: 430)
                        .background(Color.white)
                    if !isInfoTapped{
                        Image("aidCard")
                            .resizable()
                            .frame(width: 250,height: 350)
                    }else{
                        Text("This card can be used to avoid punishment when you answer questions wrong.").frame(width: 250,height: 420)
                            .font(.system(size: 30))
                    }
                    
                    
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color(.systemBlue))
                        .offset(x:90,y:-175)
                        .onTapGesture {
                            isInfoTapped.toggle()
                        }
                }
                
                HStack{
                    Spacer()
                    Image(systemName: "minus.circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(.systemBlue))
                        .padding()
                        .onTapGesture {
                            if num>0 {
                                num -= 1
                                var speaker:AVSpeechUtterance
                                speaker = AVSpeechUtterance(string: "Lose one aid card")
                                speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
                                speaker.rate = 0.3
                                synthesizer.speak(speaker)
                            }
                            
                        }
                    Spacer()
                    Text("\(num)")
                        .font(.system(size: 53))
                    Spacer()
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .foregroundColor(Color(.systemBlue))
                        .padding()
                        .onTapGesture {
                            num += 1
                            var speaker:AVSpeechUtterance
                            speaker = AVSpeechUtterance(string: "Get one aid card")
                            speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
                            speaker.rate = 0.3
                            synthesizer.speak(speaker)
                        }
                    Spacer()
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 5)
                        .frame(width: 260,height: 70)
                        .background(Color.red)
                        .onTapGesture {
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Confirmation"),
                                message: Text("Are you sure to reset the card number?"),
                                primaryButton: .default(Text("Yes")) {
                                    num = 0
                                },
                                secondaryButton: .cancel(Text("No"))
                            )
                        }
                    Text("Reset Card Number")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
        
        
    }
}

#Preview {
    Props()
}
