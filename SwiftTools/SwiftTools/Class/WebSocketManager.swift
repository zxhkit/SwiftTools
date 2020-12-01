//
//  WebSocketManager.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2020/12/1.
//  Copyright © 2020 xuanhe. All rights reserved.
//

import UIKit
import Starscream





// MARK: - WebSocket代理
//这里即设置代理,稍后还会发通知.使用情况不一样.
protocol WebSocketManagerDelegate: class {
    /// 建立连接成功通知
    func webSocketManagerDidConnect(manager: WebSocketManager)
    /// 断开链接通知,参数 `isReconnecting` 表示是否处于等待重新连接状态。
    func webSocketManagerDidDisconnect(manager: WebSocketManager, error: Error?, isReconnecting: Bool)
    /// 接收到消息后的回调(String)
    func webSocketManagerDidReceiveMessage(manager: WebSocketManager, text: String)
    /// 接收到消息后的回调(Data)
    func webSocketManagerDidReceiveData(manager: WebSocketManager, data: Data)
    
    
    
}



class WebSocketManager: NSObject {
    /// 单例
    static let shard = WebSocketManager()
    /// WebSocket对象
    private var webSocket : WebSocket?
    /// 是否连接
    private var isConnected : Bool = false
    /// 代理
    weak var delegate: WebSocketManagerDelegate?

    private var heartbeatInterval: TimeInterval = 5

    var heartBeatTimer: Timer?
    
    
    
    
    lazy var line: UIView = {
        let ln = UIView()
        //设置
        ln.backgroundColor = UIColor.gray
        return ln
    }()
    
    /*
     @property (nonatomic, strong) NSTimer *heartBeatTimer; //心跳定时器
     @property (nonatomic, strong) NSTimer *netWorkTestingTimer; //没有网络的时候检测网络定时器
     */
    override init() {
//        webSocket.advancedDelegate = self

    }
    
    //初始化心跳
    private func initHeartBeat() {
        guard (self.heartBeatTimer != nil) else {
            return
        }
        
        
        
        self.heartBeatTimer = Timer(timeInterval: 1, target: self, selector: #selector(senderheartBeat), userInfo: nil, repeats: true)
        
        
    }
    
    //心跳
    @objc private func senderheartBeat() {
        
        
    }
    
    
    func connect(_ paremeters: Any?) {
        guard let url = URL(string: "http://localhost:8888") else {
            return
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 5
        
        //添加头信息
        request.setValue("headers", forHTTPHeaderField: "Cookie")
        request.setValue("CustomeDeviceInfo", forHTTPHeaderField: "DeviceInfo")
        webSocket = WebSocket(request: request)
        webSocket?.delegate = self

        webSocket?.connect()
        // 自定义队列,一般不需要设置,默认主队列
        //webSocket?.callbackQueue = DispatchQueue(label: "com.vluxe.starscream.myapp")

    }
    func sendMessage(_ text: String) {
        self.webSocket?.write(string: text, completion: nil)
    }
    func disconnect() {
        webSocket?.disconnect()
    }
    
}

extension WebSocketManager: WebSocketDelegate{
    func didReceive(event: WebSocketEvent, client: WebSocket) {
        switch event {
            case .connected(let headers):
                isConnected = true
                print("websocket is connected: \(headers)")
            case .disconnected(let reason, let code):
                isConnected = false
                print("websocket is disconnected: \(reason) with code: \(code)")
            case .text(let string):
                print("Received text: \(string)")
            case .binary(let data):
                print("Received data: \(data.count)")
            case .ping(_):
                print("ping")
                break
            case .pong(_):
                print("pong")
                break
            case .viabilityChanged(_):
                break
            case .reconnectSuggested(_):
                break
            case .cancelled:
                isConnected = false
            case .error(let error):
                isConnected = false
                handleError(error)
        }
    }
    
    /// 连接成功后的回调
    func websocketDidConnect(socket: WebSocketClient) {
        print(#function)
    }
    /// 断开连接后的回调
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print(#function)
    }
    
    /// 接收到消息后的回调(String)
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print(#function)
    }
    /// 接收到消息后的回调(Data)
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print(#function)
    }
    
    // custom
    func handleError(_ error: Error?) {
        if let e = error as? WSError {
            print("websocket encountered an error: \(e.message)")
        } else if let e = error {
            print("websocket encountered an error: \(e.localizedDescription)")
        } else {
            print("websocket encountered an error")
        }
    }
    
}
