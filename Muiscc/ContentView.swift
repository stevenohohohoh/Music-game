//
//  ContentView.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/27.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI
import AVFoundation



struct ContentView: View {
    

    @State private var status = 3
    /*
     3 = menu
     
     1 = onekey start
     2 = onekey finish
     
     4 = chord start
     5 = chord finish
     */
    
    @State private var answer = true
    @State private var point = 0
    @State private var gameCount = 1
    @State private var currentV = "no"
    //single key
    
    @State private var canswer = true
    @State private var ccurrentV: Array = randomItem(num: 3)
    @State private var index: Int = 0
    //chord
    
    @State private var sanswer = true
    @State private var scurrent = rScale(num: 7)
    
    
    @State private var coin = UserDefaults.standard.integer(forKey: "coin")
    
    
    var body: some View {
        VStack{
                if status == 1{
                    
                    View1(status: $status, answer: $answer, point: $point, gameCount: $gameCount, coin:$coin, currentV: currentV).transition(AnyTransition.slide)
                    .animation(.default)
                    
                }else if status == 2{
                    View2(status: $status, answer: $answer, gameCount: $gameCount, point: $point, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)
                }else if status == 3{
                    
                    Menu(status: $status, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)
                }else if status == 4{
                    chord(status: $status, current: $ccurrentV, Index: $index, answer: $canswer, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)

                }else if status == 5{
                    chordfinish(status: $status, current: $ccurrentV, Index: index, answer: $canswer, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)
                }else if status == 6{
                    
                    Scale(status: $status, Scurrent: $scurrent, Index: $index, answer: $sanswer, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)
                    
                }else if status == 7{
                    scalefinish(status: $status, Scurrent: $scurrent, Index: index, Sanswer: $sanswer, coin: $coin).transition(AnyTransition.slide)
                    .animation(.default)
            }

        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


