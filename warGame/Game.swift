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
            print("Entrez le nom du Joueur \(n)")
            let names = players.map(\.name)
            var isValid = false
            
            while !isValid {
                if let playerName = readLine(){
                    print("Bienvenu dans le champ de bataille '\(playerName)', composez votre equipe de 3 combattants")
                    nameOfPlayer = playerName
                    isValid = true
                } else {
                    if names.contains(nameOfPlayer){
                        isValid = false
                    }
                }
            }
            while teamCharacters.count < 3 {
                
                Print.listOfCharacters()
                
                if let playerChoice = readLine(), let choice = Int(playerChoice) {
                    if choice < 8 {
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
    }
    
    func endBattle(){
    }
}
