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
        snake = spawnSnake(position: CGPoint(x: 0, y: 0));
        snakeParts.append(snake);
        board.addChild(snake);
        
        // Apple info
        apple = SKSpriteNode(color: UIColor.red, size: snakeSize);
        apple.anchorPoint = topLeftAnchor;
        spawnApple()
        board.addChild(apple);
        
        snakeDir = CGVector(dx: 1, dy: 0);
        
        gameTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(self.updateGame), userInfo: nil, repeats: true);
        
    }
    
    
    func spawnSnake(position: CGPoint) -> SKSpriteNode {
        let part = SKSpriteNode(color: UIColor.green, size: snakeSize);
        part.anchorPoint = CGPoint(x: 0, y: 1);
        part.position = position;
        part.zPosition = 2;
        
        return part;
    }
    
    
    func spawnApple() {
    
        var applePos = [Int(arc4random_uniform(12))*25, Int(arc4random_uniform(12))*25];
        for p in 0...1 {
            if (Int(arc4random_uniform(2)) == 0) {
                applePos[p] *= -1;
            }
        }
        
        apple.position = CGPoint(x: applePos[0], y: applePos[1]);

    }
    
    
    func inBoard(position: CGPoint) -> Bool {
        if (snakeParts[0].position.x < -300 || snakeParts[0].position.x > 275 || snakeParts[0].position.y < -300 || snakeParts[0].position.y > 275) {
            snakeParts[0].color = UIColor.orange;
            print("Dead");
            return false;
        }
        return true;
    }
    
    
    @objc func updateGame() {
        var appleEaten:Bool = false;
        var lastSnakePos:CGPoint = CGPoint();
        
        if(snakeParts[0].position == apple.position) {
//            print("Eaten!");
            appleEaten = true;
            lastSnakePos = snakeParts[snakeParts.count - 1].position;
//            print("Snake tail at \(lastSnakePos)")
            spawnApple();

        }
        
        if(snakeParts.count > 1) {
//            print("\(snakeParts.count)")
            
            let reverseOrder = (1...(snakeParts.count - 1)).reversed();
            for s in reverseOrder {
                snakeParts[s].position = snakeParts[s-1].position;
            }
        }
    
        if(appleEaten == true) {
            let newPart = spawnSnake(position: lastSnakePos);
            snakeParts.append(newPart);
            board.addChild(newPart);
            lastSnakePos = CGPoint();
            appleEaten = false;
        }
        
        snakeParts[0].position = CGPoint(x: (snakeParts[0].position.x + (snakeSize.width * snakeDir.dx)), y: (snakeParts[0].position.y - (snakeSize.height * snakeDir.dy)));
        
        if(inBoard(position: snakeParts[0].position) == false) {
            gameTimer.invalidate();
        }
        
    }
    
    
    @objc func swipe(gesture: UISwipeGestureRecognizer) {
        switch(gesture.direction) {
            case(UISwipeGestureRecognizer.Direction.down): do {
//                print("Swiped down");
                snakeDir = CGVector(dx: 0, dy: 1);
            }
            case(UISwipeGestureRecognizer.Direction.up): do {
//                print("Swiped Up");
                snakeDir = CGVector(dx: 0, dy: -1);
            }
            case(UISwipeGestureRecognizer.Direction.right): do {
//                print("Swiped Right");
                snakeDir = CGVector(dx: 1, dy: 0);
            }
            case(UISwipeGestureRecognizer.Direction.left): do {
//                print("Swiped Left");
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
