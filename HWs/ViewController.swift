//
//  ViewController.swift
//  HWs
//
//  Created by Avariceral on 4/2/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
   
    var isFirstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if isFirstLoad == true {
            gestureListener(view: view.self)
            isFirstLoad = false
            
        }
    }
    
    
    private func gestureListener (view: UIView) {
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureFunc(_:)))
        
        view.addGestureRecognizer(gesture)
    }
    
    
    @objc private func gestureFunc(_ sender: UITapGestureRecognizer){
        guard let currentView = sender.view else {return}
        for _ in 0 ..< 3{
        print ("tap")
       createSquare(on: currentView)
        
        }
        
        
    }
    private func createSquare(on view: UIView) {
     
        let square = UIView()
        let randomR = CGFloat.random(in: 0...1)
        let randomG = CGFloat.random(in: 0...1)
        let randomB = CGFloat.random(in: 0...1)
        square.backgroundColor = UIColor(red: randomR, green: randomG, blue: randomB, alpha: 1)
        view.addSubview(square)
        
        let screenHeight = view.frame.height
        let screenWidth = view.frame.width
        
        let maxSize = min(screenHeight, screenWidth)
        

        let randomSize = CGFloat.random(in: 1...maxSize)
        let randomX = CGFloat.random(in: 0...(screenWidth - randomSize))
        let randomY = CGFloat.random(in: 0...(screenHeight - randomSize))
        
        square.snp.makeConstraints { make in
            
            make.height
                .width
                .equalTo(randomSize)
            make.top
                .equalTo(randomY)
            make.leading
                .equalTo(randomX)
            
            
        }
        
        gestureListener(view: square)
        
    }
   
    

}

