//
//  CAAnimateViewController.swift
//  12-UIViewAnimationDemo
//
//  Created by Vinson on 16/3/21.
//  Copyright © 2016年 VinsonLei. All rights reserved.
//

import UIKit


class CAAnimateViewController: UIViewController {
    
    var myLayer : CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testLayerProperty()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startClicked(sender: AnyObject) {
        //testLayerProperty()
        //self.implicitAnimation()
        // self.newBasicAnimate()
        self.newKeyFrameAnimate()
    }
    
    @IBAction func fallbackClicked(sender: AnyObject) {
        let subsArray = self.view.subviews as NSArray
        for view in subsArray {
            if view.isKindOfClass(UIImageView) {
                view.removeFromSuperlayer()
            }
        }
    }

    @IBAction func stopClicked(sender: AnyObject) {
    }
    
    func  testLayerProperty () {
        myLayer = CALayer()
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.borderWidth = 5.0
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.whiteColor().CGColor
        myLayer.shadowOffset = CGSize(width: 25.0, height: 25.0)
        myLayer.shadowOpacity = 0.2
        myLayer.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        self.view.layer.addSublayer(myLayer)
    }
    
    //MARK: 动画部分
    func newBasicAnimate () {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo"))
        imgView.frame = CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imgView)
        
        //1.选定角色 CALayer
        let layer = imgView.layer
        
        
        
        //2.写剧本
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 2.0
        
        //3.把剧本交给演员
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
        
        //4.写第二个剧本用来透明
        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.0
        opaqueAnimate.toValue = 1.0
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration = 2.0
        
        //5.把第二个剧本交给演员
        layer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
        
    }
    
    func newKeyFrameAnimate () {
        
        let imgView = UIImageView(image: UIImage(named: "maiziLogo"))
        imgView.frame = CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imgView)
        
        //1.选定角色
        let layer = imgView.layer
        
        //2.写剧本
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        //3.设定关键帧
        let value0 = NSValue(CGPoint: layer.position)
        let value1 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y + 200))
        let value2 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y + 200))
        let value3 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y))
        let value4 = NSValue(CGPoint: layer.position)
        keyAnimate.values = [value0, value1, value2, value3, value4]
        
        /*keyAnimate.autoreverses = true
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 3.0*/
        
        let tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        let tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        keyAnimate.timingFunctions = [tf0, tf1 , tf2 , tf3]
        
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 12.0
        
        
        //4. start
        layer.addAnimation(keyAnimate, forKey: "keyAnimate")
    }
    
    func implicitAnimation () {
        myLayer.position.y += 300
    }
    
}