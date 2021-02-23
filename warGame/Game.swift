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
                Print.enterPlayerName(n : n)
                if let playerName = readLine(){
                    nameOfPlayer = playerName
                    isValid = !names.contains(playerName)
                }
            }
            Print.lineBreak()
            Print.welcomePlayerName(nameOfPlayer : nameOfPlayer)
            Print.lineBreak()
            Print.listOfCharacters()
            
            while teamCharacters.count < 3 {
                
                Print.lineBreak()
                Print.chooseCharacter(teamCharacters : teamCharacters)
                
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
        let teamOne = Array(persos[..<midpoint])
        let teamTwo = Array(persos[midpoint...])
        
        let playerOne = players.map(\.name)[0]
        let playerTwo = players.map(\.name)[1]
        
        Print.lines()
        Print.playersList(playerOne : playerOne , teamOne : teamOne , playerTwo : playerTwo , teamTwo : teamTwo)
        Print.lines()
        Print.lineBreak()
        Print.alertStart(n : n)
        Print.lineBreak()
    }
    
    func startBattle(){
        let firstTeamLife = players.map(\.characters)[0].map(\.health).reduce(0, +)
        Print.TeamOneLife(firstTeamLife : firstTeamLife)
        
        let secondTeamLife = players.map(\.characters)[1].map(\.health).reduce(0, +)
        Print.TeamTwoLife(secondTeamLife : secondTeamLife)
        
        Print.lines()
        
        while firstTeamLife > 0 || secondTeamLife > 0 {
            Print.lineBreak()
            for player in players {
                var isValidFirstChoice =  false
                var characterAttaking: Character!
                while !isValidFirstChoice {
                    Print.lineBreak()
                    Print.playerTeam(player : player)
                    if let characterChoice = readLine(), let myChoice = Int(characterChoice) {
                        if myChoice <= 3 {
                            switch myChoice {
                            case 1:
                                characterAttaking = player.characters[0]
                                Print.characterAttaking(characterAttaking : characterAttaking)
                            case 2:
                                characterAttaking = player.characters[1]
                                Print.characterAttaking(characterAttaking : characterAttaking)
                            case 3:
                                characterAttaking = player.characters[2]
                                Print.characterAttaking(characterAttaking : characterAttaking)
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
                let playerAttacked = players.filter { $0.name != player.name}.first!
                var isValidSecondChoice =  false
                while !isValidSecondChoice {
                    Print.lineBreak()
                    Print.enemiTeam(playerAttacked : playerAttacked)
                    if let enemiChoice = readLine(), let myChoice = Int(enemiChoice) {
                        if myChoice <= 3 {
                            switch myChoice {
                            case 1:
                                let characterAttacked = playerAttacked.characters[0]
                                characterAttacked.attacked()
                                Print.characterAttaked(characterAttacked : characterAttacked)
                            case 2:
                                let characterAttacked = playerAttacked.characters[1]
                                characterAttacked.attacked()
                                Print.characterAttaked(characterAttacked : characterAttacked)
                            case 3:
                                let characterAttacked = playerAttacked.characters[2]
                                characterAttacked.attacked()
                                Print.characterAttaked(characterAttacked : characterAttacked)
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
        
    }
    
    func endBattle(){
    }
}
