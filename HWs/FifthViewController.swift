//
//  FifthViewController.swift
//  HWs
//
//  Created by Avariceral on 4/8/23.
//

import UIKit

class FifthViewController: UIViewController {
    var backGroundColor = UIColor.yellow
    var word: String?
    @IBOutlet weak var Text: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backGroundColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func wowPrint(_ sender: UIButton) {
        Text.text = word
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "fromFifth", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdModalController = segue.destination as? ForthViewController {
            
            thirdModalController.backGroundColor = .blue
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
