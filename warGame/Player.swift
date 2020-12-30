//
//  Player.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Player {
    let name: String
    var characters: [Character]
    
    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
}
