//
//  Bowman.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Bowman: Character {
    override init(name: String = "Archer", health: Int = 110, tool: Tool = Bow()){
        super.init(name: name, health: health, tool: tool)
    }
}
