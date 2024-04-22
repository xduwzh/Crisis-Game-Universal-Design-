import SwiftUI
import AVFoundation

var questionsFire = [
    "Why should you never pour water on an electricity fire?",
    "What can you use to put out a fire at home?",
    "What should you do if you get a warning about a wildfire in your area?",
    "Most wildfires occur during the summertime in Sweden due to its dry climate. What are 2 common ways for a wildfire to start?",
    "Why is it good to have extra batteries at home?"
]
var answersFire = [
    "Whatever comes in contact with the water will get electrocuted.",
    "Water, fire extinguisher or fire blanket",
    "1. Go inside. 2. Close all doors, windows and ventilation. 3. Listen to the local radio",
    "Lightning, fire embers spreading from a grill or thrown cigarette buds that aren't fully put out",
    "Batteries can power flashlights and radios that give light and important information."
]

var questionsStorm = ["SMHI (Swedish Meteorological and Hydrological Institute) have used 3 different colors for weather forecast warnings, since april of 2021. What are the colors of the 3 different stages of warnings?",
                      "How long does it usually take for a storm on land to die out?",
                      "Storms can often affect the infrastructures, one example would be electricity poles falling which could result in a power outbreak. What are 3 things you should have at home if this happens?",
                      "Name 2 different types of storms that can occur in Sweden.",
                      "Most of us heat our home with electricity. If the electricity goes out when it's winter it can become troublesome. Name at least 3 ways to keep warm inside your home."]

var answersStorm = ["Yellow, orange and red.",
                    "It dies within a day.",
                    "Flashlight, powerbank, radio, extra water, canned food, blankets, candles, storm kitchen.",
                    "Thunderstorms, blizzards, hailstorms, storms and hurricanes.",
                    "Seal windows and doors. Use as few rooms as possible. Put blankets and rugs on the floor. Light candles. Light in a fireplace. Use a heating block. Wear a hat, gloves and slippers or warm socks."
]

var questionsFlood = ["Which month does it usually rain the most in Sweden?",
                      "Uncooked rice is a popular method when there's been a crisis, what type of crisis?",
                      "What number do you call to get information when a crisis occurs?",
                      "Why could it be dangerous to walk or drive in an area where a lot of water has collected?",
                      "What 4 things do all people need during a crisis?"
]

var answersFlood = ["July",
                    "It's common to put water damaged electronics in uncooked rice since it soaks up moisture within a few hours.",
                    "113 13",
                    "The water can knock people over or cause cars to drift away.",
                    "Food, heat, water and communication."
]


struct Quiz: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                Image("bg")
                    .resizable()
                    .opacity(0.5)
                HStack{
                    VStack{
                        Category(pic: "easy")
                        NavigationLink(destination: QuestionView(category: "easyFire" )) {
                            Category(pic: "fireEasy")
                        }
                        NavigationLink(destination: QuestionView(category: "easyFlood" )) {
                            Category(pic: "floodEasy")
                        }
                        NavigationLink(destination: QuestionView(category: "easyStorm" )) {
                            Category(pic: "stormEasy")
                        }
                    }
                    
                    VStack{
                        Category(pic: "hard")
                        NavigationLink(destination: QuestionView(category: "hardFire" )) {
                            Category(pic: "fireHard")
                        }
                        NavigationLink(destination: QuestionView(category: "hardFlood" )) {
                            Category(pic: "floodHard")
                        }
                        NavigationLink(destination: QuestionView(category: "hardStorm" )) {
                            Category(pic: "stormHard")
                        }
                    }
                }
            }
            
            
        }
        
    }
}


struct QuestionView: View {
    @State private var isHidden = true
    let synthesizer = AVSpeechSynthesizer()
    let category: String
    @State var randomNum = 0
    
    var body: some View {
        if(category == "easyFire"||category == "hardFire"){
            VStack{
                Spacer()
                Text(questionsFire[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                Spacer()
                
                Text(answersFire[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                    .opacity(isHidden ? 0:1)
                
                Spacer()
                HStack{
                    Spacer()
                    if isHidden{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    else {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    
                    
                    Spacer()
                    Image(systemName: "speaker.wave.2.circle")
                        .resizable()
                        .frame(width: 95, height: 95)
                        .foregroundColor(Color(.systemMint))
                        .padding(.all)
                        .onTapGesture {
                            var speaker:AVSpeechUtterance
                            if isHidden{
                                speaker = AVSpeechUtterance(string: questionsFire[randomNum])
                            }
                            else {
                                speaker = AVSpeechUtterance(string: answersFire[randomNum])
                            }
                            speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
                            speaker.rate = 0.4
                            synthesizer.speak(speaker)
                        }
                    Spacer()
                }
                Spacer()
            }
            .onAppear{
                randomNum = Int.random(in: 0...4)
            }
        }
        else if(category == "easyFlood"||category == "hardFlood"){
            VStack{
                Spacer()
                Text(questionsFlood[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                Spacer()
                
                Text(answersFlood[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                    .opacity(isHidden ? 0:1)
                
                Spacer()
                HStack{
                    Spacer()
                    if isHidden{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    else {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    
                    Spacer()
                    Image(systemName: "speaker.wave.2.circle")
                        .resizable()
                        .frame(width: 95, height: 95)
                        .foregroundColor(Color(.systemMint))
                        .padding(.all)
                        .onTapGesture {
                            var speaker:AVSpeechUtterance
                            if isHidden{
                                speaker = AVSpeechUtterance(string: questionsFlood[randomNum])
                            }
                            else {
                                speaker = AVSpeechUtterance(string: answersFlood[randomNum])
                            }
                            speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
                            speaker.rate = 0.4
                            synthesizer.speak(speaker)
                        }
                    Spacer()
                }
                Spacer()
            }
            .onAppear{
                randomNum = Int.random(in: 0...4)
            }
        }
        else if(category == "easyStorm"||category == "hardStorm"){
            VStack{
                Spacer()
                Text(questionsStorm[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                Spacer()
                
                Text(answersStorm[randomNum])
                    .padding(.all)
                    .font(.system(size: 28))
                    .opacity(isHidden ? 0:1)
                
                Spacer()
                HStack{
                    Spacer()
                    if isHidden{
                        Image(systemName: "magnifyingglass.circle")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    else {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 95, height: 95)
                            .foregroundColor(Color(.systemMint))
                            .padding(.all)
                            .onTapGesture {
                                isHidden.toggle()
                            }
                    }
                    
                    Spacer()
                    Image(systemName: "speaker.wave.2.circle")
                        .resizable()
                        .frame(width: 95, height: 95)
                        .foregroundColor(Color(.systemMint))
                        .padding(.all)
                        .onTapGesture {
                            var speaker:AVSpeechUtterance
                            if isHidden{
                                speaker = AVSpeechUtterance(string: questionsStorm[randomNum])
                            }
                            else {
                                speaker = AVSpeechUtterance(string: answersStorm[randomNum])
                            }
                            speaker.voice = AVSpeechSynthesisVoice(language: "en-US")
                            speaker.rate = 0.4
                            synthesizer.speak(speaker)
                        }
                    Spacer()
                }
                Spacer()
            }
            .onAppear{
                randomNum = Int.random(in: 0...4)
            }
        }
        
        
    }
}

struct Category: View {
    let pic: String
    var body: some View {
        Image(pic)
            .resizable()
            .frame(width: 120, height: 120)
            .cornerRadius(20)
            .shadow(color: .gray, radius: 5)
            .padding()
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz()
    }
}
