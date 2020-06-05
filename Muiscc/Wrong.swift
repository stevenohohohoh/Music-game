//
//  Wrong.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/06/05.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct Wrong: View {
    @Binding var status: Int
    
    var body: some View {
       ZStack() {
            Image("51-515337_x-mark-png-png-download-transparent-background-red")
                .scaleEffect(0.3)
            
            Button(action: {
                self.status = 1
            }) {
                Text("Next")
                .font(.system(size: 30))
                .fontWeight(.semibold)
        
            }.offset(x: 90, y: 360)
        }
    }
}

struct Wrong_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
