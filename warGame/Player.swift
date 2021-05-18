//
//  Player.swift
//  warGame
//
//  Created by Nassir Bouredenna on 10/11/2020.
//

import Foundation

class Player {
    let name: String
    var characters: [Character]
    var charactersTotalHealth: Int {
        characters.map(\.health).reduce(0, +)
    }
    
    init(name: String, characters: [Character]) {
        self.name = name
        self.characters = characters
    }
    
    static func getCharacters() -> [Character]{
        Print.listOfCharacters()
        
        var teamCharacters: [Character] = []
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
        return teamCharacters
    }
    
    func isLastCharacterHealer () -> Bool {
        let characterCount = characters.filter { $0.health != 0}.count == 1
        if characterCount {
            let lastCharacter = characters.filter { $0.health != 0}.first
            if lastCharacter!.name == "Chirurgien" || lastCharacter!.name == "Infirmier" || lastCharacter!.name == "Chaman" {
                return true
            }
        }
        return false
    }
    
}
