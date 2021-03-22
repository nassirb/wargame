//
//  Soldier.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Soldier: Character {
    override init(name: String = "Soldat", health: Int = 110, power: Power = Shotgun()){
        super.init(name: name, health: health, power: power)
    }
}
