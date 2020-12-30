//
//  Gem.swift
//  warGame
//
//  Created by Nassir Bouredenna on 23/11/2020.
//

import Foundation

class Gem: Drug {
    override init(name: String = "Potion", heal: Int = 80) {
        super.init(name: name, heal: heal)
    }
}
