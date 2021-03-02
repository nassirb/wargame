//
//  Weapon.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Weapon: Power {
    
    init(name: String, damage: Int) {
        super.init(name: name, damage: damage ,heal: 0)
    }
}
