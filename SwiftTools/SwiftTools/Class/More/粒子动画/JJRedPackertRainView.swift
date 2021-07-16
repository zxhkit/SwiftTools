//
//  JJRedPackertRainView.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/16.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJRedPackertRainView: UIView {

    private var timer:Timer?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickRed(_:)))
        self.addGestureRecognizer(tap)
        backgroundColor = .white
        layer.borderWidth = 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func clickRed(_ sender:UITapGestureRecognizer) {
        let point = sender.location(in: self)
        for i in  0..<(self.layer.sublayers?.count ?? 0){
            let layer = self.layer.sublayers?[i]
            if ((layer?.presentation()?.hitTest(point)) != nil) {
                JJLog("第\(i)")
                
                let hasRedPacketd = i%3 == 0
                let packert = UIImageView()
                if hasRedPacketd {
                    packert.image = UIImage(named: "rp_yes")
                    packert.frame = CGRect(x: 0, y: 0, width: 32, height: 74)
                } else {
                    packert.image = UIImage(named: "rp_no")
                    packert.frame = CGRect(x: 0, y: 0, width: 32, height: 76.5)
                }
                layer?.contents = packert.image?.cgImage
                
                let alertView = UIView()
                alertView.layer.cornerRadius = 5
                alertView.frame = CGRect(x: point.x-50, y: point.y, width: 100, height: 30)
                addSubview(alertView)
                
                let lbl = UILabel()
                lbl.font = UIFont.systemFont(ofSize: 24)
                if hasRedPacketd {
                    
                    let str = "+" + String(i) + "金币"
                    let iStr = String(i)
                    
                    let attStr = NSMutableAttributedString(string: str)
                    attStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 27), range: NSRange(location: 0, length: 1))
                    attStr.addAttribute(.font, value: UIFont(name: "PingFangTC-Semibold", size: 32)!, range: NSRange(location: 1, length: iStr.count))
                    lbl.textColor = .red
                    lbl.attributedText = attStr
                    
                } else {
                    lbl.text = "旺旺年,人旺旺"
                    lbl.textColor = UIColor.green
                }
                alertView.addSubview(lbl)
                lbl.frame = CGRect(x: point.x-50, y: point.y, width: 100, height: 50)
                lbl.center = alertView.center
                
                UIView.animate(withDuration: 1) {
                    alertView.alpha = 0
                    alertView.frame = CGRect(x: point.x - 50, y: point.y - 100, width: 100, height: 30)
                } completion: { finished in
                    alertView.removeFromSuperview()
                }
            }
        }
        
        
    }
    
    func startRedPackerts() {
        timer = Timer.scheduledTimer(timeInterval: 0.25, target: self, selector: #selector(showRain), userInfo: nil, repeats: true)
        
    }
    
    func endAnimation() {
        timer = nil
        for i in 0..<(self.layer.sublayers?.count ?? 0) {
            let layer = self.layer.sublayers?[i]
            layer?.removeAllAnimations()
        }
    }
    
    @objc private func showRain()  {
        let imgV = UIImageView(image: UIImage(named: "red"))
        imgV.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        
        let moveLayer = CALayer()
        moveLayer.bounds = imgV.frame
        moveLayer.anchorPoint = CGPoint(x: 0, y: 0)
        moveLayer.position = CGPoint(x: 0, y: -32)
        moveLayer.contents = imgV.image?.cgImage
        layer.addSublayer(moveLayer)
        
        addAnimation(moveLayer)
    }
    
    private func addAnimation(_ moveLayer:CALayer) {
        
//        let pointX = arc4random()%414
        
        let moveAnimation = CAKeyframeAnimation(keyPath: "position")
        let A = NSValue(cgPoint: CGPoint(x: Int(arc4random())%414, y: 0))
        let B = NSValue(cgPoint: CGPoint(x: CGFloat(arc4random()%414), y: bounds.height))

        moveAnimation.values = [A,B]
        moveAnimation.duration = Double(arc4random() % 200) / 100.0 + 3.5
        moveAnimation.repeatCount = 1
        moveAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        moveAnimation.isRemovedOnCompletion = true
        moveLayer.add(moveAnimation,forKey: "moveAnimation")

//        let tranAnimation = CAKeyframeAnimation(keyPath: "transform")
//        let r0 = CATransform3DMakeRotation(CGFloat(Double.pi)/180.0 * CGFloat(arc4random()%360), 0, 0, -1)
//        let r1 = CATransform3DMakeRotation(CGFloat(Double.pi)/180.0 * CGFloat(arc4random()%360), 0, 0, -1)
//        tranAnimation.values = [NSValue(caTransform3D: r0),NSValue(caTransform3D: r1)]
//        tranAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        tranAnimation.duration = Double(arc4random() % 200) / 100.0 + 3.5
//
//        //为了避免旋转动画完成后再次回到初始状态
//        tranAnimation.fillMode = CAMediaTimingFillMode.forwards
//        tranAnimation.isRemovedOnCompletion = true
//        moveLayer.add(tranAnimation,forKey: "tranAnimation")
        
    }
    

}
