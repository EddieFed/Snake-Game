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
    // Snake
    var loc:CGPoint = CGPoint();
    var direction:CGVector = CGVector();
    var character:SKSpriteNode = SKSpriteNode();
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 1);
        
        direction = CGVector(dx: 0, dy: 1);
        character = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 50));
//        loc = CGPoint(x: 500, y: 500);
//        character.position = loc;
        
        self.addChild(character);
        
    }

    
    
//    s.character.position = CGPoint(x: s.character.position.x + 50, y: s.character.position.y);
    override func update(_ currentTime: TimeInterval) {
        
    }
}
