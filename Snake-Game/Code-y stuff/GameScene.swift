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
    
    
    var topLeftAnchor:CGPoint = CGPoint(x: 0, y: 1);

    var board:SKSpriteNode!;
    var snake:SKSpriteNode!;
    var apple:SKSpriteNode!;
    
    var snakeSize:CGSize = CGSize(width: 25, height: 25);
    var snakeDir:CGVector!;
    var snakeParts:[SKSpriteNode] = [];
    
    var gameTimer:Timer!;
    
    
    override func didMove(to view: SKView) {
        self.anchorPoint = topLeftAnchor;
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe));
        swipeDown.direction = .down;
        self.view?.addGestureRecognizer(swipeDown);
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe));
        swipeUp.direction = .up;
        self.view?.addGestureRecognizer(swipeUp);
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe));
        swipeRight.direction = .right;
        self.view?.addGestureRecognizer(swipeRight);
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipe));
        swipeLeft.direction = .left;
        self.view?.addGestureRecognizer(swipeLeft);
        
        
        print("Width:\(self.frame.maxX), Height:\(self.frame.minY)");
        
        board = SKSpriteNode(color: UIColor.darkGray, size: CGSize(width: 600, height: 600));
        board.position = CGPoint(x: (self.frame.maxX / 2), y: (self.frame.minY / 2));
        self.addChild(board);
        
        // Snake head info
        snake = SKSpriteNode(color: UIColor.green, size: snakeSize);
        snake.anchorPoint = topLeftAnchor;
        snake.position = CGPoint(x: 0, y: 0);
        snakeParts.append(snake);
        board.addChild(snake);
        
        // Apple info
        let appleX = Int(arc4random_uniform(13))*25;
        let appleY = Int(arc4random_uniform(13))*25;
        apple = SKSpriteNode(color: UIColor.red, size: snakeSize);
        apple.anchorPoint = topLeftAnchor;
        apple.position = CGPoint(x: appleX, y: appleY);
        board.addChild(apple);
        
        
//        let snake2 = SKSpriteNode(color: UIColor.green, size: snakeSize);
//        snake2.anchorPoint = topLeftAnchor;
//        snake2.position = CGPoint(x: -50, y: 0);
//        snakeParts.append(snake2);
//        board.addChild(snake2);
        
        snakeDir = CGVector(dx: 1, dy: 0);
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(self.updateGame), userInfo: nil, repeats: true);
        
    }
    
    
    @objc func updateGame() {
        
        if(snakeParts[0].position == apple.position) {
            print("Eaten!");
        }
        
        if(snakeParts.count > 1) {
            for s in (snakeParts.count - 1)...1 {
                snakeParts[s].position = snakeParts[s-1].position;
            }
        }
        
        snakeParts[0].position = CGPoint(x: (snakeParts[0].position.x + (snakeSize.width * snakeDir.dx)), y: (snakeParts[0].position.y - (snakeSize.height * snakeDir.dy)));
        
    }
    
    
    @objc func swipe(gesture: UISwipeGestureRecognizer) {
        switch(gesture.direction) {
            case(UISwipeGestureRecognizer.Direction.down): do {
                print("Swiped down");
                snakeDir = CGVector(dx: 0, dy: 1);
            }
            case(UISwipeGestureRecognizer.Direction.up): do {
                print("Swiped Up");
                snakeDir = CGVector(dx: 0, dy: -1);
            }
            case(UISwipeGestureRecognizer.Direction.right): do {
                print("Swiped Right");
                snakeDir = CGVector(dx: 1, dy: 0);
            }
            case(UISwipeGestureRecognizer.Direction.left): do {
                print("Swiped Left");
                snakeDir = CGVector(dx: -1, dy: 0);
            }
            default: do {
                    break;
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
    }
    
    
}
