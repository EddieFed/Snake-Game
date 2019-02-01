//
//  Snake.swift
//  Snake-Game
//
//  Created by Conant High School on 2/1/19.
//  Copyright © 2019 Eddie Federemyer. All rights reserved.
//
import CoreGraphics
import SpriteKit.SKSpriteNode

class Snake {
    var loc:CGPoint!;
    var direction:CGVector!;
    var character:SKSpriteNode!;
    
    init() {
        loc = CGPoint(x: 0, y: 0);
        direction = CGVector(dx: 0, dy: 1);
        character = SKSpriteNode(color: UIColor.green, size: CGSize(width: 50, height: 50));
        character?.anchorPoint = CGPoint(x: 0, y: 0);
        
        character?.position = loc;
    }
     
}
