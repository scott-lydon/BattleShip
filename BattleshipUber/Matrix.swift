//
//  Matrix.swift
//  BattleshipUber
//
//  Created by Scott Lydon on 5/13/20.
//  Copyright © 2020 Scott Lydon. All rights reserved.
//

import Foundation

extension RangeReplaceableCollection where Element: RangeReplaceableCollection {
    init(rows: Int, columns: Int, element: Element.Element) {
        self = .init(repeating: .init(repeating: element, count: columns), count: rows)
    }
}
