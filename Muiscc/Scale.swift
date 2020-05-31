//
//  Scale.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/30.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

//
//  chord.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/29.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI



struct Scale: View {
    @Binding var status: Int
    @Binding var Scurrent: Array<String>
    @Binding var Index: Int
    @Binding var answer: Bool
    @Binding var coin: Int
    
    
    
    
    @State private var user: String = ""
    @State private var pickerValue: Array = ["a", "b", "c", "d", "e", "f", "g"]
        
    @State private var isAlert = false
    
    
    let characterLimit = 6
    var body: some View {
        
        VStack(spacing: 30){
            

            TextField("lowercase or uppercase are fine", text: $user)
//                .disabled(entry > (characterLimit - 1))
                .keyboardType(.alphabet)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange, lineWidth: 2)
                )
            
            
            
            
            
            Button(action: {
                GSAudio.sharedInstance.playSounds(soundFileNames: self.Scurrent,withDelay: 0.3)
            }){
                HStack {
                    Image("icons8-music-record-60")
                  
                    Text("Play Scale")
                    .font(.system(size: 20))
                }.frame(minWidth: 0, maxWidth: 700)
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
                            Text("Slower - 50 Coins")
                                .font(.system(size: 20))
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                        .padding(.horizontal, 20)
                        .padding(3).scaleEffect(x: 1.1, y: 1.1, anchor: UnitPoint.center)
                    }.alert(isPresented: $isAlert) { () -> Alert in
                        
                    Alert(title: Text("Purchase"), message: Text("Are you sure you want to play it slowly for 50 coins?"), primaryButton: .default(Text("Yes"), action: {
                        
                        if self.coin > 10{
                            GSAudio.sharedInstance.playSounds(soundFileNames: self.Scurrent, withDelay: 0.8)
                            self.coin -= 50
                            UserDefaults.standard.set(self.coin, forKey: "coin")

                        }
            
                    }), secondaryButton: .default(Text("No")))
                    }
           
            
            
            
            
            Button(action:{

                self.status = 7
                let trimmedString = self.user.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                let array = trimmedString.map( { String($0) })
                
                if array.elementsEqual(self.Scurrent){
                    self.answer = true
                    self.coin += 50
                    UserDefaults.standard.set(self.coin, forKey: "coin")
                }
                else{
                    self.answer = false
                }

                print(self.Scurrent)
       
                
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

struct Scale_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




class TextBindingManager: ObservableObject {
    @Published var text = "" {
        didSet {
            if text.count > characterLimit && oldValue.count <= characterLimit {
                text = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int = 5){
        characterLimit = limit
    }
}
