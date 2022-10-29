//
//  BMICalculatorManager.swift
//  [iOS] BMI
//
//  Created by 유현이 on 2022/10/29.
//

import UIKit

struct BMICalculatorManager {
    
    private var bmi: BMI?
    
    mutating func getBMI(height: String, weight: String) -> BMI {
        calculateBMI(height: height, weight: weight)
        return bmi ?? BMI(value: 0.0, color: .white, advice: "오류 발생")
    }
    
    mutating private func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value: 0.0, color: .white, advice: "오류 발생")
            return
        }
        
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber * 10) / 10
        
        switch bmiNumber {
        case ..<18.6:
            let color = UIColor.gray
            bmi = BMI(value: bmiNumber, color: color , advice: "저체중")
        case 18.6..<23.0:
            let color = UIColor.green
            bmi = BMI(value: bmiNumber, color: color , advice: "표준")
        case 23.0..<25.0:
            let color = UIColor.yellow
            bmi = BMI(value: bmiNumber, color: color , advice: "과체중")
        case 25.0..<30.0:
            let color = UIColor.orange
            bmi = BMI(value: bmiNumber, color: color , advice: "중도비만")
        case 30.0...:
            let color = UIColor.red
            bmi = BMI(value: bmiNumber, color: color , advice: "고도비만")
        default:
            let color = UIColor.black
            bmi = BMI(value: bmiNumber, color: color , advice: "오류")
            }
        }
    }
