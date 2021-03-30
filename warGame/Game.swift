//
//  Game.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Game {
    var players: [Player] = []
    private var firstTeamLife: Int {
        players[0].characters.map(\.health).reduce(0, +)
    }
    private var secondTeamLife: Int {
        players[1].characters.map(\.health).reduce(0, +)
    }
    private var playerOne: String{
        players.map(\.name)[0]
    }
    private var playerTwo: String{
        players.map(\.name)[1]
    }
    var r : Int = 0
//    var deadPlayers: [Character] = []
    
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
                    nameOfPlayer = playerName.uppercased()
                    isValid = !names.contains(playerName.uppercased())
                    if names.contains(playerName.uppercased()) {
                        Print.notValidPlayerName()
                    }
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
        
        
        Print.lines()
        Print.playersList(playerOne : playerOne , teamOne : teamOne , playerTwo : playerTwo , teamTwo : teamTwo)
        Print.lines()
        Print.lineBreak()
        Print.alertStart(n : n)
        Print.lineBreak()
    }
    
    func startBattle(){
        Print.TeamOneLife(firstTeamLife : firstTeamLife)
        Print.TeamTwoLife(secondTeamLife : secondTeamLife)
        
        Print.lines()
        
        while firstTeamLife > 0 && secondTeamLife > 0 {
            r+=1
             
            Print.TeamOneLife(firstTeamLife : firstTeamLife)
            Print.TeamTwoLife(secondTeamLife : secondTeamLife)
            Print.lineBreak()
            for player in players {
                print(firstTeamLife)
                print(secondTeamLife)
                var isValidFirstChoice =  false
                var characterAttacking: Character!
                while !isValidFirstChoice {
                    Print.lineBreak()
                    Print.playerTeam(player : player)
                    if let characterChoice = readLine(), let myChoice = Int(characterChoice) {
                        if myChoice <= 3 {
                            switch myChoice {
                            case 1:
                                characterAttacking = player.characters[0]
                                if characterAttacking.health <= 0 {
                                    Print.attackingDead()
                                } else{
                                    Print.characterAttacking(characterAttacking : characterAttacking)
                                }
                            case 2:
                                characterAttacking = player.characters[1]
                                if characterAttacking.health <= 0 {
                                    Print.attackingDead()
                                } else{
                                    Print.characterAttacking(characterAttacking : characterAttacking)
                                }
                            case 3:
                                characterAttacking = player.characters[2]
                                if characterAttacking.health <= 0 {
                                    Print.attackingDead()
                                } else{
                                    Print.characterAttacking(characterAttacking : characterAttacking)
                                }
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
                var characterAttacked: Character!
                var isValidSecondChoice =  false
                while !isValidSecondChoice {
                    Print.lineBreak()
                    Print.enemiTeam(playerAttacked : playerAttacked)
                    if let enemiChoice = readLine(), let myChoice = Int(enemiChoice) {
                        if myChoice <= 3 {
                            switch myChoice {
                            case 1:
                                characterAttacked = playerAttacked.characters[0]
                                if characterAttacked.health <= 0 {
                                    Print.attackedDead()
                                } else{
                                    characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                                    Print.characterAttaked(characterAttacked : characterAttacked)
                                }
                            case 2:
                                characterAttacked = playerAttacked.characters[1]
                                if characterAttacked.health <= 0 {
                                    Print.attackedDead()
                                } else{
                                    characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                                    Print.characterAttaked(characterAttacked : characterAttacked)
                                }
                            case 3:
                                characterAttacked = playerAttacked.characters[2]
                                if characterAttacked.health <= 0 {
                                    Print.attackedDead()
                                } else{
                                    characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                                    Print.characterAttaked(characterAttacked : characterAttacked)
                                }
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
        if firstTeamLife <= 0 || secondTeamLife <= 0 {
            endBattle()
        }
    }
    
    func endBattle(){
        Print.finishGame()
        Statistics.countRound(r: r)
        Statistics.scoreTeams(ft: firstTeamLife, fp: playerOne, st: secondTeamLife, sp: playerTwo)
        Print.announcWinner(ft : firstTeamLife , st : secondTeamLife)
    }
}
