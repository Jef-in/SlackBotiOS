//
//  SocketAPI.swift
//  slackBot
//
//  Created by Arun Aravindakshan on 31/03/19.
//  Copyright © 2019 Jefin. All rights reserved.
//

import Foundation
import Starscream
import SwiftyJSON

protocol SocketDelegate: class {
    func message(_ messageDict: String)
}

class SocketAPI: NSObject {
    static let shared = SocketAPI()
    var socket: WebSocket?
    
    var delegate: SocketDelegate?
    
    var isConnected: Bool? {
        return self.socket?.isConnected ?? false
    }
    
    func connect(url: URL){
        self.socket = WebSocket(url: url)
        socket?.delegate = self
        socket?.connect()
    }
    
    func disConnect() {
        socket?.disconnect()
        socket = nil
    }
    
    func sendMessage(id: Int, type: String, channelID: String, text: String) {
        let json: JSON = [Slack.param.id : id,
                          Slack.param.type : type,
                          Slack.param.channel : channelID,
                          Slack.param.text : text]
        if let string = json.rawString() {
            self.send(message: string)
        }
    }
    
    func send(message: String) {
        if let socket = self.socket {
            if socket.isConnected {
                socket.write(string: message)
            } else {
                return
            }
        }
    }
}

extension SocketAPI: WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
         print("Connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
          print("Disconnected")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        delegate?.message(text)
        print(text)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Recieve Data")
    }
}
