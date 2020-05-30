//
//  chordfinish.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/29.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct chordfinish: View {
    @Binding var status: Int
    @Binding var current: Array<String>
    @State var Index: Int
    @Binding var answer: Bool

    
    var body: some View {
        VStack(spacing: 20){
            if answer{
                Text("Nice")
                .font(.system(size: 30))
                    .foregroundColor(Color.green)

            }else{
                Text("oops")
                .font(.system(size: 30))
                    .foregroundColor(Color.red)
            }
            
            Text("the correct answer was \(self.current[0]), \(self.current[1]), \(self.current[2]),")
                .multilineTextAlignment(.center).padding()
            
            
            
            HStack(spacing: 20) {
                Button(action: {
                    self.status = 4
                    self.current = randomItem(num: 3)
                }) {
                    Text("try again")
                    .font(.system(size: 30))
                    
                }
                Button(action:{
                    self.status = 3
                    self.current = randomItem(num: 3)
                }){
                    Text("Menu")
                    .font(.system(size: 30))
                    
                }
            }
            
            

        }
    }
}

struct chordfinish_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
