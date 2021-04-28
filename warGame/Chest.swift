//
//  Chest.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Chest {
    static func getNewWeapon() -> Weapon? {
        let axe = Weapon(name: "axe", damage: 5)
        let gun = Weapon(name: "gun", damage: 10)
        let bomb = Weapon(name: "bomb", damage: 15)
        let weapons: [Weapon] = [axe, gun, bomb]
        
        if canGetNewItem(){
            return weapons.randomElement()!
        } else {
            return nil
        }
        
    }
    private static func canGetNewItem() -> Bool {
        let randomNumber = (1...5).randomElement()
        
        return randomNumber == 3
    }
}
