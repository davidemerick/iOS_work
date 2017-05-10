//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let suits = ["Clubs", "Diamonds", "Hearts", "Spades"]
let cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
var deckOfCards = [String: [Int]]()

// loop through suits
for i in 0..<suits.count{
    // create key suits and assign a value of 'cards' array
    deckOfCards[suits[i]] = cards
}

//print(deckOfCards)

func tossCoin(){
    print("Tossing a Coin!")
    let coinFlip = arc4random_uniform(2)
    var result = String()
    
    if coinFlip == 1 {
        result = "Tails"
        print("It's \(result)!")
        
    } else {
        result = "Heads"
        print("It's \(result)!")
    }
}

func tossMulipleCoins(times: Int){
    
    for i in 1...times {
        tossCoin()
    }
}

//tossMulipleCoins(times: 3)

//struct Card {
//    let value = String()
//    let suit = String()
//    let num_val = Int()
//    // computed properties
//    var color: String {
//        get {
//            if suit == "Hearts" || suit == "Diamonds" {
//                return "Red"
//            }
//            else {
//                return "Black"
//            }
//        }
//        set{
//        
//        }
//    }
//}
//
//class Deck {
//    // Arrays in Swift are actually linked lists
//    // Array<Card> is this.next: node, val: Card (type)
//    var cards = Array<Card>()
//    init(){
//        populate()
//    }
//    
//    private func populate ( ) {
//        var suits = ["spades", "clubs", "hearts", "diamonds"]
//        var values = ["A", "2", "3","4", "5", "6","7", "8", "9","10", "J", "Q", "K"]
//        for suit in suits{
//            for i in 0..<values.count {
//                cards.append(Card(value: values[i],  suit: String, numericValue: i + 1))
//            }
//        }
//    }
//    func deal() -> Card? {
//        let card = cards.removeLast()
//        return card
//    }
//}
//class Player {
//    var hand = Array<Card>()
//    init(name: String,  toDraw: Int) {
//        self.name = name
//        for i in toDraw {
//            
//        }
//    }
//    func draw(from deck: Deck) -> String {
//        if let newCard = deck.deal(){
//            hand.append(newCard)
//            return newCard.value
//        }
//        return "Deck is empty"
//    }
//    func discard(card: Card) {
//        
//    }
//}


// class Deck, when initializes is given 52 instances of Card
//class Deck {
//    // array of cards
//    var cards = [Card] = []
//    init(){
//        
//    }
//}

import UIKit

struct Card {
    var value: String
    var suit: String
    var numerical_value: Int
    // This show method come in useful. Use it to make sure your other methods are working.
    func show(){
        print(value, "of", suit, ": value", numerical_value)
    }
}

class Deck {
    var cards = [Card]()
    
    init(){
        self.reset()
    }
    
    func deal() -> Card? {
        if self.cards.count > 0 {
            // This if check makes sure that there are cards in the deck to be dealt
            return self.cards.remove(at: 0)
        }
        else {
            return nil
        }
    }
    
    func reset(){
        let values = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"]
        let suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
        self.cards = [Card]()
        for suit in suits {
            // For each suit, we'll make 13 new cards and add them to our deck
            for i in 0...12 {
                let newCard = Card(value: values[i], suit: suit,  numerical_value: i+1)
                self.cards.append(newCard)
            }
        }
    }
    
    func shuffle(){
        for i in stride(from: self.cards.count-1, to: 0, by: -1) {
            // Working backwards, for each card in the deck, we'll generate a random number to target another card in the deck and have them trade places.
            let swapCardIndex = Int(arc4random_uniform(UInt32(i)))
            let temp = self.cards[i]
            self.cards[i] = self.cards[swapCardIndex]
            self.cards[swapCardIndex] = temp
        }
    }
    
    func show(){
        for card in self.cards {
            card.show()
        }
    }
}

class Player {
    var name: String
    var hand: [Card]
    
    init(name: String){
        self.name = name
        self.hand = [Card]()
    }
    
    func draw(deck:Deck) -> Card? {
        // For this method, we'll have to know which instance of the Deck class we're using
        if let drawnCard = deck.deal() {
            // We'll utilize the deck's deal method
            self.hand.append(drawnCard)
            return drawnCard
        }
        else {
            return nil
        }
    }
    
    func discard(suit: String, value: String) -> Bool {
        // For this method, we'll need to know the suit and value of the card that the user would like to discard
        for i in 0...self.hand.count-1 {
            if (self.hand[i].suit == suit && self.hand[i].value == value) {
                self.hand.remove(at: i)
                return true
            }
        }
        return false
    }
    
    func show(){
        for card in self.hand {
            card.show()
        }
    }
}

// Make a new deck called newDeck
let newDeck = Deck()

// You can check to make sure it has all 52 cards with show()
print("<<<<<<<<<<<<<<< New deck was made >>>>>>>>>>>>>>>>>")
newDeck.show()

// Shuffle the deck to make things interesting
newDeck.shuffle()

// You can check to make sure everything's been shuffled by calling show() again
print("<<<<<<<<<<<<<<< New deck was shuffled >>>>>>>>>>>>>>>>>")
newDeck.show()

// Make a new player, let's name him Joe
let joe = Player(name: "Joe")

// Have Joe draw five cards from newDeck
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)
joe.draw(deck: newDeck)

// Take a look at Joe's hand
print("<<<<<<<<<<<<<<< Joe's hand >>>>>>>>>>>>>>>>>")
joe.show()

// Make Joe discard the Ace of Clubs if he has it
print("<<<<<<<<<<<<<<< Joe's discard >>>>>>>>>>>>>>")
print(joe.discard(suit: "Clubs", value: "Ace"))


class Animal {
    var name: String
    var health = 100
    
    init(name: String){
        self.name = name
    }
    
    func displayHealth(){
        print(self.health)
    }
}

class Cat: Animal {
    init(catName: String){
        super.init(name: catName)
        self.health = 150
    }
    
    func growl(){
        print("Rawr")
    }
    
    func run(){
        print("Running")
        self.health -= 10
    }
}

class Lion: Cat {
    
    init(lionName: String){
        super.init(catName: lionName)
        self.health = 200
    }
    
    override func growl() {
        print("ROAR!!! I am the king of the Jungle")
    }
}

class Cheetah: Cat{
    
    init(cheetahName: String){
        super.init(catName: cheetahName)
    }
    
    override func run(){
        if self.health >= 50 {
            print("Running Fast")
            self.health -= 50
        }
        
    }
    func sleep(){
        if self.health + 50 <= 200 {
            self.health += 50
        }
    }
}
