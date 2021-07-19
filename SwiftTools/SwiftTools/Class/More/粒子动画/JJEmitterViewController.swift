//
//  JJEmitterViewController.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/15.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import UIKit

class JJEmitterViewController: JJBaseViewController {
    
    var snowView:JJSnowRainView?
    var redPackertView:JJRedPackertRainView?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationViewTitle("粒子动画")

        let btn = createCustomButton("清除", 0, CGRect(x: KScreenWidth-120, y: kStatusBarHeight, width: 80, height: kNavBarContentHeight))
        navigationCustomView.addSubview(btn)
        
        
        _ = createCustomButton("动画1", 1, CGRect(x: 30, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画2", 2, CGRect(x: 120, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画3", 3, CGRect(x: 210, y: kNavBarHeight+40, width: 80, height: 40))
        _ = createCustomButton("动画4", 4, CGRect(x: 300, y: kNavBarHeight+40, width: 80, height: 40))
        
        _ = createCustomButton("动画5", 5, CGRect(x: 30, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("动画6", 6, CGRect(x: 120, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("动画7", 7, CGRect(x: 210, y: kNavBarHeight+100, width: 80, height: 40))
        _ = createCustomButton("pushVC", 8, CGRect(x: 300, y: kNavBarHeight+100, width: 80, height: 40))
        
    }
    
    override func buttonCustomClick(_ button: UIButton) {
        let tag = button.tag
        switch tag {
        case 0:
           test0()
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
    
    func test0() {
        snowView?.removeFromSuperview()
        snowView = nil
        redPackertView?.removeFromSuperview()
        redPackertView = nil
    }
    func test1() {
        
        snowView = JJSnowRainView(frame: CGRect(x: 0, y: kNavBarHeight*2, width: KScreenWidth, height: KScreenHeight-kNavBarHeight*2))
        snowView?.layer.masksToBounds = true
        view.addSubview(snowView!)
          
         
    }
    func test2() {
        redPackertView = JJRedPackertRainView(frame: CGRect(x: 0, y: kNavBarHeight*2, width: KScreenWidth, height: KScreenHeight-kNavBarHeight*2))
        view.addSubview(redPackertView!)
        redPackertView?.startRedPackerts()
    }
    func test3() {
        
    }
    func test4() {
        
    }
    func test8() {
        let vc = JJEmitterLayerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    

}


/*
 
 CAEmitterLayer与CAEmitterCell
 
 CAEmitterLayer是CALayer的一个常用子类,CALayer的子类有很多,如果能很好的是用会有意想不到的效果
 
 CAEmitterLayer: 发射器,用于控制粒子效果
 CAGradientLayer: 梯度层,用于控制颜色渐变
 CAEGLayer: 用于OpenGL SE绘制图层
 CAReplicationLayer: 用于自动复制subLayer
 CAScrollerLayer: 用于管理可滑动的区域
 
 CATransformLayer: 用于渲染3D Layer的层次结构
 CATiledLayer: 用于管理一副可以被分割的大图
 CATextLayer: 用来绘制AttributeString
 CAShaperLayer: 用于绘制立体的贝塞尔曲线
 
 1.基本介绍
 - CAEmitterLayer是粒子发射源,用来发射粒子,它所发射的粒子就是CAEmitterCell,当然粒子可以发射粒子.我们可以将CAEmitterLayer比作是CAEmitterCell的容器,它会按照你的设置来以不同的样式不断产生粒子，也就是CAEmitterCell.
 
 - CAEmitterCell则决定了粒子自身的一些特征，例如速度，加速度，发射的范围，颜色等等。这些属性大多是以“中间值”配合一个范围值的方式来表示的。
 
 原理其实很简单,但是要花时间去理解属性,只有很好的用它的属性,才能达到炫酷的效果.
 查看API会发现CAEmitterLayer和CAEmitterCell的属性都是很多的,并且有很多相同的属性.
 在EMitterLayer中,一些属性决定了粒子从什么样的集合特性上发射出来,这个集合特性包括了位置/形状/大小,
 并且还有一些渲染属性,用于一些渲染的效果.
 另外一些属性CAEmitterLayer和CAEmitterCell都有的,在这里会迷糊,但是API说的很清楚,CAEMitterLayer
 的这些属性会作为CAEmitterCell相同的系数,举个🌰,如果CAEmitterCell的birthRate = 10(每秒产生的粒子数量),
 其所属的CAEmitterLayer的birthRate = 2,那么在其他参数默认的情况下,
 这个CAEmitterCell总的每秒产生的粒子数量是10 * 2 = 20个.也就是每秒产生20个这样的粒子.
 
 另外会发现CAEmitterCell的很多属性都带有一些Range,比如:
 scaleRange/velocityRange,这些决定粒子自身的一些特性的属性大多都是以'中间值'+'范围(Range)'的方式表达的
 再举个🌰,比如scale = 0.5(缩放值)和scakeRange = 0.2(缩放范围),那么实际CAEmitterCell的左方就是:
 scale±scaleRange,即0.3~0.7这个范围.
 
 CAEmitterLayer常用属性:
  
 open var emitterCells: [CAEmitterCell]?  // 用来装粒子种类的数组
 open var birthRate: Float   // 粒子产生的系数(倍数),默认1.0
 open var lifetime: Float    // 粒子的生命周期系数(倍数), 默认1.0,可以做成动画
 open var emitterPosition: CGPoint  // 决定粒子发射位置的中心点  , Animatable
 open var emitterZPosition: CGFloat  // 粒子发射位置 : 三维立体中的位置 , Animatable
 open var emitterSize: CGSize     // 发射源的尺寸大小
 open var emitterDepth: CGFloat   // 发射源的深度
 open var emitterShape: CAEmitterLayerEmitterShape   //发射源的发射形状  默认是点point，（还有line,rectangle,circle,cuboid,sphere）
 open var emitterMode: CAEmitterLayerEmitterMode  // 发射模式,默认是volume，（还有points,outline,surface）.
 open var renderMode: CAEmitterLayerRenderMode   // 渲染模式,默认是unordered,还有oldestFirst,oldestLast,backToFront,additive
 open var preservesDepth: Bool   //是否需要深度（一般使用这个属性）
 open var velocity: Float  // 粒子基本速度系数(倍数), 默认1.0
 open var scale: Float  // 粒子缩放比例系数(倍数), 默认1.0
 open var spin: Float   // 粒子自旋转速度系数(倍数), 默认1.0
 open var seed: UInt32  // 随机数发生器,用于初始化随机数产生的种子

 
 CAEmitterLayer的属性都在这里了,但是实际情况中很多用不上,下面我们重点介绍一些属性
 CAEmitterLayer控制发射源发射位置和形状的属性
 - emitterPosition:决定发射源的中心点
 - emitterSize:决定发射源的大小
 - emitterShape:表示粒子从什么形状发射出来，它并不是表示粒子自己的形状。
 
 emitterShape是一个枚举:
 
 kCAEmitterLayerPoint 点形状，发射源的形状就是一个点
 kCAEmitterLayerLine 线形状，发射源的形状是一条线
 kCAEmitterLayerRectangle 矩形状，发射源的形状是一个矩形
 kCAEmitterLayerCuboid 立体矩形形状(3D)，发射源是一个立体矩形，这里要生效的话需要设置z方向的数据，如果不设置就同矩形状.
 kCAEmitterLayerCircle 圆形形状，发射源是一个圆形
 kCAEmitterLayerSphere 立体圆形(3D)，三维的圆形，同样需要设置z方向数据，不设置则如同二维的圆.

 - emitterMode: 发射模式,它的作用其实就是进一步决定发射的区域是在发射形状的哪一部份。
 
 kCAEmitterLayerPoints 点模式，发射器是以点的形式发射粒子。
                发射点就是形状的某个特殊的点，比如shap是一个点的话，那么这个点就是中心点，如果是圆形，那么就是圆心。
 kCAEmitterLayerOutline 轮廓模式，从形状的边界上发射粒子。
 kCAEmitterLayerSurface 表面模式，从形状的表面上发射粒子。
 kCAEmitterLayerVolume 是相对于3D形状的物体内部发射.

 
 我们用发射形状的kCAEmitterLayerLine来说明一下。
 当你的CAEmitterLayer的emitterSize为CGSize（10， 10）时，
 你的所选择的emitterPosition为CGPoint（10,10）。
 那么形状为“Line”的CAEmitterLayer就会在如下图紫色的直线上产生粒子，
 对于“Line”来说，emitterSize的高度是被忽略的。

  
- renderMode:渲染模式，决定了粒子是以怎么一种形式进行渲染的。
 
 kCAEmitterLayerUnordered 粒子是无序出现的
 kCAEmitterLayerOldestFirst 声明时间长的粒子会被渲染在最上层
 kCAEmitterLayerOldestLast 声明时间短的粒子会被渲染在最上层
 kCAEmitterLayerBackToFront 粒子的渲染按照Z轴的前后顺序进行
 kCAEmitterLayerAdditive 进行粒子混合


 
    
 CAEmitterCell常用属性:
 
 open var name: String?  //粒子名字， 默认为nil,有了名字才能找到对应的粒子
 open var isEnabled: Bool   //粒子是否被渲染
 open var birthRate: Float   //粒子的产生率，默认0
 open var lifetime: Float   //粒子的生命周期,默认0，以秒为单位。
 open var lifetimeRange: Float   // 粒子的生命周期的范围，默认0，以秒为单位。

 open var emissionLatitude: CGFloat  // 指定纬度,纬度角代表了在x-z轴平面坐标系中与x轴与z轴之间的夹角，默认0
 open var emissionLongitude: CGFloat  // 指定经度,经度角代表了在x-y轴平面坐标系中与x轴与y轴之间的夹角，默认0
 open var emissionRange: CGFloat  //发射角度范围,默认0
 open var velocity: CGFloat   // 速度，默认是0
 open var velocityRange: CGFloat  //速度范围，默认是0
 open var xAcceleration: CGFloat   // 在x方向上的重力加速度分量,默认是0
 open var yAcceleration: CGFloat   // 在y方向上的重力加速度分量,默认是0
 open var zAcceleration: CGFloat   // 在z方向上的重力加速度分量,默认是0
 open var scale: CGFloat      // 粒子在生命周期范围内的缩放比例, 默认是1
 open var scaleRange: CGFloat   // 缩放比例范围,默认是0
 open var scaleSpeed: CGFloat   // 在生命周期内的缩放速度,默认是0,负数缩小，正数放大;
 open var spin: CGFloat      // 粒子的平均旋转速度，默认是0
 open var spinRange: CGFloat   // 自旋转角度范围，弧度制,默认是0
 open var color: CGColor?     // 粒子的颜色,默认白色
 open var redRange: Float      // 粒子的颜色red,green,blue,alpha能改变的范围,默认0
 open var greenRange: Float
 open var blueRange: Float
 open var alphaRange: Float

 open var redSpeed: Float   // 粒子速度red,green,blue,alpha在生命周期内的改变的速度,默认都是0
 open var greenSpeed: Float
 open var blueSpeed: Float
 open var alphaSpeed: Float

 open var contents: Any?   // 粒子的内容，设置为CGImageRef的对象
 open var contentsRect: CGRect   //粒子内容的位置
 open var contentsScale: CGFloat   //粒子内容的缩放比例

 open var minificationFilter: String   //缩小的过滤器（基本不用）
 open var magnificationFilter: String   //放大的过滤器（基本不用）
 open var minificationFilterBias: Float

 open var emitterCells: [CAEmitterCell]?   // 粒子里面的粒子

 
 
 
 
 CAEmitterCell决定粒子运行轨迹的属性
 
 emissionLongitude:表示粒子飞行方向跟水平坐标轴(X轴)之间的夹角,默认是0,顺时针方向是正方向
 
 例如emisiionLongitude为0,则粒子顺着x轴飞行,
 如果想沿着y轴向下飞行,那么可以设置emissionLoongitude=Double.pi/2
 
 emissionLatitude:这个和emissionLongitude的原理是一样的,只不过是哎三维平面上的x-z轴上,z与x的夹角
 

 
 */

 




