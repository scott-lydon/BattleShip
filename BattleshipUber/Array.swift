//
//  Array.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/14/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Array {

    func filterIn<T>(_ action: (Element) -> T) -> [T] {
        var elements: [T] = []
        for element in self {
            elements.append(action(element))
        }
        return elements
    }
}
