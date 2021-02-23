//
//  Print.swift
//  warGame
//
//  Created by Nassir Bouredenna on 15/12/2020.
//

import Foundation

class Print {
    static func listOfCharacters() {
        
        print("Choisissez parmis la liste des personnages suivant:"
            + "\n1.  Vikings"
            + "\n2.  Chevallier"
            + "\n3.  Archer"
            + "\n4.  Soldat"
            + "\n5.  Chaman"
            + "\n6.  Chirurgien"
            + "\n7.  Infirmier")
    }
    
    static func vikingCharcter() {
        print("Vikings fait parti de votre troupe continuez votre composition")
    }
    static func knightCharcter() {
        print("Chevalier fait parti de votre troupe continuez votre composition")
    }
    static func bowmanCharcter() {
        print("Archer fait parti de votre troupe continuez votre composition")
    }
    static func soldierCharcter() {
        print("Soldat fait parti de votre troupe continuez votre composition")
    }
    static func shamanCharcter() {
        print("Chaman fait parti de votre troupe continuez votre composition")
    }
    static func surgeonCharcter() {
        print("Chirurgien fait parti de votre troupe continuez votre composition")
    }
    static func nurseCharcter() {
        print("Infirmier fait parti de votre troupe continuez votre composition")
    }
    static func notUnderstood() {
        print("Je n'est pas compris votre choix réssayez")
    }
    
    
    static func congratTeamCompo() {
        print("*********************************************************"
            + "\nBravo vous avez composé votre équipe ! Préparez vous pour la bataille")
    }
    
    static func lines() {
        print(" " + "\n========================================================================================" + "\n========================================================================================" + "\n ")
    }
    
    static func lineBreak() {
        print(" ")
    }
    
    static func playersList(playerOne: String, teamOne: [String], playerTwo: String, teamTwo: [String]) {
        print("Voici les joueurs  et les differrents personnages:"
            + "\n 1"
            + "\n-Joueur 1"
            + "\nSon Nom: \(playerOne)"
            + "\nEt voici son équipe"
            + "\n\(teamOne)"
            + "\n "
            + "\n====================="
            + "\n====================="
            + "\n "
            + "\n-Joueur 2"
            + "\nSon Nom: \(playerTwo)"
            + "\nEt voici son équipe"
            + "\n\(teamTwo)")
    }
    
    static func welcomePlayerName(nameOfPlayer : String) {
        print("Bienvenu dans le champ de bataille '\(nameOfPlayer)', composez votre equipe de 3 combattants")
    }
    
    static func enterPlayerName(n : Int){
        print("Entrez le nom du Joueur \(n)")
    }
    
    static func chooseCharacter(teamCharacters : [Character]){
        print("Entrez le numero du  personnage \(teamCharacters.count + 1)")
    }
    
    static func alertStart(n : Int){
        print("Avis au \(n) équipes ! RESTEZ EN ALERTE LE COMBAT VA COMMENCER")
    }
    
    static func TeamOneLife (firstTeamLife : Int) {
        print("Equipe 1 votre score est éstimé à : \(firstTeamLife) points de vie")
    }
    
    static func TeamTwoLife (secondTeamLife : Int) {
        print("Equipe 2 votre score est éstimé à : \(secondTeamLife) points de vie")
    }
}
