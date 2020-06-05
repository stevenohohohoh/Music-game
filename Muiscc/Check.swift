//
//  Check.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/06/05.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

struct Check: View {
    @Binding var status: Int
    var body: some View {
        VStack(spacing: 20) {
            Image("unnamed")
            
            Button(action: {
                self.status = 1
            }) {
                Text("next")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                
                
            }.offset(x: 80, y: 190)
        }
    }
}

struct Check_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


