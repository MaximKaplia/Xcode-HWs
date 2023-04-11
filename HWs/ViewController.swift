//
//  ViewController.swift
//  HWs
//
//  Created by Avariceral on 4/2/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    //MARK: - IBOutlets
    @IBOutlet weak var startButton: UIButton!
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupButton(startButton)
    }

    //MARK: - IBActions
    @IBAction func gameStart(_ sender: UIButton) {
        
        let  storyborad = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationVC = storyborad
                .instantiateViewController(identifier: "GameController") as? GameController,
              let navController = navigationController
              else {return}
        navController.pushViewController(destinationVC, animated: true)
    }
    //MARK: - Private methods
    private func setupButton(_ button:UIButton) {
        
        button.layer.cornerRadius = button.frame.height / 2
        
    }
    
    private func setupSprite (_ sprite: UIView) {
        
        sprite.snp.makeConstraints { make in
            
            make.width
                .equalTo(50)
            make.height
                .equalTo(100)
            make.center
                .equalTo(self.view)
            
        }
        
    }
}

