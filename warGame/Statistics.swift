//
//  Statistics.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Statistics {
    static func countRound(round : Int) {
            print("La bataille c'est déroulé en \(round) rounds")
    }
    static func scoreTeams(firsTeam : Int, firstPlayer: String, secondTeam : Int, secondPlayer: String) {
        print("Equipe 1 commandée par le Caporal Chef \(firstPlayer) son score est éstimé à : \(firsTeam) points de vie"
        + "\nEquipe 2 commandée par le Caporal Chef \(secondPlayer) son score est éstimé à : \(secondTeam) points de vie")
    }
    static func announcWinner(firsTeam : Int, secondTeam : Int){
        if firsTeam > secondTeam {
            print("L'équipe GAGNANTE est l'équipe 1 BRAVO !")
        } else if secondTeam > firsTeam{
            print("L'équipe GAGNANTE est l'équipe 2 BRAVO !")
        } else{
            print("Il semble que les deux équipes ont fait un combat équilibré aucune équipe n'en sort victorieuse")
        }
    }
}
