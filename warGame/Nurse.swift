//
//  Nurse.swift
//  warGame
//
//  Created by Nassir Bouredenna on 21/11/2020.
//

import Foundation

class Nurse: Character {
    override init(name: String = "Infirmier", health: Int = 100, tool: Tool = Anodyne()){
        super.init(name: name, health: health, tool: tool)
    }
}
