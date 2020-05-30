//
//  View1.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/28.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI
struct View1: View{
    @Binding var status: Int
    @Binding var answer: Bool
    @Binding var point: Int
    @Binding var gameCount: Int
    @Binding var coin: Int
    @State var currentV: String
    
    var pickerValue: Array = ["a", "b", "c", "d", "e", "f", "g"]
    
    @State private var selectedIndex = 0
    @State private var change = true
    @State private var showingAlert = false
    
    var body: some View{
        
        VStack(alignment: .center) {
            HStack(alignment: .center) {

                Text("\(gameCount)/5")
                    .font(.system(size: 30))
                
                Text("Point \(point)")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 30))
                    .padding(.leading, 150.0)
                   
            }.padding(20).offset(y: 13)
                
            Button(action: {
                if self.change{
                    self.currentV = self.pickerValue.randomElement()!
                    playSound(sound: self.currentV)

                    print("here")
                    self.change = false
                }else{
                    playSound(sound: self.currentV)
                    
                }
                
            }) {
                
                HStack {
                    Image("icons8-music-record-60")
                        .font(.title)
                    Text("Play")
                        .fontWeight(.semibold)
                        .font(.title)
                }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                    .padding(20).scaleEffect(x: 1.1, y: 1.1, anchor: UnitPoint.center)
            }
            
            Button(action: {
                self.currentV = self.pickerValue.randomElement()!
                playSound(sound: self.currentV)

            }) {
                Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
            }.hidden()
   
            Picker(selection: $selectedIndex, label: Text("")) {
                       ForEach(0 ..< pickerValue.count) {
                          Text(self.pickerValue[$0])
                       }
                
            }.labelsHidden().padding()
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.orange, lineWidth: 2)
            )

            Text("\(pickerValue[selectedIndex])")
                .font(.system(size: 60))
                .foregroundColor(Color.black)
                .padding(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3)
                        .frame(width: 90, height: 90, alignment: Alignment.center)
                )
                
            Button(action:{
                self.change = true
                self.gameCount += 1
                if self.gameCount > 5{
                    
                    self.status = 2
                    self.coin += self.point*10
                    
                }
                if self.pickerValue[self.selectedIndex] != self.currentV{
                    
                    self.answer = false
                    self.showingAlert = true
                    
                }else if self.currentV == "no"{
                    print("havent pressed")
                }else{
                    self.answer = true
                    self.point += 1
                }
                
            }){
                Text("Submit")
                    .fontWeight(.semibold)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .padding(.horizontal, 20)
                }.padding()
            
            HStack (spacing: 100){
                Button(action: {
                           self.status = 2
                           self.gameCount = 0
                          self.point = 0
                       }) {
                           Text("Retry")
                            .foregroundColor(Color.red)
                            .font(.system(size: 25))

                }
            Button(action: {
                self.status = 3
            }){
                Text("Menu")
                    .foregroundColor(Color.red)
                    .font(.system(size: 25))
                }
            }.edgesIgnoringSafeArea(.all).offset(y: -10)
            
            HStack {
                Image("icons8-coin-48")
                Text("\(self.coin)")
                    .font(.title)
            }.offset(x: 120, y: -10)
            
        }
    }
}


struct View1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
