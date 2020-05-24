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
    
    let red: CGFloat = 0.50
    let green: CGFloat = 0.50
    let blue: CGFloat = 0.50
    
    redValueLabel.text = String(format: "%.2f", red)
    greenValueLabel.text = String(format: "%.2f", green)
    blueValueLabel.text = String(format: "%.2f", blue)
    
    redSlider.minimumTrackTintColor = UIColor.red
    greenSlider.minimumTrackTintColor = UIColor.green
    blueSlider.minimumTrackTintColor = UIColor.blue
    
    colorView.backgroundColor = UIColor(red: red,
                                        green: green,
                                        blue: blue,
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
    
    guard let red = Double(redValueLabel.text!),
      let green = Double(greenValueLabel.text!),
      let blue = Double(blueValueLabel.text!) else { return }
    
    colorView.backgroundColor = UIColor(red: CGFloat(red),
                                        green: CGFloat(green),
                                        blue: CGFloat(blue),
                                        alpha: 1)
  }
  
}

