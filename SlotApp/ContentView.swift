//
//  ContentView.swift
//  SlotApp
//
//  Created by Jovan on 2/29/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private var symbols = ["apple", "cherry", "star"]
    @State private var numbers = [1,2,2]
    @State private var credits = 1000
    private var bet = 5
    
    var body: some View {
        ZStack{
        
            //Background
            Rectangle()
            .foregroundColor(Color(red: 200/255 , green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
            .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
        .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                //Title
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.green)
                    Text("Slot Machine")
                        .fontWeight(.heavy)
        
        
                    Image(systemName: "star.fill")
                                           .foregroundColor(Color.green)
                }.scaleEffect(2)
                Spacer()
                //Credit Counter
                Text("Credits: " + String(credits))
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                .cornerRadius(20)
                
                Spacer()
                
                //Cards
                
                HStack{
                    Image(symbols[numbers[0]])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                    Image(symbols[numbers[1]])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    Image(symbols[numbers[2]])
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                }
                Spacer()
                Button(action: {
                    
                    //Randomize Image
                    self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                    
                    if self.numbers[0] == self.numbers[1] &&
                    self.numbers[1] == self.numbers[2]{
                        
                    //Won
                        self.credits += self.bet*10
                    }
                    
                    else {
                        self.credits -= self.bet
                    }
                    
                }) {
                    Text("Spin")
                        .foregroundColor(Color.white)
                    .bold()
                    .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                    .background(Color.red)
                    .cornerRadius(20)
                }.scaleEffect(2)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
