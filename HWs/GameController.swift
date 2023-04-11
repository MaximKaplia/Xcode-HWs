//
//  GameController.swift
//  HWs
//
//  Created by Avariceral on 4/11/23.
//

import UIKit
import SnapKit

class GameController: UIViewController {
    let carSprite = UIView()
    //MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSpriteAppearance(carSprite)
        
        
       
        
        
    }
    
    
    //MARK: - Private methods
    private func setupSpriteAppearance (_ sprite: UIView) {
        
        let spriteW = sprite.frame.width
        sprite.backgroundColor = .gray
        self.view.addSubview(sprite)
        sprite.snp.makeConstraints { make in
            
            make.width
                .equalTo(50)
            make.height
                .equalTo(100)
            make.center
                .equalTo(self.view)
            
        
            
        }
        sprite.layer.cornerRadius = spriteW / 2
        setupSpriteActions(sprite, direction: .up)
        setupSpriteActions(sprite, direction: .left)
        setupSpriteActions(sprite, direction: .right)
        setupSpriteActions(sprite, direction: .down)
    }
    private func setupSpriteActions (_ sprite: UIView, direction: UISwipeGestureRecognizer.Direction) {
            
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(moveSprite(_:)))
        
            gesture.direction = direction
        
            sprite.addGestureRecognizer(gesture)
            
        }
    //MARK: - @ObjC Private methods
    
    @objc private func moveSprite (_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        let carCenterY = carSprite.center.y
        let screenCenterY = view.center.y
        let screenCenterX = view.center.x
        let carCenterX = carSprite.center.x
        let step: CGFloat = 100
        
        switch gestureRecognizer.direction {
        case .up:
            
            if carCenterY == screenCenterY
            {
                carSprite.center.y -= step
            }
            
        case .down:

            if carCenterY < screenCenterY
            {
                carSprite.center.y += step
            }
            
        case .left:
            if
                carCenterX > screenCenterX
            {
                carSprite.center.x -= step
            }
            
        case .right:
            if
                carCenterX < screenCenterX + step
            {
                carSprite.center.x += step
            }
            
            
        
            
            
        default:
            return
            
        }
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



