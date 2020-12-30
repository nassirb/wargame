//
//  Viking.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Viking: Character {
    override init(name: String = "Vikings", health: Int = 60, tool: Tool = Axe()){
        super.init(name: name, health: health, tool: tool)
    }
}
