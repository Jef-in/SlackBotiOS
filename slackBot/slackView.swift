//
//  slackView.swift
//  slackBot
//
//  Created by Arun Aravindakshan on 31/03/19.
//  Copyright © 2019 Jefin. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
class slackView:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    override func viewDidLoad() {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Slack.param.user.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "slackcell", for: indexPath) as! slackCell
//        let url = Slack.param.image as! URL
//        cell.Profimage.kf.setImage(with:url)
//        cell.profname.text = Slack.param.profile[indexPath.row]
        let profile = Slack.param.image_32 as! URL
        cell.Profimage.kf.setImage(with:profile)
        return cell
    }
}
