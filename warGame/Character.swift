//
//  Character.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Character {
    var name: String
    var health: Int
    var tool: Tool
    
    init(name: String, health: Int, tool: Tool) {
        self.name = name
        self.health = health
        self.tool = tool
    }
    
    func fight(){
    }
    
    func heal() {
    }
}
