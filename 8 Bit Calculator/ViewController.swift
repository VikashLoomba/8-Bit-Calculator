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
        case Empty = "Empty"
    }
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var runningNumber = ""
    var leftNumber = ""
    var rightNumber = ""
    var currentOperation: Operation = Operation.Empty
    var result = ""
    
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
        playSound()
        runningNumber += "\(btn.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualsPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    func processOperation(op: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            //Do the math
            
            //User selected an operator but selected another without entering another number
            if runningNumber != "" {
                rightNumber = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftNumber)! * Double(rightNumber)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftNumber)! / Double(rightNumber)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftNumber)! + Double(rightNumber)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftNumber)! - Double(rightNumber)!)"
                }
            
                leftNumber = result
                outputLabel.text = result
            }
            currentOperation = op
            
        } else {
            //First time someone pressed an operator
            leftNumber = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
    }
    
}

