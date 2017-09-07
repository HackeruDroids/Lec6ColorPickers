//
//  ViewController.swift
//  ColorPickers
//
//  Created by TomerBu on 07/09/2017.
//  Copyright © 2017 TomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color:(r: Float, g: Float, b: Float){
        return (redSlider.value, greenSlider.value, blueSlider.value)
    }
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var blueText: UITextField!
    @IBOutlet weak var greenText: UITextField!
    @IBOutlet weak var redText: UITextField!

    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!

    
    @IBAction func textChanged(_ sender: UITextField) {
        //nil coalescing operator
        let r = Float(redText.text ?? "0") ?? 0
        let g = Float(greenText.text ?? "0") ?? 0
        let b = Float(blueText.text ?? "0") ?? 0
        
        redSlider.value = r
        greenSlider.value = g
        blueSlider.value = b
        
        updateBackground()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateBackground()
        updateTexts()
    }
    

    
    func updateBackground(){
        totalLabel.backgroundColor =
            UIColor(colorLiteralRed: color.r / 255, green: color.g / 255, blue: color.b / 255, alpha: 1)
    }
    func updateTexts(){
        //UIColor takes values between 0 - 1.
        //We have values between 0 - 255
        //we can divide by 255 (255 / 255 = 1)
        //(0 / 255 = 0) ,(128 / 255 = 0.5
        
        redText.text = String(format: "%.0f", redSlider.value)
        greenText.text = String(format: "%.0f", greenSlider.value)
        blueText.text = String(format: "%.0f", blueSlider.value)
        
        totalLabel.text = String(format: "#%02X%02X%02X",
                                 Int(redSlider.value),
                                 Int(greenSlider.value),
                                 Int(blueSlider.value)
            
            
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.layer.cornerRadius = 8
        totalLabel.layer.borderWidth = 10
        totalLabel.layer.borderColor = UIColor.white.cgColor
        totalLabel.layer.masksToBounds = true
    }
}

