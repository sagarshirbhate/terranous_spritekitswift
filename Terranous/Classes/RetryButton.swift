//
//  RetryButton.swift
//  Terranous
//
//  Created by Jeremy Novak on 7/5/15.
//  Copyright (c) 2015 Jeremy Novak. All rights reserved.
//

import SpriteKit

class RetryButton:SKSpriteNode {
    
    // MARK: - Private class properties
    
    // MARK: - Public class properties
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    convenience init() {
        let texture = SKTexture(imageNamed: SpriteName.ButtonRetry)
        self.init(texture: texture, color: SKColor.whiteColor(), size: texture.size())
        
        self.setupRetryButton()
    }
    
    // MARK: - Setup Functions
    private func setupRetryButton() {
        self.position = CGPoint(x: kScreenCenterHorizontal, y: -self.size.height)
        
        self.zPosition = GameLayer.Interface
    }
    
    func animateRetryButton() {
        let moveInPop = SKAction.runBlock({
            self.runAction(SKAction.moveTo(CGPoint(x: kScreenCenterHorizontal, y: kViewSize.height * 0.25), duration: 0.25), completion: {
                self.runAction(SKAction.screenShakeWithNode(self, amount: CGPoint(x: 8, y: 8), oscillations: 8, duration: 0.5), completion: {
//                    self.runAction(SKAction.scaleTo(1.25, duration: 0.25), completion: {
//                        self.runAction(SKAction.scaleTo(1.0, duration: 0.25))
//                    })
                })
            })
        })
        
        self.runAction(moveInPop)
    }
    
    func tappedRetry() {
        self.runAction(GameAudio.sharedInstance.soundPop)
    }
}