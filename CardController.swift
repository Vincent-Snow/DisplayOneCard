//
//  CardController.swift
//  DisplayOneCard
//
//  Created by mac-admin on 4/18/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import Foundation

class CardController {
    
    static func drawCard(deckID: String, completion: @escaping (_ card: Card?) -> Void) {
        let url = "http://deckofcardsapi.com/api/deck/\(deckID)/draw/?count=1"
        
        NetworkController.dataAtURL(url: url) { (success, data) in
            guard let data = data,
                  let json = NetworkController.serializeDataAsJson(data: data),
                  let cardArray = json["cards"] as? [[String: AnyObject]],
                  let cardDictionary = cardArray.first, success else {
                completion(nil)
                    return
            }
            let card = Card(dictionary: cardDictionary)
            completion(card)
        }
        
    }
    
    static func getDeck(completion: @escaping (_ deck: Deck?) -> Void ) {
       let url = "http://deckofcardsapi.com/api/deck/new/"
        NetworkController.dataAtURL(url: url) { (success, data) in
            guard let data = data,
                  let json = NetworkController.serializeDataAsJson(data: data), success else {
                completion(nil)
                    return
            }
            let deck = Deck(dictionary: json)
            print(deck?.deckID as Any)
            completion(deck)
    
        }
    }
    
  
}

