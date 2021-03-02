//
//  Shaman.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Shaman: Character {
    override init(name: String = "Chaman", health: Int = 100, power: Power = Gem()){
        super.init(name: name, health: health, power: power)
    }
}
