//
//  MainViewController.swift
//  HWs
//
//  Created by Avariceral on 4/13/23.
//

import UIKit

class MainViewController: UIViewController {
    // MARK: - Private Vars
    private var firstNumber : Double? = 0
    private var secondNumber : Double?
    private var signsTag : Int?
    
    // MARK: - IBOutlets
    @IBOutlet var Buttons: [UIButton]!
    
    @IBOutlet var numButtons: [UIButton]!
    
    
    @IBOutlet weak var numLable: UILabel!
    
    
    @IBOutlet weak var numView: UIView!
    
    @IBOutlet weak var allClearButton: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func numTap(_ sender: UIButton) {
        
        let tagNumber = sender.tag
        let numText = numLable.text
        let check = verguleCheck(numText)
        
        
       
        showNumbers(tagNumber, text: numText, check)
        
        allClearCheck()
    }
    
   
    
    @IBAction func additionalButtons(_ sender: UIButton) {
        
        let tagNumber = sender.tag
        let text = numLable.text
        let sign: Bool
        
        
        
        switch tagNumber {
        case 0:
            numLable.text = "0"
            allClearCheck()

        case 1:
            sign = signCheck(text)
            addSign(sign)
            
        case 2:
        break
            ///idk what this button does
        default:
            return
        }
    }
    
    @IBAction func signButtons(_ sender: UIButton) {
    
        let tag = sender.tag
        
        
        allClearCheck()
        
        switch tag {
        case 0:
            updateLabel()
             signsTag = tag
        case 1:
            updateLabel()
             signsTag = tag
        case 2:
            updateLabel()
             signsTag = tag
        case 3:
           updateLabel()
            signsTag = tag
            
        case 4:
            
            secondNumber = Double(numLable.text ?? "Bruh2")
            
            /// delete
            print (secondNumber ?? "Smth Went Wrong", "secondNum")
            
            
            equals(signsTag ?? 1, firstNumber ?? 1, secondNumber ?? 1)
        default:
            return
        }   
    }
    
    //MARK: - Override Funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        roundButtons()
        setupLabel(numView)
    }
    
    //MARK: - Private Funcs
    
    private func roundButtons() {
        
        Buttons.forEach { make in
            make.layer.cornerRadius = make.frame.height / 2
            
        }
        
    }
    private func updateLabel() {
        firstNumber = Double(numLable.text ?? "Bruh")
        numLable.text = "0"
    }
    
    private func equals (_ finalTag: Int, _ firstNumber: Double, _ secondNumber: Double) {
        
       
        
        let numbers = round2(firstNumber, secondNumber)
    
       
        switch finalTag {
        case 0:
            numLable.text = String(numbers.first / numbers.second)
        case 1:
            numLable.text = String(numbers.first * numbers.second)
        case 2:
            numLable.text = String(numbers.first - numbers.second)
        case 3:
            numLable.text = String(numbers.first + numbers.second)
            
        default:
            return
        }
        
    }
    private func remainsCheck (_ num: Double, _ num2: Double) -> Bool{
        
        let roundNum1 = fmod(num, num)
        let roundNum2 = fmod(num2, num2)
        
        if roundNum1 == 0 && roundNum2 == 0 {return true}
        
        else {return false}
    }
   
    private func round2 (_ num: Double,_ num2: Double) -> (first: Double, second: Double) {
        
        var result = num * 1000
        var result2 = num2 * 1000
        if result > 0 {
            result += 0.5
        }
        if result2 > 0 {
            result2 += 0.5
            
        }
        if result < 0 {
            result -= 0.5}
        if result2 < 0 {
            result2 -= 0.5
        }
        
        result = Double(Int(result)) / 1000
        result2 = Double(Int(result2)) / 1000
        return (result, result2)
        
    }
    private func showNumbers (_ tag: Int, text: String?, _ check: Bool) {
        if text == "0" && tag < 10 {
            
            numLable.text = String(tag)
        }
        if text != "0" && tag < 10 {
            
            numLable.text? += String(tag)
            
        }
        if tag == 10 && check == false {
            numLable.text? += "."
        }
        
        
        else {return}
        
    }
    
    private func verguleCheck (_ string: String?) -> Bool{
        let array = string.map{String($0)}
        let hasVerg = array?.contains { verg in
            verg == "."
            /// если есть запятая возвращает true
            
        } ?? false
        return hasVerg
    }
    private func signCheck (_ string: String?) -> Bool {
        let array = string.map{String($0)}
        let hasSign = array?.contains { signPlus in
             signPlus == "-"} ?? false
        /// если есть знак  минус возвращает true
        return hasSign
    }

    private func addSign (_ signCheck: Bool) {
        guard var lableText = numLable.text else {return}
        /// если нет минуса, добавляет
        if signCheck == false {
            
            lableText = "-" + lableText
            numLable.text = lableText
            
        }
        if signCheck == true {
            let array = lableText.map{String($0)}
            let filtredArr = array.filter { element in
                element != "-"
            }
            numLable.text = filtredArr.joined()
            
        }
    }
    private func allClearCheck() {
        let text = numLable.text
        if text == "0" && firstNumber == 0 {
            allClearButton.setTitle("AC", for: .normal)
            
        }
        else {
            allClearButton.setTitle("C", for: .normal)
            
        }
    }
    
    
    private func setupLabel (_ numView: UIView) {
        
        let gesture = UISwipeGestureRecognizer (target: self, action: #selector(deleteGesture))
        gesture.direction = .right
        numView.addGestureRecognizer(gesture)
    }
   /// private func updateRemains(for result: Double) {
        ///только после равно
     ///   guard let text = numLable.text else {return}
    ///    print (result, "result")
    ///    let array = text.map{String($0)}
     ///   var newArray: [String] = []
     ///   if result == floor(result) {
      ///      var n = Int(result)
       ///     n = countNumbers(n: n)
       ///     for element in array[0..<n] {
        ///        newArray.append(element)
        ///    }
       ///     numLable.text = newArray.joined()
      ///
    ///    }
 ///   }
    private func countNumbers (n: Int) -> Int {
        var count = 0
        var num = n
        if num == 0 {return 1}
        while (num > 0) {
            num = num / 10
            count += 1
        }
        return count
    }
    
    //MARK: - ObjC Private Funcs
    
    @objc private func deleteGesture() {
        guard let text = numLable.text else {return}
        var array = text.map{String($0)}
        let arRemains = array.count
        if text != "0"{
            array.removeLast()
            numLable.text = array.joined()
        }
        if text != "0" && arRemains == 1 {
            numLable.text = "0"
            
        }
       
        
        else {return}
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
