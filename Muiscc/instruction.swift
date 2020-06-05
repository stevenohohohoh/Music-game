//
//  instruction.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/31.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct instruction: View {
    
    @Binding var status: Int
    var body: some View {
        VStack{
            
            Text("This game will not")
            .font(.system(size: 30))
            .fontWeight(.semibold)

                .offset(y: 270)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.white)
            
            Text("use any sharps or flats")
            .font(.system(size: 30))
            .fontWeight(.semibold)
            .offset(y: 270)
            .multilineTextAlignment(.center)
            .foregroundColor(Color.white)
            
                
            
            Image("51351288-simple-piano-keyboard-showing-full-octave-of-notes-vector")
                .scaleEffect(0.4)
            
            Button(action: {self.status = 3}) {
                Text("Return")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
            }.offset(x: -120, y: -190)
            
            
        }.background(Color.orange)
    }
}


