//
//  ForthViewController.swift
//  HWs
//
//  Created by Avariceral on 4/8/23.
//

import UIKit

class ForthViewController: UIViewController {
    var backGroundColor = UIColor.green
    var word: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backGroundColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goFurther(_ sender: UIButton) {
        performSegue(withIdentifier: "toFifth", sender: self)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "fromForth", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdModalController = segue.destination as? ThirdViewController {
            
            thirdModalController.backGroundColor = .blue
        }
        if let fifthModalController = segue.destination as? FifthViewController {
            
            fifthModalController.backGroundColor = .orange
            fifthModalController.word = word
            
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
