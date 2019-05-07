//
//  SlackConstants.swift
//  slackBot
//
//  Created by Arun Aravindakshan on 31/03/19.
//  Copyright © 2019 Jefin. All rights reserved.
//

import Foundation
enum SlackID: String {
    //Enter the details from your respective account
    case botUser = "bot name"
    case botToken = "xxxx-xxxxxxxxxx-xxxxxxxxx-xxxxxxxxxxxx"
    case ClientID = "xxxxxxxxxx.xxxxxxxxxxxx"
    case ClientSecret = "xxxxxxxxxxxxxx"
    case VerificationToken = "xxxxxxxxxx"
    case SlackID = "xxxx-xxxxxxxx-xxxxxxxxxxxxxxxxx-xxxxxxxxxxxxxx"
}
struct Slack {
 
    struct URL {
        struct rtm {
            static let start = "https://slack.com/api/rtm.start";
        }
        
        struct channels {
            static let create = "https://slack.com/api/channels.create";
            static let join = "https://slack.com/api/channels.join";
            static let invite = "https://slack.com/api/channels.invite";
            static let channelList = "https://slack.com/api/channels.list"
        }
    }

    struct param {
        static let token = "token";
        static let ok = "ok";
        static let url = "url";
        static let channels = "channels";
        static let name = "name";
        static let channel = "channel";
        static let id = "id";
        static let type = "type";
        static let text = "text";
        static let users = "users";
        static let user = "user";
        static let profile = "profile";
        static let image_32 = "image_32";
        static let color = "color";
        static let connect = "connect"
        
        static let image = "image";
        static let image_data = "image_data";
    }
    struct type {
        static let message = "message";
        static let user_typing = "user_typing";
    }
   
    struct token {
        static let bot = SlackID.botToken.rawValue
        static let admin = SlackID.SlackID.rawValue
    }
    
    struct misc {
        static let usernames = ["Jefin","Suraj"];
        static let bot_name = SlackID.botUser.rawValue
    }
}

struct MessageCenter {
    // Dictionary keys for NSUserDefaults
    struct prefs {
        static let channelID = "channel_id";
    }
    // Notification types as used in the Message Center
    struct notification {
        static let newMessage = "new_message";
        static let userTyping = "user_typing";
    }
}
