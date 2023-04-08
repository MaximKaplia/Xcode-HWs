//
//  ThirdViewController.swift
//  HWs
//
//  Created by Avariceral on 4/8/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var backGroundColor = UIColor.gray
    var word : String?
    var lastWords = ["Wow", "You're", "Back"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backGroundColor
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goFurther(_ sender: UIButton) {
        
        print (word ?? "smth went wrong")
        performSegue(withIdentifier: "toForth", sender: self)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "fromThird", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdModalController = segue.destination as? SecondViewController {
            
            thirdModalController.backGroundColor = .blue
            thirdModalController.lastWords[0] = lastWords[0]
            thirdModalController.lastWords[1] = lastWords[1]
            thirdModalController.lastWords[2] = lastWords[2]
            
        }
        if let forthModalController = segue.destination as? ForthViewController {
            
          
            
            forthModalController.backGroundColor = .orange
            forthModalController.word = word
            
        }
        deleteController(ThirdViewController())
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
