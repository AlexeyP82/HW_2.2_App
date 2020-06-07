//
//  ViewController.swift
//  HW_2.2_App
//
//  Created by Алексей Подлевский on 24.05.2020.
//  Copyright © 2020 Independent Developer. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {

  @IBOutlet weak var colorView: UIView!
  @IBOutlet weak var redValueLabel: UILabel!
  @IBOutlet weak var greenValueLabel: UILabel!
  @IBOutlet weak var blueValueLabel: UILabel!
  @IBOutlet weak var redSlider: UISlider!
  @IBOutlet weak var greenSlider: UISlider!
  @IBOutlet weak var blueSlider: UISlider!
  @IBOutlet weak var redValueTextField: UITextField!
  @IBOutlet weak var greenValueTextField: UITextField!
  @IBOutlet weak var blueValueTextField: UITextField!
  
  var redValue: Float = 1.0
  var greenValue: Float = 1.0
  var blueValue: Float = 1.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    redSlider.value = redValue
    greenSlider.value = greenValue
    blueSlider.value = blueValue
    
    redValueLabel.text = String(format: "%.2f",
                                redSlider.value)
    greenValueLabel.text = String(format: "%.2f",
                                  greenSlider.value)
    blueValueLabel.text = String(format: "%.2f",
                                 blueSlider.value)
    
    redValueTextField.text = String(format: "%.2f",
                                    redSlider.value)
    greenValueTextField.text = String(format: "%.2f",
                                      greenSlider.value)
    blueValueTextField.text = String(format: "%.2f",
                                     blueSlider.value)
    
    redSlider.minimumTrackTintColor = UIColor.red
    greenSlider.minimumTrackTintColor = UIColor.green
    blueSlider.minimumTrackTintColor = UIColor.blue
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1)
    
    redValueTextField.delegate = self
    greenValueTextField.delegate = self
    blueValueTextField.delegate = self
  }
  
  override func touchesBegan(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
  }
  
  @IBAction func changeColorSlider(_ sender: UISlider) {
    switch sender {
    case redSlider:
      redValue = sender.value
      redValueLabel.text = String(format: "%.2f",
                                  sender.value)
      redValueTextField.text = String(format: "%.2f",
                                      sender.value)
    case greenSlider:
      greenValue = sender.value
      greenValueLabel.text = String(format: "%.2f",
                                    sender.value)
      greenValueTextField.text = String(format: "%.2f",
                                        sender.value)
    case blueSlider:
      blueValue = sender.value
      blueValueLabel.text = String(format: "%.2f",
                                   sender.value)
      blueValueTextField.text = String(format: "%.2f",
                                       sender.value)
    default:
      print("Wrong slider")
    }
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1)
  }
}

extension SetupViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    let toolBar = UIToolbar(frame: CGRect.init(x: 0,
                                               y: 0,
                                               width: self.view.frame.width,
                                               height: 44))
    let doneButton = UIBarButtonItem(title: "Done",
                                     style: .done,
                                     target: nil,
                                     action: #selector(doneButtonPressed))
    
    toolBar.items = [doneButton]
    textField.inputAccessoryView = toolBar
    
    return true
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    switch textField {
    case redValueTextField:
      if let value = Float(redValueTextField.text!) {
        redValue = value
        redSlider.value = value
        redValueLabel.text = String(format: "%.2f", value)
      }
    case greenValueTextField:
      if let value = Float(greenValueTextField.text!) {
        greenValue = value
        greenSlider.value = value
        greenValueLabel.text = String(format: "%.2f", value)
      }
    case blueValueTextField:
      if let value = Float(blueValueTextField.text!) {
        blueValue = value
        blueSlider.value = value
        blueValueLabel.text = String(format: "%.2f", value)
      }
    default:
      print("Wrong TextField")
    }
    
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1.0)
  }
  
  @objc func doneButtonPressed() {
    view.endEditing(true)
  }
}
