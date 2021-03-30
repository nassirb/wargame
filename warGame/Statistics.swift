//
//  Statistics.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Statistics {
    static func countRound(r : Int) {
            print("La bataille c'est déroulé en \(r) rounds")
    }
    static func scoreTeams(ft : Int, fp: String, st : Int, sp: String) {
        print("Equipe 1 commandée par le Caporal Chef \(fp) son score est éstimé à : \(ft) points de vie"
        + "\nEquipe 2 commandée par le Caporal Chef \(sp) son score est éstimé à : \(st) points de vie")
    }
}
