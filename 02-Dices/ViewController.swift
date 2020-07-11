//
//  ViewController.swift
//  02-Dices
//
//  Created by Romina Pozzuto on 11/07/2020.
//  Copyright © 2020 Romina Pozzuto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    
    @IBOutlet weak var imageViewDiceRigtht: UIImageView!
    
    var randomDiceIndexLefth : Int = 0
    var randomDiceIndexRigtht : Int = 0

    let diceImage = ["Dado1","Dado2","Dado3","Dado4","Dado5","Dado6",]

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomDice()
    }

    @IBAction func rollPressed(_ sender: Any) {
        generateRandomDice()
    }
    
    func generateRandomDice(){
        let nFaces : UInt32 = UInt32(diceImage.count)
        randomDiceIndexLefth = Int(arc4random_uniform(nFaces))
        randomDiceIndexRigtht = Int(arc4random_uniform(nFaces))
        let nameImageDiceLeft = diceImage[randomDiceIndexLefth]
        let nameImageDiceRigth = diceImage[randomDiceIndexRigtht]
        imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
        imageViewDiceRigtht.image = UIImage(named: nameImageDiceRigth)
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        self.imageViewDiceLeft.transform = CGAffineTransform(scaleX: 0.6, y: 0.6) .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: -100, y: 100))
                        self.imageViewDiceRigtht.transform = CGAffineTransform(scaleX: 0.6, y: 0.6) .concatenating(CGAffineTransform(rotationAngle: CGFloat.pi/2)).concatenating(CGAffineTransform(translationX: 100, y: 100))
                        self.imageViewDiceLeft.alpha = 0.0
                        self.imageViewDiceRigtht.alpha = 0.0

                        
        }) { (completed) in
            self.imageViewDiceLeft.alpha = 1.0
            self.imageViewDiceRigtht.alpha = 1.0
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRigtht.transform = CGAffineTransform.identity
            self.imageViewDiceLeft.image = UIImage(named: nameImageDiceLeft)
            self.imageViewDiceRigtht.image = UIImage(named: nameImageDiceRigth)
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            generateRandomDice()
        }
    }
}

