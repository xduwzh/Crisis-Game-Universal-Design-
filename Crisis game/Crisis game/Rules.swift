//
//  Rules.swift
//  Crisis game
//
//  Created by 吴征航 on 2024/3/13.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("GOAL OF THE GAME")
                .multilineTextAlignment(.leading)
                .font(.system(size: 21))
                .bold()
            Text("Follow the path and get to the target point as fast as possible. Learn how to prepare and react in a crisis by answering the questions. The first who reaches the end/target point wins.")
                .multilineTextAlignment(.leading)
            Spacer()
            Text("GAME SETUP")
                .multilineTextAlignment(.leading)
                .font(.system(size: 21))
                .bold()
            Text("1. Connect as many boards as you want to playwith and place the board in the centre of the table.")
                .multilineTextAlignment(.leading)
            Text("2. Place the figure on the starting point and make the dice ready.")
                .multilineTextAlignment(.leading)
            Text("3. Put the cards in the box that the answer is covered. or use the app to get virtual cards")
                .multilineTextAlignment(.leading)
            Spacer()
            Text("FIELD TYPES")
                .multilineTextAlignment(.leading)
                .font(.system(size: 21))
                .bold()
            Text("Depending on the field you step on after you rolled the dice you get a different outcome after answering the question:")
                .multilineTextAlignment(.leading)
            Text("Black field")
                .multilineTextAlignment(.leading)
            Text("right answer: get aid card | wrong answer: /")
                .multilineTextAlignment(.leading)
            Text("White field:")
                .multilineTextAlignment(.leading)
            Text("brake")
                .multilineTextAlignment(.leading)
            Text("Coloured field (red, blue or grey)")
                .multilineTextAlignment(.leading)
            Text("right: 2 forward | wrong: 2 backward")
                .multilineTextAlignment(.leading)
            Spacer()
            Text("GAME PLAY")
                .multilineTextAlignment(.leading)
                .font(.system(size: 21))
                .bold()
            Text("First, you can play with as many boards as you want. You can only play the fire board, only the water board only the storm board, or connect them.")
                .multilineTextAlignment(.leading)
            Spacer()
        }.padding()
    }
    
    
    
    
    
}

#Preview {
    Rules()
}
