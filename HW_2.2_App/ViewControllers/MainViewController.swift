//
//  MainViewController.swift
//  HW_2.2_App
//
//  Created by Алексей Подлевский on 07.06.2020.
//  Copyright © 2020 Independent Developer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  // MARK: - IB Outlets
  @IBOutlet var mainView: UIView!
  
  // MARK: - Public Properties
  var redValue: Float = 1.0
  var greenValue: Float = 1.0
  var blueValue: Float = 1.0
  
  // MARK: - Life Cycles Methods
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    mainView.backgroundColor = UIColor(red: CGFloat(redValue),
                                       green: CGFloat(greenValue),
                                       blue: CGFloat(blueValue),
                                       alpha: 1.0)
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "setupSegue" {
      let destinationVC = segue.destination as! SetupViewController
      destinationVC.delegate = self
      destinationVC.redValue = redValue
      destinationVC.greenValue = greenValue
      destinationVC.blueValue = blueValue
    }
  }
}

extension MainViewController: SetupViewControllerDelegate {
  func saveColor(red: Float, green: Float, blue: Float) {
    redValue = red
    greenValue = green
    blueValue = blue
  }
}
