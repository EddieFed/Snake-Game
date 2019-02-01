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
    
    var s:Snake!;
    var timer:Timer!;
    
    override func didMove(to view: SKView) {
        timer = Timer.init(timeInterval: TimeInterval(0.5), target: moveSnake(), selector: Selector.init(("Hello")), userInfo: nil, repeats: true)
        
        
        s = Snake();
        self.addChild(s.character!);
        
    }
    
    func moveSnake() {
        s.character.position = CGPoint(x: s.character.position.x + 50, y: s.character.position.y);
    }
//    s.character.position = CGPoint(x: s.character.position.x + 50, y: s.character.position.y);
    override func update(_ currentTime: TimeInterval) {
        
    }
}
