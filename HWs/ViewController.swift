//
//  ViewController.swift
//  HWs
//
//  Created by Avariceral on 4/2/23.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    @IBOutlet var myStrings: [UILabel]!
    
    
    let string = "How did we get here"
    var lastmessage = MyStrings(Str1: "", Str2: "", Str3: "")
    
    var backGroundColor = UIColor.white
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = backGroundColor
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        myStrings[0].text = lastmessage.Str1
        myStrings[1].text = lastmessage.Str2
        myStrings[2].text = lastmessage.Str3
    }

    @IBAction func presentOtherController(_ sender: UIButton) {
       
        performSegue(withIdentifier: "toSecond", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let firstModalController = segue.destination as? BaseViewController {
            
            firstModalController.backGroundColor = .blue
        }
        if let secondModalController = segue.destination as? SecondViewController {
            
            secondModalController.backGroundColor = .red
            secondModalController.word = string
            
        }
        deleteController(BaseViewController())
    }
    func deleteController (_ Controller : UIViewController) {
        
        let lastPage = Controller
        lastPage.dismiss(animated: true) { print ("ManImDead Func")}
        
    }
    
}

