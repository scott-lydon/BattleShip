//
//  Ship.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/11/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import UIKit

enum Ship: String {
    case destroyer
    case cruiser
    case submarine
    case carrier
    case battleship
    
    var length: Int {
        switch self {
        case .destroyer: return 2
        case .cruiser: return 3
        case .submarine: return 3
        case .carrier: return 5
        case .battleship: return 4
        }
    }
}

