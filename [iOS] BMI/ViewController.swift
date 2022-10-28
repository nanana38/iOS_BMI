//
//  ViewController.swift
//  [iOS] BMI
//
//  Created by 유현이 on 2022/10/28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var calculateButton: UIButton!
    
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        heightTextField.delegate = self
        weightTextField.delegate = self
        
    }
    
    func configureUI() {
        mainLabel.text = "키와 몸무게를 선택하세요."
        calculateButton.layer.cornerRadius = 5
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }
    
    @IBAction func calculateButtonTapeed(_ sender: UIButton) {
        bmi = calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(#function)
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 필수로 입력해주세요."
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요."
        mainLabel.textColor = .black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.modalPresentationStyle = .fullScreen
            secondVC.bmiNumber = bmi
            secondVC.bmiColor = getBackgroundCololr()
            secondVC.adviceString = getBMIAdviceString()
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    func calculateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else { return 0.0 }
        var bmi = w / (h * h) * 10000
        bmi = round(bmi * 10) / 10
        print("BMI결과값: \(bmi)")
        return bmi
    }
    
    func getBackgroundCololr() -> UIColor {
        guard let bmi = bmi else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor.gray
        case 18.6..<23.0:
            return UIColor.green
        case 23.0..<25.0:
            return UIColor.yellow
        case 25.0..<30.0:
            return UIColor.orange
        case 30.0...:
            return UIColor.red
        default:
            return UIColor.black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
