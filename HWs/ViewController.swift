//
//  ViewController.swift
//  HWs
//
//  Created by Avariceral on 4/2/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureFunc))
        
        view.addGestureRecognizer(gesture)
  
    }
    
    
    
    @objc func gestureFunc(){

        for _ in 0 ..< 3 {
        print ("tap")
        let randomX = CGFloat.random(in: 0...200)
        let randomY = CGFloat.random(in: 0...200)
        let randomH = CGFloat.random(in: 20...60)
        let randomW = CGFloat.random(in: 20...60)
        let anotherView = UIView()
        anotherView.frame = CGRect (x: randomX, y: randomY, width: randomW, height: randomH)
        anotherView.backgroundColor = .purple
        
        view.addSubview(anotherView)
        
        }
        
        
        
    }
    
    
   
    

}

