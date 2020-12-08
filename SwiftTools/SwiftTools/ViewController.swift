//
//  ViewController.swift
//  SwiftTools
//
//  Created by zhouxuanhe on 2020/9/2.
//  Copyright © 2020 xuanhe. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 50);
        button.backgroundColor = .red
        view.addSubview(button)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 3
        
        button.rx.tap.subscribe { (Void) in
             print("tap")
            self.tap()
        } onError: { (Error) in
            self.tap()
        } onCompleted: {
            self.tap()
        } onDisposed: {
            self.tap()
        }.disposed(by: DisposeBag())
        
        let scrollView = UIScrollView()
        
        scrollView.rx.contentOffset.subscribe { (contentOffset) in
            
        }.disposed(by: DisposeBag())
        
        
        
        NotificationCenter.default.rx.notification(Notification.Name.NSExtensionHostWillEnterForeground).subscribe { (notification) in
            print(notification)
        }.disposed(by: DisposeBag())
        
        
        
        Observable.of(1,2,3)
        
    }
    
    
    
    
    func tap() {
        loadData { (str) in
            numa()
        }
    }
    
    func loadData(success: (String) -> ()) {
        
    }
    
    func numa()  {
        
    }


}

