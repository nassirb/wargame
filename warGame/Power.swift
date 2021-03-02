//
//  Tool.swift
//  warGame
//
//  Created by Nassir Bouredenna on 23/11/2020.
//

import Foundation

class Power {
    var name: String
    var damage: Int
    var heal: Int
    
    init(name: String, damage: Int , heal: Int) {
        self.name = name
        self.damage = damage
        self.heal = heal
    }
}
