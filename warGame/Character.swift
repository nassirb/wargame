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
    var power: Power
    
    init(name: String, health: Int, power: Power) {
        self.name = name
        self.health = health
        self.power = power
    }
    
    func inflictDamage(damage: Int){
        if health <= 0 {
            return
        } else {
            health -= damage
        }
    }
    
    func applyHealing(heal: Int) {
        health -= heal
    }
}
