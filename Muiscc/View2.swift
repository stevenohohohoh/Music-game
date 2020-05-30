//
//  View2.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/28.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct View2: View{
    @Binding var status: Int
    @Binding var answer: Bool
    @Binding var gameCount: Int
    @Binding var point: Int
    @Binding var coin: Int
    
    var body: some View{
        
        VStack{
            
            Button(action: {
                    self.status = 1
                    self.point = 0
                self.gameCount = 1
                }) {

                Text("Retry")
                    .font(.system(size: 30))
            }
            
           Text("You got \(self.point) point, so \(self.point*10) coins")
            .font(.system(size: 30))
            .padding()
            .multilineTextAlignment(.center)
            
            Button(action: {
                self.status = 3
                self.point = 0
                self.gameCount = 1
               }){
                   Text("Menu")
                       .foregroundColor(Color.red)
            }.padding()
            
            
        }
        
        
    }
}

struct View2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
