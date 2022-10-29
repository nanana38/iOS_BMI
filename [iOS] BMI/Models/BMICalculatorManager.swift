//
//  BMICalculatorManager.swift
//  [iOS] BMI
//
//  Created by 유현이 on 2022/10/29.
//

import UIKit

struct BMICalculatorManager {
    
    var bmi: Double?
    
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10
    }
    
    func getBMIResult() -> Double {
        return bmi ?? 0.0
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
