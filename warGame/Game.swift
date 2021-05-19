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
        players[0].charactersTotalHealth
    }
    private var secondTeamLife: Int {
        players[1].charactersTotalHealth
    }
    private var playerOne: String {
        players.map(\.name)[0]
    }
    private var playerTwo: String {
        players.map(\.name)[1]
    }
    var round : Int = 0
    
    func choosePlayer() {
        var n = 0
        var nameOfPlayer = ""
        
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
            
            var teamCharacters = Player.getCharacters()
            
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
    
    func startBattle() {
        Print.lines()
        
        while firstTeamLife > 0 && secondTeamLife > 0 && !players[0].isLastCharacterHealer() && !players[1].isLastCharacterHealer(){
            round+=1
            
            for player in players {
                
                Print.lines()
                Print.TeamOneLife(firstTeamLife : firstTeamLife)
                Print.TeamTwoLife(secondTeamLife : secondTeamLife)
                Print.lineBreak()
                
                let characterAttacking = chooseAttackingCharacter(player: player)
                if characterAttacking.name == "Chirurgien" || characterAttacking.name == "Infirmier" || characterAttacking.name == "Chaman" {
                    chooseHealingCharacter(characterAttacking: characterAttacking, player: player)
                } else {
                    chooseAttackedCharacter(characterAttacking: characterAttacking, player: player)
                }
                
                if firstTeamLife == 0 || secondTeamLife == 0 || players[0].isLastCharacterHealer() || players[1].isLastCharacterHealer() {
                    print("Vous n'avez plus de Combattant ,ou alors il ne reste qu'un ou des Guerrisseur(s)")
                    break
                }
            }
            
        }
        endBattle()
    }
    
    private func chooseAttackingCharacter(player : Player) -> Character {
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
                        } else {
                            Print.characterAttacking(characterAttacking : characterAttacking)
                            isValidFirstChoice = true
                        }
                    case 2:
                        characterAttacking = player.characters[1]
                        if characterAttacking.health <= 0 {
                            Print.attackingDead()
                        } else {
                            Print.characterAttacking(characterAttacking : characterAttacking)
                            isValidFirstChoice = true
                        }
                    case 3:
                        characterAttacking = player.characters[2]
                        if characterAttacking.health <= 0 {
                            Print.attackingDead()
                        } else {
                            Print.characterAttacking(characterAttacking : characterAttacking)
                            isValidFirstChoice = true
                        }
                    default:
                        Print.notUnderstood()
                    }
                    if characterAttacking.name == "Chirurgien" || characterAttacking.name == "Infirmier" || characterAttacking.name == "Chaman" {
                        break
                    }else{
                        openingChest(characterAttacking : characterAttacking)
                    }
                } else {
                    Print.notUnderstood()
                }
            }
        }
        return characterAttacking
    }
    
    private func chooseAttackedCharacter (characterAttacking : Character, player : Player) {
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
                        } else {
                            characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                            Print.characterAttaked(characterAttacked : characterAttacked)
                            isValidSecondChoice = true
                        }
                    case 2:
                        characterAttacked = playerAttacked.characters[1]
                        if characterAttacked.health <= 0 {
                            Print.attackedDead()
                        } else {
                            characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                            Print.characterAttaked(characterAttacked : characterAttacked)
                            isValidSecondChoice = true
                        }
                    case 3:
                        characterAttacked = playerAttacked.characters[2]
                        if characterAttacked.health <= 0 {
                            Print.attackedDead()
                        } else {
                            characterAttacked.inflictDamage(damage: characterAttacking.power.damage)
                            Print.characterAttaked(characterAttacked : characterAttacked)
                            isValidSecondChoice = true
                        }
                    default:
                        Print.notUnderstood()
                    }
                } else {
                    Print.notUnderstood()
                }
            }
        }
    }
    
    private func chooseHealingCharacter (characterAttacking : Character, player : Player) {
        var characterHealed: Character!
        var isValidThirdChoice =  false
        
        while !isValidThirdChoice {
            Print.lineBreak()
            Print.healerTeam(player : player)
            
            if let enemiChoice = readLine(), let myChoice = Int(enemiChoice) {
                if myChoice <= 3 {
                    switch myChoice {
                    case 1:
                        characterHealed = player.characters[0]
                        if characterHealed.health <= 0 {
                            Print.attackedDead()
                        } else {
                            characterHealed.applyHealing(heal: characterAttacking.power.heal)
                            Print.characterHealed(characterHealed : characterHealed)
                            isValidThirdChoice = true
                        }
                    case 2:
                        characterHealed = player.characters[1]
                        if characterHealed.health <= 0 {
                            Print.attackedDead()
                        } else {
                            characterHealed.applyHealing(heal: characterAttacking.power.heal)
                            Print.characterHealed(characterHealed : characterHealed)
                            isValidThirdChoice = true
                        }
                    case 3:
                        characterHealed = player.characters[2]
                        if characterHealed.health <= 0 {
                            Print.attackedDead()
                        } else {
                            characterHealed.applyHealing(heal: characterAttacking.power.heal)
                            Print.characterHealed(characterHealed : characterHealed)
                            isValidThirdChoice = true
                        }
                    default:
                        Print.notUnderstood()
                    }
                } else {
                    Print.notUnderstood()
                }
            }
        }
    }
    
    private func openingChest(characterAttacking : Character) {
        if randomItemChest() {
            Print.lines()
            Print.chestApear()
            let characterAttacking: Character! = characterAttacking
            
            if let acceptChest = readLine(), let myChoice = Int(acceptChest) {
                if myChoice <= 2 {
                    switch myChoice {
                    case 1:
                        Print.acceptChestChoice()
                        if let weapon = Chest.getNewWeapon() {
                            characterAttacking.updateWeapon(newWeapon: weapon)
                            return Print.newWeapon(weapon: weapon)
                        }
                    case 2:
                        Print.refuseChestChoice()
                    default:
                        Print.notUnderstood()
                    }
                } else {
                    Print.notUnderstood()
                }
            }
        } else {
            return
        }
    }
    private func randomItemChest() -> Bool {
        let randomNumberChest = (1...6).randomElement()
        return randomNumberChest == 2
    }
    
    func endBattle() {
        Print.lines()
        Print.finishGame()
        Print.countRound(round: round)
        Print.lines()
        Print.scoreTeams(firsTeam: firstTeamLife, firstPlayer: playerOne, secondTeam: secondTeamLife, secondPlayer: playerTwo)
        Print.lines()
        Print.playerTwoTeam(player: players[0])
        Print.lines()
        Print.playerTwoTeam(player: players[1])
        Print.lines()
        Print.announcWinner(firsTeam : firstTeamLife , secondTeam : secondTeamLife)
        Print.lines()
    }
}
