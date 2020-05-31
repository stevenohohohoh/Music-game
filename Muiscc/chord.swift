//
//  chord.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/29.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI



struct chord: View {
    @Binding var status: Int
    @Binding var current: Array<String>
    @Binding var Index: Int
    @Binding var answer: Bool
    @Binding var coin: Int
    
    @State private var pickerValue: Array = ["a", "b", "c", "d", "e", "f", "g"]
    
    
    @State private var oneS = true
    @State private var one = ""
    
    @State private var twoS = true
    @State private var two = ""
    
    @State private var threeS = true
    @State private var three = ""
    
    @State private var isAlert = false
    
    var body: some View {
        
        VStack{
            
            
            
            
            Picker(selection: $Index, label: Text("")) {
                                  ForEach(0 ..< pickerValue.count) {
                                    Text(self.pickerValue[$0])
                                  }
                           
                       }.labelsHidden().padding()
                       .overlay(
                           RoundedRectangle(cornerRadius: 16)
                               .stroke(Color.orange, lineWidth: 2)
                       )
            
            HStack {
                Button(action:{
                    self.oneS.toggle()
                    self.one = self.pickerValue[self.Index]
                }){
                    if oneS{
                        Text("")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }else{
                        Text("\(one)")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }
                }.overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3)
                        .frame(width: 100, height: 90, alignment: Alignment.center)
                ).padding(40)
                
                Button(action:{
                    self.twoS.toggle()
                    self.two = self.pickerValue[self.Index]
                }){
                    if twoS{
                        Text("")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }else{
                        Text("\(two)")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }
                }.overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3)
                        .frame(width: 100, height: 90, alignment: Alignment.center)
                ).padding(40)
                
                Button(action:{
                    self.threeS.toggle()
                    self.three = self.pickerValue[self.Index]
                }){
                    if threeS{
                        Text("")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }else{
                        Text("\(three)")
                        .font(.system(size: 30))
                        .foregroundColor(Color.black)
                        .padding(8)
                    }
                }.overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.orange, lineWidth: 3)
                        .frame(width: 100, height: 90, alignment: Alignment.center)
                ).padding(40)
                
                
                
            }
            
            Button(action: {
                GSAudio.sharedInstance.playSounds(soundFileNames: self.current)
            }){
                HStack {
                    Image("icons8-music-record-60")
                  
                    Text("Play Chord")
                    .font(.system(size: 20))
                }.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .padding(3).scaleEffect(x: 1.1, y: 1.1, anchor: UnitPoint.center)
            }
            Button(action: {
                self.isAlert = true
                
                
            }){
                HStack {
                    Image("icons8-music-record-60")
                    Text("Saperate - 10 Coins")
                        .font(.system(size: 20))
                }.frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .padding(.horizontal, 20)
                .padding(3).scaleEffect(x: 1.1, y: 1.1, anchor: UnitPoint.center)
            }.alert(isPresented: $isAlert) { () -> Alert in
                
            Alert(title: Text("Purchase"), message: Text("Are you sure you want to purchase with 10 coins?"), primaryButton: .default(Text("Yes"), action: {
                
                if self.coin > 10{
                    GSAudio.sharedInstance.playSounds(soundFileNames: self.current, withDelay: 0.5)
                    self.coin -= 10
                    UserDefaults.standard.set(self.coin, forKey: "coin")

                }
    
            }), secondaryButton: .default(Text("No")))
            }
            
            Button(action:{
                let ans = [self.one, self.two, self.three]
                self.status = 5
                if ans.containsSameElements(as: self.current){
                    self.answer = true
                    self.coin += 25
                    UserDefaults.standard.set(self.coin, forKey: "coin")
                }
                else{
                    self.answer = false
                }
                
                print(self.current)
                self.one = ""
                self.two = ""
                self.three = ""
                
            }){
                Text("submit")
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                    .foregroundColor(Color.orange)

                    
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.orange, lineWidth: 3)
                )
                .padding(.horizontal, 20)
                .padding(6).scaleEffect(x: 1.1, y: 1.1, anchor: UnitPoint.center)
            }
            HStack (spacing: 100){
                Button(action: {
                           self.one = ""
                           self.two = ""
                           self.three = ""
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
            }.padding()
            
            HStack {
                Image("icons8-coin-48")
                Text("\(self.coin)")
                    .font(.title)
            }.offset(x: 120, y: -10)
            
            }.edgesIgnoringSafeArea(.all).padding(30).offset(y: 30)
        
   
    }
}

struct chord_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
