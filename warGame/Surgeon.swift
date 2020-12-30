//
//  Surgeon.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Surgeon: Character {
    override init(name: String = "Chirurgien", health: Int = 100, tool: Tool = Anesthesia()){
        super.init(name: name, health: health, tool: tool)
    }
}
