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
        return axe
    }
}
