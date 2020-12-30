//
//  Knight.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Knight: Character {
    override init(name: String = "Chevalier", health: Int = 90, tool: Tool = Sword()){
        super.init(name: name, health: health, tool: tool)
    }
}
