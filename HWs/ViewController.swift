//
//  ViewController.swift
//  HWs
//
//  Created by Avariceral on 4/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupButton(startButton)
    }


    @IBAction func gameStart(_ sender: UIButton) {
        
        let  storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = storyborad
                .instantiateViewController(identifier: "GameController") as? GameController,
              let navController = navigationController
              else {return}
        navController.pushViewController(destinationVC, animated: true)
        
        
        
    }
    
    private func setupButton(_ button:UIButton) {
        
        button.layer.cornerRadius = button.frame.height / 2
        
    }
    
    private func setupSprite (_ sprite: UIView) {
        
        
        
    }
}

