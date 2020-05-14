//
//  Rectangle.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Board {
    
    struct Rectangle {
        var width: Int
        var height: Int
        
        func contains(_ coordinate: Coordinate) -> Bool {
            return 0 <= coordinate.x && coordinate.x < height &&
                0 <= coordinate.y && coordinate.y < width
        }
    }
}
