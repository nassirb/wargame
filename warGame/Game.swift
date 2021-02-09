//
//  Game.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Game {
    var players: [Player] = []
    
    func choosePlayer(){
        var n = 0
        var nameOfPlayer = ""
        var teamCharacters: [Character] = []
        
        while n < 2 {
            n += 1
            
            
            Print.lines()
            let names = players.map(\.name)
            var isValid = false
            
            while !isValid {
                print("Entrez le nom du Joueur \(n)")
                if let playerName = readLine(){
                    nameOfPlayer = playerName
                    isValid = !names.contains(playerName)
                }
            }
            Print.lineBreak()
            print("Bienvenu dans le champ de bataille '\(nameOfPlayer)', composez votre equipe de 3 combattants")
            
            Print.lineBreak()
            Print.listOfCharacters()
            
            while teamCharacters.count < 3 {
                
                Print.lineBreak()
                print("Entrez le numero du  personnage \(teamCharacters.count + 1)")
                
                if let playerChoice = readLine(), let choice = Int(playerChoice) {
                    if choice <= 7 {
                        switch choice {
                        case 1:
                            teamCharacters.append(Viking())
                            Print.vikingCharcter()
                        case 2:
                            teamCharacters.append(Knight())
                            Print.knightCharcter()
                        case 3:
                            teamCharacters.append(Bowman())
                            Print.bowmanCharcter()
                        case 4:
                            teamCharacters.append(Soldier())
                            Print.soldierCharcter()
                        case 5:
                            teamCharacters.append(Shaman())
                            Print.shamanCharcter()
                        case 6:
                            teamCharacters.append(Surgeon())
                            Print.surgeonCharcter()
                        case 7:
                            teamCharacters.append(Nurse())
                            Print.nurseCharcter()
                        default:
                            Print.notUnderstood()
                        }
                    } else {
                        Print.notUnderstood()
                    }
                }
            }
            
            Print.lineBreak()
            Print.congratTeamCompo()
            print(teamCharacters.map(\.name))
            players.append(Player.init(name: nameOfPlayer, characters: teamCharacters))
            
            nameOfPlayer = ""
            teamCharacters = []
        }
        
        let persos = players.flatMap(\.characters).map(\.name)
        let midpoint = persos.count / 2
        let teamOne = persos[..<midpoint]
        let teamTwo = persos[midpoint...]
        
        let playerOne = players.map(\.name)[0]
        let plyaertwo = players.map(\.name)[1]
        
        Print.lines()
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
            + "\nSon Nom: \(plyaertwo)"
            + "\nEt voici son équipe"
            + "\n\(teamTwo)")
        
        Print.lines()
        Print.lineBreak()
        print("Avis au \(n) équipes ! RESTEZ EN ALERTE LE COMBAT VA COMMENCER")
        Print.lineBreak()
    }
    
    func startBattle(){
        let firstLifes = players.map(\.characters)[0].map(\.health);
        var firstTeamLife = 0
        for life in firstLifes {
            firstTeamLife += life
        }
        
        let secondLifes = players.map(\.characters)[1].map(\.health);
        var secondTeamLife = 0
        for life in secondLifes {
            secondTeamLife += life
        }
        
        Print.lines()
        
        while firstTeamLife > 0 || secondTeamLife > 0 {
            
            var isValidFirstChoice =  false
            while !isValidFirstChoice {
                Print.lineBreak()
                print("Choisissez parmis votre équipe un joueur"
                    + "\n1. \(players.map(\.characters)[0].map(\.name)[0])"
                    + "\n2. \(players.map(\.characters)[0].map(\.name)[1])"
                    + "\n3. \(players.map(\.characters)[0].map(\.name)[2])")
                
                if let characterChoice = readLine(), let myChoice = Int(characterChoice) {
                    if myChoice <= 3 {
                        switch myChoice {
                        case 1:
                            print("Vous avez choisi le personage suivant:" , players.map(\.characters)[0].map(\.name)[0] ,", pour aller au front")
                        case 2:
                            print("Vous avez choisi le personage suivant:" , players.map(\.characters)[0].map(\.name)[1] ,", pour aller au front")
                        case 3:
                            print("Vous avez choisi le personage suivant:" , players.map(\.characters)[0].map(\.name)[2] ,", pour aller au front")
                        default:
                            Print.notUnderstood()
                        }
                    } else{
                        Print.notUnderstood()
                    }
                    if myChoice <= 3 {
                        isValidFirstChoice = true
                    }
                }
            }
            
            var isValidSecondChoice =  false
            while !isValidSecondChoice {
                Print.lineBreak()
                print("Choisissez maintenant parmis l'enemi, celui qui subira l'action"
                    + "\n1. \(players.map(\.characters)[1].map(\.name)[0])"
                    + "\n2. \(players.map(\.characters)[1].map(\.name)[1])"
                    + "\n3. \(players.map(\.characters)[1].map(\.name)[2])")

                if let enemiChoice = readLine(), let myChoice = Int(enemiChoice) {
                    if myChoice <= 3 {
                        switch myChoice {
                        case 1:
                            print("Vous avez ciblé le personnage suivant:" , players.map(\.characters)[1].map(\.name)[0] ,", pour subir l'action")
                        case 2:
                            print("Vous avez ciblé le personage suivant:" , players.map(\.characters)[1].map(\.name)[1] ,", pour subir l'action")
                        case 3:
                            print("Vous avez ciblé le personage suivant:" , players.map(\.characters)[1].map(\.name)[2] ,", pour subir l'action")
                        default:
                            Print.notUnderstood()
                        }
                    } else{
                        Print.notUnderstood()
                    }
                    if myChoice <= 3 {
                        isValidSecondChoice = true
                    }

                }
            }
            
        }
        
    }
    
    func endBattle(){
    }
}
