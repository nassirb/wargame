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
    
    static func notValidPlayerName(){
        print("Désolé ce nom est déja choisi choisissez en un autre :")
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
    
    static func playerTeam(player :  Player){
        print("\(player.name) choisissez parmis votre équipe un joueur"
            + "\n1. \(player.characters.map(\.name)[0]) et son score life est de : \(player.characters.map(\.health)[0])"
            + "\n2. \(player.characters.map(\.name)[1]) et son score life est de : \(player.characters.map(\.health)[1])"
            + "\n3. \(player.characters.map(\.name)[2]) et son score life est de : \(player.characters.map(\.health)[2])")
    }
    static func enemiTeam(playerAttacked :  Player){
        print("Choisissez maintenant parmis l'enemi, celui qui subira l'action"
            + "\n1. \(playerAttacked.characters.map(\.name)[0]) et son score life est de : \(playerAttacked.characters.map(\.health)[0])"
            + "\n2. \(playerAttacked.characters.map(\.name)[1]) et son score life est de : \(playerAttacked.characters.map(\.health)[1])"
            + "\n3. \(playerAttacked.characters.map(\.name)[2]) et son score life est de : \(playerAttacked.characters.map(\.health)[2])")
    }
    
    static func characterAttacking(characterAttacking : Character){
        print("Vous avez choisi le personage suivant:" , characterAttacking.name ,", pour aller au front")
    }
    
    static func characterAttaked(characterAttacked : Character){
        print("Vous avez ciblé le personnage suivant:" , characterAttacked.name ,", pour subir l'action")
    }
    
    static func attackedDead(){
        print("Désolé, le personnage ciblé est déjà mort, choisissez en un autre !")
    }
    
    static func attackingDead(){
        print("Désolé, choisissez un autre combattant, celui ci n'est plus opérationel !")
    }
    static func finishGame(){
        print("La partie est fini. Voici les statistiques de la partie:")
    }
    static func announcWinner(ft : Int, st : Int){
        if ft > st {
            print("L'équipe GAGNANTE est l'équipe 1 BRAVO !")
        } else if st > ft{
            print("L'équipe GAGNANTE est l'équipe 2 BRAVO !")
        } else{
            print("Il semble que les deux équipes ont fait un combat équilibré aucune équipe n'en sort victorieuse")
        }
    }
}
