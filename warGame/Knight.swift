//
//  Knight.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Knight: Character {
    override init(name: String = "Chevalier", health: Int = 90,power: Power  = Sword()){
        super.init(name: name, health: health, power: power)
    }
}
