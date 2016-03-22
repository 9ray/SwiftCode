//
//  ViewController.swift
//  11-UIPageControlDemo
//
//  Created by Vinson on 16/3/18.
//  Copyright © 2016年 VinsonLei. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIScrollViewDelegate{

    @IBOutlet weak var scrollView1: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView1.backgroundColor = UIColor.redColor()
        scrollView1.contentSize = CGSize(width: 320*4, height: 568)
        //scrollView1.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //scrollView1.contentOffset = CGPoint(x: 10, y: 10)
        scrollView1.indicatorStyle = UIScrollViewIndicatorStyle.White
        scrollView1.delegate = self
        
        let aView = UIView(frame: CGRect(x: 0*320, y: 0, width: 320, height: 568))
        aView.backgroundColor = UIColor.yellowColor()
        
        let bView = UIView(frame: CGRect(x: 1*320, y: 0, width: 320, height: 568))
        bView.backgroundColor = UIColor.greenColor()
        
        let cView = UIView(frame: CGRect(x: 2*320, y: 0, width: 320, height: 568))
        cView.backgroundColor = UIColor.blueColor()
        
        scrollView1.addSubview(aView)
        scrollView1.addSubview(bView)
        scrollView1.addSubview(cView)
        
        pageControl.addTarget(self, action: "pageChaged", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //让pageControl跟着变动,要计算当前的偏移量
        let curPage = scrollView.contentOffset.x/320
        //pageControl设定当前页
        pageControl.currentPage = Int(curPage)
    }
    
    func pageChaged () {
        let curPage = pageControl.currentPage
        scrollView1.scrollRectToVisible(CGRect(x: curPage*320, y: 0, width: 320, height: 568), animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

