//
//  Drug.swift
//  warGame
//
//  Created by Nassir Bouredenna on 23/11/2020.
//

import Foundation

class Drug: Power {
    
    init(name: String, heal: Int) {
        super.init(name: name , damage: 0, heal: heal )
    }
}
