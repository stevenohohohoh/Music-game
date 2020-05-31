//
//  scalefinish.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/31.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct scalefinish: View {
        @Binding var status: Int
        @Binding var Scurrent: Array<String>
        @State var Index: Int
        @Binding var Sanswer: Bool
        @Binding var coin: Int

        
        var body: some View {
            VStack(spacing: 20){
                if Sanswer{
                    Text("Nice!! +50 coins!")
                    .font(.system(size: 30))
                        .foregroundColor(Color.green)
                    

                }else{
                    Text("oops")
                    .font(.system(size: 30))
                        .foregroundColor(Color.red)
                }
                
                Text("the correct answer was \(self.Scurrent[0]), \(self.Scurrent[1]), \(self.Scurrent[2]), \(self.Scurrent[3]), \(self.Scurrent[4]), \(self.Scurrent[5]),\(self.Scurrent[6])")
                    .multilineTextAlignment(.center).padding()
                
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        self.status = 4
                        self.Scurrent = rScale(num: 7)
                    }) {
                        Text("try again")
                        .font(.system(size: 30))
                        
                    }
                    Button(action:{
                        self.status = 3
                        self.Scurrent = rScale(num: 7)
                    }){
                        Text("Menu")
                        .font(.system(size: 30))
                        
                    }
                }
                
                

            }
        }
    }

struct scalefinish_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
