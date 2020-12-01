//
//  WebSocketManager.swift
//  SwiftTools
//
//  Created by 播呗网络 on 2020/12/1.
//  Copyright © 2020 xuanhe. All rights reserved.
//

import UIKit
import Starscream

class WebSocketManager: NSObject {
    /// 单例
    static let shard = WebSocketManager()
    /// WebSocket对象
    private var webSocket : WebSocket?

    private var isConnected : Bool = false
    
    func connect(_ paremeters: Any?) {
        guard let url = URL(string: "http://localhost:8888") else {
            return
        }

        var request = URLRequest(url: url)
        request.timeoutInterval = 1000
        request.setValue("headers", forHTTPHeaderField: "Cookie")
        request.setValue("CustomeDeviceInfo", forHTTPHeaderField: "DeviceInfo")
        webSocket = WebSocket(request: request)
        webSocket?.delegate = self
        webSocket?.connect()
    }
    func sendMessage(_ text: String) {
        self.webSocket?.write(string: text, completion: nil)
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
    
    func websocketDidConnect(socket: WebSocketClient) {
        print(#function)
    }
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print(#function)
    }
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print(#function)
    }
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
