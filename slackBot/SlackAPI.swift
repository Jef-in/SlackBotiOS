//
//  SlackAPI.swift
//  slackBot
//
//  Created by Arun Aravindakshan on 31/03/19.
//  Copyright © 2019 Jefin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class SlackAPI: NSObject {

    static let sharedInstance = SlackAPI();
    
    func rtm_start(completion: @escaping (String, String) -> Void)
    {
        var botID: String?
        Alamofire.request(Slack.URL.rtm.start, method: .get, parameters: [Slack.param.token: Slack.token.bot] as [String : Any], encoding: URLEncoding.default).responseJSON {
            response in
            
            if response.error != nil
            {
                print(response.error?.localizedDescription ?? "");
                return;
            }
            
            let json = JSON(response.data ?? Data());
            
            print(json);
            
            if let users = json[Slack.param.users].array
            {
                for user in users
                {
                    // Figure out user ID of bot
                    if user[Slack.param.name].string != nil && user[Slack.param.name].stringValue == Slack.misc.bot_name
                    {
                        botID = user[Slack.param.id].string ?? ""
                        print("BotID: ", user[Slack.param.id].string ?? "")
                    }
                    
                    // Store user data in RSMessageCenterAPI for later reference
                    var user_data = [String: AnyObject]();
                    
                    if  let id = user[Slack.param.id].string,
                        let profile = user[Slack.param.profile].dictionary,
                        let color = user[Slack.param.color].string,
                        let image = profile[Slack.param.image_32]?.string
                    {
                        user_data[Slack.param.color] = color as AnyObject;
                        user_data[Slack.param.image] = image as AnyObject;
                        print("UserData: ", user_data)
                    }
                }
            }
            
            // Get websocket URL and call completion closure
            if let url = json[Slack.param.url].string
            {
                completion(url, botID ?? "");
            }
            
        }
    }
    


    func channels_join(channel_name:String, completion: @escaping (_ channelID: String) -> Void)
    {
//        Alamofire.request(Slack.URL.channels.join, method: .get, parameters: [Slack.param.token: Slack.token.admin, Slack.param.name: channel_name] as [String : Any], encoding: JSONEncoding.default, headers: nil)
//            .responseJSON { response in
        Alamofire.request(Slack.URL.channels.join, method: .get ,parameters: [Slack.param.token: Slack.token.admin, Slack.param.name: channel_name] as [String : Any]).responseJSON { response in
            if response.error != nil
            {
                print(response.error?.localizedDescription ?? "");
                return;
            }
            
            let json = JSON(response.data!);
            print(json)
            if  let channel = json[Slack.param.channel].dictionary,
                let channelID = channel[Slack.param.id]?.string
            {
                completion(channelID);
            }
        }
    }
    

    func getChannelList() {
        Alamofire.request(Slack.URL.channels.channelList, method: .get, parameters: [Slack.param.token : Slack.token.admin], encoding: URLEncoding.default).responseJSON { (response) in
            if response.error != nil
            {
                print(response.error?.localizedDescription ?? "");
                return;
            }
            let json = JSON(response.data ?? Data());
            
            print(json);
        }
    }
    
    func channels_invite(channelID:String, userID:String, completion: (() -> Void)?)
    {
        Alamofire.request(Slack.URL.channels.invite, method: .get, parameters: [Slack.param.token: Slack.token.admin, Slack.param.channel: channelID, Slack.param.user: userID]).responseJSON { response in
            
            if response.error != nil
            {
                print(response.error?.localizedDescription ?? "");
                return;
            }
            
            let json = JSON(response.data ?? Data());
            
            print(json);
            
            if(completion != nil)
            {
                completion!();
            }
        }
    }
}
