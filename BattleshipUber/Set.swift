//
//  Set.swift
//  BattleShip
//
//  Created by Scott Lydon on 5/12/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension Set {
    mutating func inserts(_ newMembers: Array<Element>) {
        for member in newMembers {
            self.insert(member)
        }
    }
    
    mutating func inserts(_ newMembers: Set<Element>) {
        for member in newMembers {
            self.insert(member)
        }
    }
}
