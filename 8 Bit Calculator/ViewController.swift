//
//  ViewController.swift
//  8 Bit Calculator
//
//  Created by Vikash Loomba on 5/24/16.
//  Copyright © 2016 Loomba Apps. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Multiply = "*"
        case Divide = "/"
        case Subtract = "-"
        case Add = "+"
        case Equals = "="
        case Empty = "Empty"
    }
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftNumber = ""
    var rightNumber = ""
    var currentOperation: Operation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Grabbing audio file for button clicks
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        //Error handling if AVFoundation cant load URL
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let error as NSError{
            //print the error for debugging
            print(error.debugDescription)
        }
        
    }
    
    
    @IBAction func numberPressed(btn: UIButton!){
        buttonSound.play()
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        
    }
    

}

