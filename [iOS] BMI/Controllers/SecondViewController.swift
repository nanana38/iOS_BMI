//
//  SecondViewController.swift
//  [iOS] BMI
//
//  Created by 유현이 on 2022/10/28.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var bmiNumberLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var adviceLabel: UILabel!
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = "\(bmi.value)"
        bmiNumberLabel.backgroundColor = bmi.color
        adviceLabel.text = bmi.advice
        backButton.setTitle("다시 계산하기", for: .normal)
    }
    
    func configureUI() {
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.clipsToBounds = true
        backButton.layer.cornerRadius = 5
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
