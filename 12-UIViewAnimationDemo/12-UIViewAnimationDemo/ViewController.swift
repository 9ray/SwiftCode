//
//  ViewController.swift
//  12-UIViewAnimationDemo
//
//  Created by Vinson on 16/3/19.
//  Copyright © 2016年 VinsonLei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mFirtView: UIView!
    
    @IBOutlet weak var mSecondView: UIView!
    
    //记录FirstView的原始位置
    var mOriginFrame1 : CGRect!
    var mOriginFrame2 : CGRect!
    
    var mFirstSubView : UIView!
    var mOirginFrameSubvie: CGRect! = CGRect(x: 5 , y: 5, width: 50 , height: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mOriginFrame1 = self.mFirtView.frame
        self.mOriginFrame2 = self.mSecondView.frame
        
        self.mFirstSubView = UIView(frame: self.mOirginFrameSubvie)
        self.mFirstSubView.backgroundColor = UIColor.purpleColor()
        self.mFirtView.addSubview(mFirstSubView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startBtnClicked(sender: AnyObject) {
       // self.optionalAnimate()
        
        //操作子视图
        //self.operateSubView()
        
        self.replaceView()
    }

    
    @IBAction func fallbackBtnClicked(sender: AnyObject) {
        self.mFirtView.frame = mOriginFrame1
        self.mFirtView.layer.removeAllAnimations()
        
        self.mSecondView.frame = mOriginFrame2
        self.mSecondView.layer.removeAllAnimations()
        
        self.mFirstSubView.frame = mOirginFrameSubvie
    }
    
    func basicAnimate() {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.mFirtView.frame.origin.x += 100
        })
    }
    
    func optionalAnimate() {
        UIView.animateWithDuration(2.0, delay: 0.0, options: UIViewAnimationOptions.Repeat , animations: { () -> Void in
            self.mFirtView.frame.origin.x += 100
            
            UIView.animateWithDuration(10.0, delay: 0.0, options: UIViewAnimationOptions.OverrideInheritedDuration, animations: { () -> Void in
                self.mSecondView.frame.origin.x += 100
                
                }, completion: {(finish) -> Void in print("inner animate finished")})
            
            }) { (finish) -> Void in
                print("outter animate finished")
        }
        
    }
    
    func beginCommitAnimate() {
        //1. 声明动画开始并配置动画属性
        UIView.beginAnimations("testAnimate", context: nil)
        UIView.setAnimationDuration(2.0)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationWillStartSelector("animationDidStart")
        UIView.setAnimationDidStopSelector("animationDidStop:finished:")
        
        //2.操作视图
        self.mFirtView.backgroundColor = UIColor.magentaColor()
        
        //3.提交视图
        UIView.commitAnimations()
    }
    
    override func animationDidStart(anim: CAAnimation) {
        print("Animation Start")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("Animation Stop")
    }
    
    //MARK: Operate SubView
    func operateSubView() {
        UIView.transitionWithView(self.mFirtView, duration: 2.0, options: UIViewAnimationOptions.TransitionCurlUp, animations: { () -> Void in self.mFirstSubView.frame.origin.x += 200
            self.mFirstSubView.hidden = true
            }) { (finish) -> Void in print("Finished")}
    }
    
    func replaceView() {
        let view = UIView(frame: CGRect(x: 50, y: 400, width: 268, height: 68))
        view.backgroundColor = UIColor.magentaColor()
        UIView.transitionFromView(mSecondView, toView: view, duration: 2.0, options: UIViewAnimationOptions.TransitionCurlUp) { (finish) -> Void in print("finished")}
    }
}

