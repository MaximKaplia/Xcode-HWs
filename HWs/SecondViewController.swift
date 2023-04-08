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
        }
        if let thirdModalController = segue.destination as? ThirdViewController {
            
            thirdModalController.backGroundColor = .orange
            thirdModalController.word = word
            
        }
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
