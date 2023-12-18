//
//  ContentView.swift
//  SwiftUITopics
//
//  Created by Briana Bayne on 12/18/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var brianaIsAnOlyLifter = ["BigMountainBarbell","ChristmasBarbell", "Covid, workouts", "HeavyWeights","Kettlebell", "LightWeight", "MAX","OLY", "Oly Shoes","Queen","Solid", "SwimBabe", "YOUGotThis"].shuffled()
    // give me a random number
    @State var correctPicture = Int.random(in: 0...2)
    
    @State private var showingSore = false
    @State private var scoreTitle = ""
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 5.0) {
                VStack {
            
                    Text("Tap the correct weightlifting picture <3")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(brianaIsAnOlyLifter[correctPicture])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                ForEach(0..<3) { number in
                    Button {
                        workoutImageTapped(number)
                        
                    } label: {
                        Image(brianaIsAnOlyLifter[number])
                            .resizable()
                            .padding([.top, .leading, .trailing])
                            .imageScale(.small)
                            .controlSize(.small)
                            .clipShape(.buttonBorder)
                            .shadow(radius: -15)
                    }
                }
                
                Spacer()
                Spacer()
                Text("Score: ???")
                    .foregroundStyle(.pink)
                    .font(.title.bold())
            Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingSore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func workoutImageTapped(_ number: Int) {
        if number == correctPicture {
            scoreTitle = "Correct"
        } else {
           scoreTitle = "Wrong"
        }
        
        showingSore = true
    }
    func askQuestion() {
        brianaIsAnOlyLifter.shuffled()
        correctPicture = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
