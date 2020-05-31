//
//  array .swift
//  Muiscc
//
//  Created by Steven Oh on 2020/05/30.
//  Copyright © 2020 Steven Oh. All rights reserved.
//

import Foundation

let pickerValue: Array = ["a", "b", "c", "d", "e", "f", "g"]

func randomItem(num: Int) -> Array<String>
{
  var resultSet = Set<String>()

  while resultSet.count < num{
      let randomIndex = Int(arc4random_uniform(UInt32(pickerValue.count)))
      resultSet.insert(pickerValue[randomIndex])
  }

  let resultArray = Array(resultSet)

  return(resultArray)
}


func rScale(num: Int)-> Array<String>{
    var n = num
    var array = [String]()
    while n > 0{
        array.append(pickerValue.randomElement()!)
        n -= 1
    }
    return array
}
