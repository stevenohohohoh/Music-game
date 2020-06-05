//
//  accelerometer.swift
//  Muiscc
//
//  Created by Steven Oh on 2020/06/03.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import SwiftUI

import CoreMotion

struct accelerometer: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct accelerometer_Previews: PreviewProvider {
    static var previews: some View {
        accelerometer()
    }
}

var motionManager: CMMotionManager!

func accel(){
    motionManager = CMMotionManager()
    motionManager.startAccelerometerUpdates()
    if let accelerometerData = motionManager.accelerometerData {
        print(accelerometerData)
    }
}
