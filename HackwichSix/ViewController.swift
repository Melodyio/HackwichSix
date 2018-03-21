//
//  ViewController.swift
//  HackwichSix
//
//  Created by CM Student on 3/5/18.
//  Copyright © 2018 Melody Oki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    //create a variable that can hold the value of the slider
    var currentValue: Int = 0
    
    //create a variable to hold the target value
    var targetValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //set cuurentValue to the initial value of the slider
        currentValue = lroundf(slider.value)
        
        //call startNew Round
        startNewRound()
        
        //set constant variable to store the slider's image:
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewRound(){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateTargetLabel()
        
    }

    @IBAction func sliderHasMoved(_ sender: Any) {
        print("The value of the slider is:\(slider.value)")
        currentValue = lroundf(slider.value)
    }
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        //5. New variable message that displays a message that includes currentValue
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        //1. create alert view
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        
        //2. button that user taps to dismiss view controller
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        //3. add the button to the alertview
        alert.addAction(action)
        
        //4. present alertview on the screen
        present(alert, animated: true, completion: nil)
        
        startNewRound()
        
    }
    
    @IBOutlet var targetLabel: UILabel!
    func updateTargetLabel(){
        targetLabel.text = String(targetValue)
    }
    
}

