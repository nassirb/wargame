//
//  Weapon.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Weapon: Tool {
    var damage: Int
    
    init(name: String, damage: Int) {
        self.damage = damage
        super.init(name: name)
    }
}
