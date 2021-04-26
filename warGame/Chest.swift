//
//  Chest.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Chest {
    func getNewWeapon() -> Weapon {
        let axe = Weapon(name: "axe", damage: 5)
        let gun = Weapon(name: "gun", damage: 10)
        let bomb = Weapon(name: "bomb", damage: 15)
        var weapons: [Weapon] = []
        
        weapons.append(axe)
        weapons.append(gun)
        weapons.append(bomb)
        
        return weapons.randomElement()!
    }
}
