//
//  GameScene.swift
//  Snake-Game
//
//  Created by Conant High School on 2/1/19.
//  Copyright © 2019 Eddie Federemyer. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

//    var game:GameManager!;
    var snake:SKSpriteNode!;
    var apple:SKSpriteNode!;
    
    var gameTimer:Timer!;
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 1);
//        game = GameManager();
        
        snake = SKSpriteNode(color: UIColor.green, size: CGSize(width: 100, height: 100));
        snake.anchorPoint = CGPoint(x: 0, y: 1);
        snake.position = CGPoint(x: 0, y: 0);
        
        
        self.addChild(snake);
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(self.updateGame), userInfo: nil, repeats: true);
        
        
    }
    
    @objc func updateGame() {
        snake.position = CGPoint(x: snake.position.x + 100, y: snake.position.y);
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }

    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
    
}
