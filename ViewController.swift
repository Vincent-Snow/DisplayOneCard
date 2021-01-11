//
//  ViewController.swift
//  DisplayOneCard
//
//  Created by mac-admin on 4/18/16.
//  Copyright © 2016 Vints. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var deck: Deck?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CardController.getDeck { (deck) in
            self.deck = deck
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func drawNewCardButton(sender: AnyObject) {
        //       let deckID = CardController.getDeckID()
        guard let deck = deck else {return}
        CardController.drawCard(deckID: deck.deckID) { (card) in
                guard let card = card else {return}
            ImageController.imageAtURl(url: card.imageEndpoint, completion: { (image) in
                DispatchQueue.main.async {
                        self.cardImageView.image = image
                    self.label.text = "\(card.value.localizedCapitalized) of \(card.suit.localizedCapitalized)"
                    }
                })
            }
        
    }
    
}



