//
//  ViewController.swift
//  BullsEye
//
//  Created by Ivo Stoyanov on 10/15/14.
//  Copyright (c) 2014 HOME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 50
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert() {
        let message = "The value: \(currentValue)"
        let alert = UIAlertController(title: "Value", message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }

    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
        //println("Slider: \(currentValue)")
    }
    
}

