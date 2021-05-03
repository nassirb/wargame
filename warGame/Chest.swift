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
