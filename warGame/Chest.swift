//
//  Chest.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Chest {
    static func getNewWeapon() -> Weapon? {
        let axe = Weapon(name: "axe", damage: 50)
        let gun = Weapon(name: "gun", damage: 70)
        let bomb = Weapon(name: "bomb", damage: 100)
        let weapons: [Weapon] = [axe, gun, bomb]
        
        return weapons.randomElement()!
    }
}
