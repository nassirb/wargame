//
//  Drug.swift
//  warGame
//
//  Created by Nassir Bouredenna on 23/11/2020.
//

import Foundation

class Drug: Tool {
    var heal: Int
    
    init(name: String, heal: Int) {
        self.heal = heal
        super.init(name: name)
    }
}
