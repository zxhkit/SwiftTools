//
//  Extensions+File.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2021/7/14.
//  Copyright © 2021 xuanhe. All rights reserved.
//

import Foundation

/*
 当我们在用OC写APP的时候，如果想为现有的类添加方法又不想继承该类我们可能会想到创建一个Category来实现，那么我们的语言换成Swift如何解决这个问题？如何在Swift中创建Category？
 在Swift中并没有Category这样一个概念，但是你可以用Swift的Extensions来实现。

 Swift中Extension与OC中Category的不同点:

 它们不用命名
 如果你想给一个存在的类型定义一个extension去添加新的方法，这个新的方法将应用于该类型的所有实例，即使它们在extension定义前被创建。
 综上，它们不仅仅在定义某个类里面起作用，它们应用于整个项目。
 目前，Extension可以做的工作：

 添加computed propertie和computed static properties
 定义实例方法和类型方法
 提供新的初始化方法
 定义和使用新的内嵌类型
 创建已存在protocol的extension
 基本的生命语法如下：
 extension SomeType {

 }
 如何在你的项目中创建Extension文件

 command + n，在弹出的对话框中选择Swift File
 文件名称命名为你想创建分类的类名+你自定义的名字(eg:UIImage+Cropping)

 
 */
