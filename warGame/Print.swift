//
//  Print.swift
//  warGame
//
//  Created by Nassir Bouredenna on 15/12/2020.
//

import Foundation

class Print {
    static func listOfCharacters() {
        
        print("Entrez le numero du Personnage"
            + "\n1.  Vikings"
            + "\n2.  Chevallier"
            + "\n3.  Archer"
            + "\n4.  Soldat"
            + "\n5.  Chaman"
            + "\n6.  Chirurgien"
            + "\n7.  Infirmier")
    }
    
    static func vikingCharcter() {
        print("Vikings fait parti de votre troupe continuer votre composition")
    }
    static func knightCharcter() {
        print("Chevalier fait parti de votre troupe continuer votre composition")
    }
    static func bowmanCharcter() {
        print("Archer fait parti de votre troupe continuer votre composition")
    }
    static func soldierCharcter() {
        print("Soldat fait parti de votre troupe continuer votre composition")
    }
    static func shamanCharcter() {
        print("Chaman fait parti de votre troupe continuer votre composition")
    }
    static func surgeonCharcter() {
        print("Chirurgien fait parti de votre troupe continuer votre composition")
    }
    static func nurseCharcter() {
        print("Infirmier fait parti de votre troupe continuer votre composition")
    }
    static func notUnderstood() {
        print("Je n'est pas compris")
    }
    
    
    static func congratTeamCompo() {
        print("Bravo vous aver composer votre équipe ! Préparer vous pour la bataille")
    }
}
