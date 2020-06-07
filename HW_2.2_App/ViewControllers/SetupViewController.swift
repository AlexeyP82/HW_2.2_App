//
//  ViewController.swift
//  HW_2.2_App
//
//  Created by Алексей Подлевский on 24.05.2020.
//  Copyright © 2020 Independent Developer. All rights reserved.
//

import UIKit

protocol SetupViewControllerDelegate {
  func saveColor(red: Float, green: Float, blue: Float)
}

class SetupViewController: UIViewController {
  
  // MARK: - IB Outlets
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
  
  // MARK: - Public Properties
  var redValue: Float!
  var greenValue: Float!
  var blueValue: Float!
  var delegate: SetupViewControllerDelegate!
  
  // MARK: - Life Cycles Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupScreen()
    updateColor()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>,
                             with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    view.endEditing(true)
  }
  
  // MARK: - IB Actions
  @IBAction func changeColorSlider(_ sender: UISlider) {
    switch sender {
    case redSlider:
      updateRedValue(sender.value)
    case greenSlider:
      updateGreenValue(sender.value)
    case blueSlider:
      updateBlueValue(sender.value)
    default:
      print("Wrong slider")
    }
    
    updateColor()
  }
  
  @IBAction func doneButtonPressed() {
    delegate.saveColor(red: redSlider.value,
                       green: greenSlider.value,
                       blue: blueSlider.value)
    dismiss(animated: true)
  }
  
  // MARK: - Private methods
  private func setupScreen() {
    redSlider.minimumTrackTintColor = UIColor.red
    greenSlider.minimumTrackTintColor = UIColor.green
    blueSlider.minimumTrackTintColor = UIColor.blue
    
    redValueTextField.delegate = self
    greenValueTextField.delegate = self
    blueValueTextField.delegate = self
    
    updateRedValue(redValue)
    updateGreenValue(greenValue)
    updateBlueValue(blueValue)
  }
  
  private func updateRedValue(_ value: Float) {
    redSlider.value = value
    redValueLabel.text = String(format: "%.2f", value)
    redValueTextField.text = String(format: "%.2f", value)
  }
  
  private func updateGreenValue(_ value: Float) {
    greenSlider.value = value
    greenValueLabel.text = String(format: "%.2f", value)
    greenValueTextField.text = String(format: "%.2f", value)
  }
  
  private func updateBlueValue(_ value: Float) {
    blueSlider.value = value
    blueValueLabel.text = String(format: "%.2f", value)
    blueValueTextField.text = String(format: "%.2f", value)
  }
  
  private func updateColor() {
    colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                        green: CGFloat(greenSlider.value),
                                        blue: CGFloat(blueSlider.value),
                                        alpha: 1.0)
  }
}

// MARK: - TextField Methods
extension SetupViewController: UITextFieldDelegate {
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    let toolBar = UIToolbar(frame: CGRect.init(x: 0,
                                               y: 0,
                                               width: self.view.frame.width,
                                               height: 44))
    let doneButton = UIBarButtonItem(title: "Done",
                                     style: .done,
                                     target: nil,
                                     action: #selector(doneItemPressed))
    
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
        updateRedValue(value > 1.0 ? 1.0 : value)
      }
    case greenValueTextField:
      if let value = Float(greenValueTextField.text!) {
        updateGreenValue(value > 1.0 ? 1.0 : value)
      }
    case blueValueTextField:
      if let value = Float(blueValueTextField.text!) {
        updateBlueValue(value > 1.0 ? 1.0 : value)
      }
    default:
      print("Wrong TextField")
    }
    
    updateColor()
  }
  
  @objc func doneItemPressed() {
    view.endEditing(true)
  }
}
