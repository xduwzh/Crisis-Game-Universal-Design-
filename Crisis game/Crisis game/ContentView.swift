//
//  ContentView.swift
//  Crisis game
//
//  Created by 吴征航 on 2024/2/12.
//

import SwiftUI
import AVKit
struct ContentView: View {
    
    var body: some View {
        TabView{
            Dice()
                .tabItem {
                    Image(systemName: "dice")
                    Text("Dice")
                }
            Quiz()
                .tabItem {
                    Image(systemName: "questionmark.bubble")
                    Text("Quiz")
                }
            Props()
                .tabItem {
                    Image(systemName: "cross.case")
                    Text("Props")
                }
            Rules()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Rules")
                }
            
        }
    }
}

#Preview {
    ContentView()
}
