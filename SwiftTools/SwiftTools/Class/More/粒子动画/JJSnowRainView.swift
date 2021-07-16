//
//  JJSnowRainView.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJSnowRainView: UIView {

    var emitterArr = [CAEmitterCell]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //通过CAEmitterLayer可以很原生的创造粒子效果
        let emitter = CAEmitterLayer()
        let rect = CGRect(x: 0, y: -100, width: self.bounds.width, height: self.bounds.height+100)
        emitter.backgroundColor = UIColor.black.cgColor
        emitter.frame = rect
        layer.addSublayer(emitter)
        
        // kCAEmitterLayerPoint 将所有的粒子集中在position的位置,可用来做火花爆炸效果
        // kCAEmitterLayerLine 所有的粒子位于一条线上,可用来作瀑布效果
        // kCAEmitterLayerRectangle 所有粒子随机出现在所给定的矩形框内
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        emitter.emitterPosition = CGPoint(x: rect.width/2, y: 0)
        emitter.emitterSize = rect.size
        
        for i in 1...11 {
            snow("Fireworks_\(i)")
        }
        
        emitter.emitterCells = emitterArr
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func snow(_ imageName: String) {
        //一个cell代表一个微粒
        let emitterCell = CAEmitterCell()
        emitterCell.contents = UIImage(named: imageName)!.cgImage
        
        //每秒创建的cell速度
        emitterCell.birthRate = Float(arc4random()%5 + 10)
        //cell的声明周期
        emitterCell.lifetime = Float(arc4random()%4 + 2)
        
        //制造一个y轴的加速度
        emitterCell.yAcceleration = CGFloat(arc4random()%50 + 100)
        
        //速度
//        emitterCell.velocity = 20.0
        //给微粒设置一个发射角度
        emitterCell.emissionLongitude = CGFloat(-Double.pi)
        
//        emitterCell.scale = 0.8
        
        //添加随机的速度,如果有velocity,那么范围为 -180 ~ 220
        emitterCell.velocityRange = CGFloat(arc4random()%80 + 90)
        
        emitterCell.emissionRange = CGFloat(Double.pi / 2)
        
        emitterCell.lifetimeRange = 18
        
        emitterCell.redRange = 0.3
        emitterCell.greenRange = 0.3
        emitterCell.blueRange = 0.3

        // 随机大小
        emitterCell.scaleRange = 0.8
        // 每秒缩小15%
        emitterCell.scaleSpeed = -0.05
        emitterCell.alphaRange = 0.75
        emitterCell.alphaSpeed = -0.15
        
        emitterArr.append(emitterCell)
        
    }
    
    
    
    
    
}


/*
 @property(nullable, copy) NSString *name; // 粒子名字， 默认为nil,有了名字才能找到对应的粒子
 @property(getter=isEnabled) BOOL enabled;
 @property float birthRate; // 粒子的产生率，默认0
 @property float lifetime; // 粒子的生命周期,默认0，以秒为单位。
 @property float lifetimeRange; // 粒子的生命周期的范围，默认0，以秒为单位。
 @property CGFloat emissionLatitude;// 指定纬度,纬度角代表了在x-z轴平面坐标系中与x轴与z轴之间的夹角，默认0
 @property CGFloat emissionLongitude; // 指定经度,经度角代表了在x-y轴平面坐标系中与x轴与y轴之间的夹角，默认0
 @property CGFloat emissionRange; //发射角度范围,默认0
 @property CGFloat velocity; // 速度，默认是0
 @property CGFloat velocityRange; //速度范围，默认是0
 @property CGFloat xAcceleration; // 在x方向上的重力加速度分量,默认是0
 @property CGFloat yAcceleration;// 在y方向上的重力加速度分量,默认是0
 @property CGFloat zAcceleration;// 在z方向上的重力加速度分量,默认是0
 @property CGFloat scale; // 粒子在生命周期范围内的缩放比例, 默认是1
 @property CGFloat scaleRange; // 缩放比例范围,默认是0
 @property CGFloat scaleSpeed; // 在生命周期内的缩放速度,默认是0,负数缩小，正数放大;
 @property CGFloat spin; // 粒子的平均旋转速度，默认是0
 @property CGFloat spinRange; // 自旋转角度范围，弧度制,默认是0
 @property(nullable) CGColorRef color; // 粒子的颜色,默认白色
 @property float redRange; // 粒子的颜色red,green,blue,alpha能改变的范围,默认0
 @property float greenRange;
 @property float blueRange;
 @property float alphaRange;
 @property float redSpeed; // 粒子速度red,green,blue,alpha在生命周期内的改变的速度,默认都是0
 @property float greenSpeed;
 @property float blueSpeed;
 @property float alphaSpeed;
 @property(nullable, strong) id contents; // 粒子的内容，设置为CGImageRef的对象
 @property CGRect contentsRect;//粒子内容的位置
 @property CGFloat contentsScale; //粒子内容的缩放比例
 @property(copy) NSString *minificationFilter;//缩小的过滤器（基本不用）
 @property(copy) NSString *magnificationFilter;//放大的过滤器（基本不用）
 @property float minificationFilterBias;
 @property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells; // 粒子里面的粒子
 @property(nullable, copy) NSDictionary *style;
 
 */
