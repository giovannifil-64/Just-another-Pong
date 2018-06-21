//
//  GameScene.swift
//  JustanotherPong
//
//  Created by Giovanni  Filippini on 14/06/18.
//  Copyright © 2018 Giovanni Filippini. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLabel = SKLabelNode()
    var btmLabel = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        startGame()
        
        topLabel = self.childNode(withName: "topLabel") as! SKLabelNode
        btmLabel = self.childNode(withName: "btmLabel") as! SKLabelNode
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height / 2) - 50
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height / 2) + 50
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    }
    
    func startGame(){
        
        score = [0,0]
        
        topLabel.text = "\(score[1])"
        btmLabel.text = "\(score[0])"
        
    }
    
    func addScore(playerWhoWon: SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if playerWhoWon == main{
            
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -25, dy: -25))
            
        }else if playerWhoWon == enemy{
            
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 25, dy: 25))
            
        }
        
        topLabel.text = "\(score[1])"
        btmLabel.text = "\(score[0])"
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let location = touch.location(in: self)
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.1))
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.4))
        
        if ball.position.y <= main.position.y - 30{
            
            addScore(playerWhoWon: enemy)
            
        } else if ball.position.y >= enemy.position.y + 30{
            
            addScore(playerWhoWon: main)
            
        }
    }
    
//    func winScreen(){
//
//        if topLabel.text == [4] as? String{
//
//            print("enemy won")
////            Go to win screen
//
//        }else if btmLabel.text == [4] as? String{
//
//            print("player won")
////            Go to win screen
//
//        }
//
//    }
    
}
