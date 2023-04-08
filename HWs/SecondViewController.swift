//
//  FirstModelViewController.swift
//  HWs
//
//  Created by Avariceral on 4/6/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    
    
    var backGroundColor = UIColor.black
    var word: String?
    var lastWords = ["", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backGroundColor
        
    }
    

    @IBAction func nextController(_ sender: UIButton) {
        
        print (word ?? "something went wrong")
        performSegue(withIdentifier: "toThird", sender: self)
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "fromSecond", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondModalController = segue.destination as? BaseViewController {
            
            secondModalController.backGroundColor = .blue
            secondModalController.lastmessage.Str1 = lastWords[0]
            secondModalController.lastmessage.Str2 = lastWords[1]
            secondModalController.lastmessage.Str3 = lastWords[2]
            
            
            
            
        }
        if let thirdModalController = segue.destination as? ThirdViewController {
            
            
            thirdModalController.backGroundColor = .orange
            thirdModalController.word = word
            
        }
        
        deleteController(SecondViewController())
        
    }
    func deleteController (_ Controller : UIViewController) {
        
        let lastPage = Controller
        lastPage.dismiss(animated: true) { print ("ManImDead Func")}
        
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
