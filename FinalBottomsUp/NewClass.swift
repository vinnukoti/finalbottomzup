//
//  NewClass.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 09/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

//extension UIView
//{
//    
//    
//    
//    func createTopBorderWithHeight(height: CGFloat, color: UIColor) -> CALayer {
//        
//        return getOneSidedBorderWithFrame(CGRectMake(0, 0, self.frame.size.width, height), color:color)
//        
//    }
//    
//    
//    
//    func addTopBorderWithHeight(height: CGFloat, color:UIColor) {
//        
//        addOneSidedBorderWithFrame(CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height), color:color)
//        
//    }
//    
//    
//    
//    func createBottomBorderWithHeight(height: CGFloat, color:UIColor) -> CALayer {
//        
//        return getOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height-height, self.frame.size.width, height), color:color)
//        
//    }
//    
//    
//    
//    func addBottomBorderWithHeight(height: CGFloat, color:UIColor) {
//        
//        return addOneSidedBorderWithFrame(CGRectMake(7, self.frame.size.height-height, self.frame.size.width-14, height), color:color)
//        
//    }
//    
//    
//    
//    func addBottomBar(height: CGFloat, color:UIColor) {
//        
//        return addOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height, self.frame.size.width, height), color:color)
//        
//    }
//    
//    
//    
//    func addRightBar(width: CGFloat, color:UIColor) {
//        
//        return addOneSidedBorderWithFrame(CGRectMake(self.frame.origin.x + self.frame.size.width, self.frame.origin.y - 15, width, 50), color:color)
//        
//    }
//    
//    
//    
//    func addBottomRightBar(width: CGFloat, color:UIColor) {
//        
//        return addOneSidedBorderWithFrame(CGRectMake((self.frame.size.width - 10)/3 + 1, self.frame.size.height + 2, width, 66), color:color)
//        
//    }
//    
//    
//    
//    func addBottomRightBar2(width: CGFloat, color:UIColor) {
//        
//        return addOneSidedBorderWithFrame(CGRectMake(2*(self.frame.size.width - 10)/3 + 1, self.frame.size.height + 2, width, 66), color:color)
//        
//    }
//    
//    
//    
//    func addTopBar(height: CGFloat, color:UIColor){
//        
//        return addOneSidedBorderWithFrame(CGRectMake(0, self.frame.size.height + 68, self.frame.size.width, height), color:color)
//        
//    }
//    
//    
//    
//    func addRectBar(rect: CGRect, color:UIColor){
//        
//        return addOneSidedBorderWithFrame(rect, color: color)
//        
//    }
//    
//    
//    
//    func addBottomBorderToHeader(height: CGFloat, color:UIColor) {
//        
//        //var wid = self.superview?.frame.size.width
//        
//        //println("@bottomborder: \(self.frame.size.width)")
//        
//        return addOneSidedBorderWithFrame(CGRectMake(7, 0, self.frame.size.width-14 , height), color:color)
//        
//    }
//    
//    
//    
//    
//    
//    private func addOneSidedBorderWithFrame(frame: CGRect, color:UIColor) {
//        
//        let border = CALayer()
//        
//        border.frame = frame
//        
//        //println("@layerborder: \(self.frame.size.width)")
//        
//        border.backgroundColor = color.CGColor
//        
//        self.layer.addSublayer(border)
//        
//    }
//    
//    
//    
//    private func getOneSidedBorderWithFrame(frame: CGRect, color:UIColor) -> CALayer {
//        
//        let border = CALayer()
//        
//        border.frame = frame
//        
//        border.backgroundColor = color.CGColor
//        
//        return border
//        
//    }
//    
//    
//    
//}


extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        var border = CALayer()
        
        switch edge {
        case UIRectEdge.Top:
            border.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), thickness)
            break
        case UIRectEdge.Bottom:
            border.frame = CGRectMake(0, CGRectGetHeight(self.frame) - thickness, UIScreen.mainScreen().bounds.width, thickness)
            break
        case UIRectEdge.Left:
            border.frame = CGRectMake(0, 0, thickness, CGRectGetHeight(self.frame))
            break
        case UIRectEdge.Right:
            border.frame = CGRectMake(CGRectGetWidth(self.frame) - thickness, 0, thickness, CGRectGetHeight(self.frame))
            break
        default:
            break
        }
        
        border.backgroundColor = color.CGColor;
        
        self.addSublayer(border)
    }
    
    //let clr:UIColor = UIColor(hexString:"000000")
    
//    let s1: TheProtocol = Struct1()
//    s1.method1()
//    s1.method2()
    
}













