//
//  ViewController.swift
//  HW_2.2_App
//
//  Created by Алексей Подлевский on 24.05.2020.
//  Copyright © 2020 Independent Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var redValueLabel: UILabel!
  @IBOutlet weak var greenValueLabel: UILabel!
  @IBOutlet weak var blueValueLabel: UILabel!
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    redValueLabel.text = String(format: "%.2f", redSlider.value)
    greenValueLabel.text = String(format: "%.2f", greenSlider.value)
    blueValueLabel.text = String(format: "%.2f", blueSlider.value)
    
    redSlider.minimumTrackTintColor = UIColor.red
    greenSlider.minimumTrackTintColor = UIColor.green
    blueSlider.minimumTrackTintColor = UIColor.blue
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1)
  }

  @IBAction func changeColorSlider(_ sender: UISlider) {
    switch sender {
    case redSlider:
      redValueLabel.text = String(format: "%.2f", sender.value)
    case greenSlider:
      greenValueLabel.text = String(format: "%.2f", sender.value)
    case blueSlider:
      blueValueLabel.text = String(format: "%.2f", sender.value)
    default:
      print("Wrong slider")
    }
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1)
  }
  
}

