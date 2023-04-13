//
//  MainViewController.swift
//  HWs
//
//  Created by Avariceral on 4/13/23.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet var Buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        roundButtons()
    }
    
    private func roundButtons() {
        
        Buttons.forEach { make in
            make.layer.cornerRadius = make.frame.height / 2
            
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
