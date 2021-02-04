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
            
            let names = players.map(\.name)
            var isValid = false
            
            while !isValid {
                print("Entrez le nom du Joueur \(n)")
                if let playerName = readLine(){
                    nameOfPlayer = playerName
                    isValid = !names.contains(playerName)
                }
            }
            print("Bienvenu dans le champ de bataille '\(nameOfPlayer)', composez votre equipe de 3 combattants")
            
            Print.listOfCharacters()
            
            while teamCharacters.count < 3 {
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
        
        print("Voici les joueurs  et les differrents personnages:"
            + "\n-Joueur 1"
            + "\n\(playerOne)"
            + "\nEt voici son équipe"
            + "\n\(teamOne)"
            + "\n====================="
            + "\n-Joueur 2"
            + "\n\(plyaertwo)"
            + "\nEt voici son équipe"
            + "\n\(teamTwo)")
        
        print("Avis au \(n) équipes ! RESTEZ EN ALERTE LE COMBAT VA COMMENCER")
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
        
        while (firstTeamLife > 0) || secondTeamLife > 0 {
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
                }
            }
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
                }
            }
        }
        
    }
    
    func endBattle(){
    }
}
