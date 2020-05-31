//
//  Menu.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/28.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct Menu: View{
    @Binding var status: Int
    @Binding var coin: Int
    
    var body: some View{
        
        ZStack {

            //‎232, 216, 152
            Ellipse()
                .frame(width: 800, height: 700, alignment: .center)
                .offset(x: 0, y: -380)
                .foregroundColor(Color.orange)
                .opacity(0.8)
            
            
            Text("Guess the Key")
                .font(.system(size: 55))
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.white)
                .offset(y:-150)

            VStack{
                        Button(action: {
                            self.status = 1
                            
                        }) {
                            HStack {

                                Text("Single key")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .padding(.horizontal, 20)
                        }.padding(20).scaleEffect(x: 1.18, y: 1.4, anchor: UnitPoint.center)
                        Button(action: {
                            self.status = 6
                        }) {
                            HStack {

                                Text("Scale")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .padding(.horizontal, 20)
                        }.padding(20).scaleEffect(x: 1.18, y: 1.4, anchor: UnitPoint.center)
                        Button(action: {
                            self.status = 4
                        }) {
                            HStack {

                                Text("Chords")
                                    .fontWeight(.semibold)
                                    .font(.title)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .padding(.horizontal, 20)
                        }.padding(20).scaleEffect(x: 1.18, y: 1.4, anchor: UnitPoint.center)
                
                HStack {
                    Image("icons8-coin-48")
                    Text("\(self.coin)")
                        .font(.title)
                }.offset(x: 120)
                
                
                }.padding(190).offset(y: 180).frame(minWidth: 0, maxWidth: 750, minHeight: 0, maxHeight: 300, alignment: .center)

            
            
        }

    }
          
    
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
