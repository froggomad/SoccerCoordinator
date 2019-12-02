import UIKit

//Part 1:

//Arrays of individual attributes

var playerNames: [String] = [
    "Jack",
    "John",
    "Daisy",
    "Jasper",
    "Duke",
    "David",
    "Bob",
    "The Dude",
    "The Pro",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m"]

var height: [Int] = [
    60,
    48,
    59,
    46,
    42,
    50,
    49,
    60,
    75,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13]

var prevExp: [Bool] = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false]

var guardNames: [String] = [
    "Joseph Smith",
    "Jane Doe",
    "John Doe",
    "Jack Doe",
    "Billy Bob",
    "Thor Hammerfist",
    "Bob Sr.",
    "The Dudette",
    "The Giant",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m"]


//create dictionary with playerName as Key and playerAttributes as value
var players: [String: [Any]] = [:]

//counter
var i = 0
//i-1 to match iteration with array position
while i < playerNames.count {
    i += 1
    players[playerNames[i-1]] = [height[i-1], prevExp[i-1], guardNames[i-1]]
}

//Part 2:
//Collective team array (to keep track of count programatically)
var teams: [String] = ["dragons", "sharks", "raptors"]

//Individual team arrays
var dragons: [Any] = []
var sharks: [Any] = []
var raptors: [Any] = []


//Create Arrays of Experienced and Inexperienced Players
var expPlayers: [Any] = []
var newPlayers: [Any] = []

//init counter
i = 0
while i < playerNames.count {
    i += 1
    if prevExp[i-1] { //Add players to expPlayers
        expPlayers.append(playerNames[i-1])
    } else { // Add players to newPlayers
        newPlayers.append(playerNames[i-1])
    }
}


let numTeams = teams.count
//number of experienced players to add per team with no remainder
let numExpToAdd = expPlayers.count / numTeams
//remainder of experienced players to add per team
let expRemainder = expPlayers.count % numTeams
//number of inexperienced players to add per team with no remainder
let numNewToAdd = newPlayers.count / numTeams
//remainder of experienced players to add per team
let newRemainder = newPlayers.count % numTeams

//init counter
i = 0
//Add experienced players evenly by team
while dragons.count < numExpToAdd {
    i += 1
    dragons.append(expPlayers[i-1])
}
    
while sharks.count < numExpToAdd {
    i += 1
    sharks.append(expPlayers[i-1])
}
    
while raptors.count < numExpToAdd {
    i += 1
    raptors.append(expPlayers[i-1])
}

//handle leftover experienced players
while dragons.count < numExpToAdd + expRemainder && dragons.count <= sharks.count {
    i += 1
    dragons.append(expPlayers[i-1])
}

while sharks.count < numExpToAdd + expRemainder && i < expPlayers.count && sharks.count <= raptors.count{
    i += 1
    sharks.append(expPlayers[i-1])
}

while raptors.count < numExpToAdd + expRemainder && i < expPlayers.count {
    i += 1
    raptors.append(expPlayers[i-1])
}

//handle new players (keep teams.count even)
//init counter
i = 0
//team counts to track players already added for use in while loops (cant use teamName.count since the count property is being mutated in the loop)
var numDragons = dragons.count
var numSharks = sharks.count
var numRaptors = raptors.count

while dragons.count < numDragons + numNewToAdd {
    i += 1
    dragons.append(newPlayers[i-1])
}

while sharks.count < numSharks + numNewToAdd {
    i += 1
    sharks.append(newPlayers[i-1])
}

while raptors.count < numRaptors + numNewToAdd {
    i += 1
    raptors.append(newPlayers[i-1])
}
//init team counts for remainder calculation
numDragons = dragons.count
numSharks = sharks.count
numRaptors = raptors.count
//handle remainder of new players
while dragons.count < numDragons + numNewToAdd + newRemainder && dragons.count <= sharks.count {
    i += 1
    dragons.append(newPlayers[i-1])
}

while sharks.count < numSharks + numNewToAdd + newRemainder && i < newPlayers.count && sharks.count <= raptors.count{
    i += 1
    sharks.append(newPlayers[i-1])
}

while raptors.count < numRaptors + numNewToAdd + newRemainder && i < newPlayers.count {
    i += 1
    raptors.append(newPlayers[i-1])
}


//console output
print("Available Players: \(players.count) \n")
print("Experienced players: (\(expPlayers.count)):\(expPlayers) \n")
print("New players: (\(newPlayers.count)): \(newPlayers) \n")
print("Teams in league (\(numTeams)): \(teams) \n")
print("Number of experienced players to add to each team: \(expPlayers.count / numTeams) with a remainder of \(expPlayers.count % numTeams) \n")
print("Number of inexperienced players to add to each team: \(newPlayers.count / numTeams) with a remainder of \(newPlayers.count % numTeams) \n")
print("Assigned to Dragons:\(dragons) \n")
print("Assigned to Sharks:\(sharks) \n")
print("Assigned to Raptors:\(raptors) \n")
if players.count != raptors.count + dragons.count + sharks.count {
    print("Number of players assigned is wrong! \n")
} else {
    print("All players assigned \n")
}

//Part 3:
//iterate through each team and generate letter:

//strictly for console organization
print("Dragons:\n")
//init counter
i = 0
while i < dragons.count {
    i += 1
    var playerName: String = dragons[i-1] as! String //force cast due to type error
    print("Dear Mr./Mrs./Person \(players[playerName]![2]), your child, \(playerName) has been assigned to team, Dragons! Please report for your first practice on 3/17 at 1 p.m.")
}
print("\nSharks:\n")

//init counter
i = 0
while i < sharks.count {
    i += 1
    var playerName: String = sharks[i-1] as! String //force cast due to type error
    print("Dear Mr./Mrs./Person reference \(players[playerName]![2]), your child, \(playerName) has been assigned to team, Sharks! Please report for your first practice on 3/17 at 3 p.m.")
}
print("\nRaptors:\n")
//init counter
i = 0
while i < raptors.count {
    i += 1
    var playerName: String = raptors[i-1] as! String //force cast due to type error
    print("Dear Mr./Mrs./Person \(players[playerName]![2]), your child, \(playerName) has been assigned to team, Raptors! Please report for your first practice on 3/18 at 1 p.m.")
}

