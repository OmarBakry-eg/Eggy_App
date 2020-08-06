//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softTime : Int = 5
//    let mediumTime: Int = 7
//    let hardTime: Int = 12
// ------------------------------
//    let eggTimes : Dictionary<String , Int> = [
//        "Soft" : 5 , "Medium" : 7 , "Hard" : 12,
//    ]
    let eggTimes : [String : Int] = [
        "Soft" : 5 , "Medium" : 7 , "Hard" : 12,
    ]
    var timer : Timer = Timer()
    var player : AVAudioPlayer!
    var secondPassed = 0
    var totalTime = 0
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    //ang code
    @IBAction func eggPressed(_ sender: UIButton) {
        
//        let hardness : String = sender.titleLabel?.text ?? "error"
         //------------------
//        let buttonTitle : String = sender.title(for: .normal)!
//       print(buttonTitle)
         //------------------
//        print(eggTimes[hardness] ?? "empty key or not found")
        //------------------
       // let hardness : String? = sender.currentTitle // ang code
        // ang code {
        timer.invalidate()
     //from me
        let hardness : String = sender.currentTitle!
//        let result = eggTimes[hardness]!
//        print(result)
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
            secondPassed = 0
            titleLabel.text = "Changing your eggy..."
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        //#selector(UIMenuController.update) and then i won't call @objc in update method
        
        // } ang code
        
        //------------------
//        if(hardness == Optional("Soft")){
//            print(softTime)
//        } else if(hardness == Optional("Medium")){
//            print(mediumTime)
//        }else {
//            print(hardTime)
//        }
        //------------------------
//        switch hardness {
//        case eggTimes:
//           // print(eggTimes["Soft"] ?? "error")
//            print(eggTimes["Soft"]!)
        
        
//            case Optional("Medium"):
//            print(mediumTime)
//            case Optional("Hard"):
//            print(hardTime)
//        default:
//            hardness
//        }
    
    }
   @objc func update() {
    if(secondPassed < totalTime) {
        secondPassed += 1 // because it still zero so i've to to give a value to divide
        progressBar.progress = Float(secondPassed) / Float(totalTime)
       // print(Float(secondPassed / totalTime)) #false it calculate and round it 5/2 = 2.0
       //print(Float(secondPassed) / Float(totalTime)) #true it just float one to one and then calcluate them
        
    } else {
        timer.invalidate()
        titleLabel.text = "DONE!"
        
        let url = Bundle.main.url(forResource:"alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
    
       // ? mean optional >> that it will be catch a var or it will be a nil or null
       // var play : String = nil #error !!
       // var play : String? = nil #success
       //-----------------
       // ! mean force unWrapp!! >> that I tell the computer this value did not be optional any more it will catch a value any way .. now i will remove all errors but it will crash at runtime error if this variable is equal to null .
       // so optional here ? or nil aware ?. or if it was null ?? that are the safty check (like if statement as possible) and saved me from any errors
       // And if I sure in this vaiable that it will catch data any way and it never be nill basiclly I can use ! force Unwrapp ! .
}
