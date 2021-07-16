//
//  JJEmitterLayerViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/16.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJEmitterLayerViewController: JJBaseViewController {

    
//    var colorBallLayer:CAEmitterLayer?
    
    var bgView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("粒子动画说明案例")

        view.backgroundColor = .black

        
        _ = createCustomButton("动画1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画4", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 80, height: 40))
        
        _ = createCustomButton("动画5", 5, CGRect(x: 30, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("动画6", 6, CGRect(x: 120, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("动画7", 7, CGRect(x: 210, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("动画8", 8, CGRect(x: 300, y: kNavBarHeight+100, width: 80, height: 40))
        
        
        bgView.backgroundColor = .black
        bgView.frame = CGRect(x: 0, y: kNavBarHeight+200, width: KScreenWidth, height: KScreenHeight-kNavBarHeight-200)
        view.addSubview(bgView)
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.white.cgColor
        
    }
    
    override func buttonCustomClick(_ button: UIButton) {
        let tag = button.tag
        switch tag {
        case 1:
           test1()
        case 2:
            test2()
        case 3:
            test3()
        case 4:
            test4()
        case 8:
            test8()
        default:
            break
        }
    }
    
    func test1()  {
        
        let colorBallLayer = CAEmitterLayer()
        bgView.layer.addSublayer(colorBallLayer)
        
        //发射源的尺寸大小
        colorBallLayer.emitterSize = CGSize(width: 200, height: 200)
        //粒子发射形状的中心点
        colorBallLayer.emitterPosition = CGPoint(x: 200, y: 200)
        //发射源的形状
        colorBallLayer.emitterShape = .rectangle
        //发射模式
        colorBallLayer.emitterMode = .surface
        
        // 2. 配置CAEmitterCell
        let colorBallCell = CAEmitterCell()
        //粒子名称
        colorBallCell.name = "colorBallCell";
        //粒子产生率,默认为0
        colorBallCell.birthRate = 20
        //粒子生命周期
        colorBallCell.lifetime = 10
//        粒子速度,默认为0
//        colorBallCell.velocity = 40
        //粒子速度平均量
//        colorBallCell.velocityRange = 100
        //x,y,z方向上的加速度分量,三者默认都是0
        colorBallCell.yAcceleration = 15
//        //指定纬度,纬度角代表了在x-z轴平面坐标系中与x轴之间的夹角，默认0:
//        colorBallCell.emissionLongitude = CGFloat(Double.pi/2) // 向左
//        //发射角度范围,默认0，以锥形分布开的发射角度。角度用弧度制。粒子均匀分布在这个锥形范围内;
//        colorBallCell.emissionRange = CGFloat(Double.pi/4) // 围绕X轴向左90度
        // 缩放比例, 默认是1
        colorBallCell.scale = 0.1
        // 缩放比例范围,默认是0
        colorBallCell.scaleRange = 0.1
//        
        // 在生命周期内的缩放速度,默认是0
        colorBallCell.scaleSpeed = 0.02
        // 粒子的内容，为CGImageRef的对象
        colorBallCell.contents = UIImage(named: "circle_white")?.cgImage
        //颜色
        colorBallCell.color = UIColor.init(red: 0.5, green: 0, blue: 0.5, alpha: 1).cgColor
        // 粒子颜色red,green,blue,alpha能改变的范围,默认0
        colorBallCell.redRange = 1
        colorBallCell.greenRange = 1
        colorBallCell.alphaRange = 0.8
        // 粒子颜色red,green,blue,alpha在生命周期内的改变速度,默认都是0
        colorBallCell.blueSpeed = 1
        colorBallCell.alphaSpeed = -0.1
        
        colorBallLayer.emitterCells = [colorBallCell]

        
    }
    
    
    
    func test2()  {
    }
    func test3()  {
    }
    func test4()  {
    }
    func test5()  {
    }
    func test6()  {
    }
    func test7()  {
    }
    func test8()  {
    }
    
    
    
    
    
    
    
    

}
