//
//  TweetCell.swift
//  Twitter
//
//  Created by Jasmine Jahan on 9/28/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var reTweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    var favorited:Bool = false
    var tweetId:Int = -1
   
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId,
                                               success: { self.setRetweeted(true)},
                                               failure: { (error) in print("Fav did not succed: \(error)")})
    }
    
    func setRetweeted(_ isRetweeted:Bool) {
       
            if(isRetweeted){
                reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
                reTweetButton.isEnabled = false
            } else{
                reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
                reTweetButton.isEnabled = true
            }
    }
    
    @IBAction func favTweet(_ sender: Any) {
        
        let tobeFav = !favorited
        
        if(tobeFav){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId,
                                                   success: { self.setFav(true)},
                                                   failure: { (error) in print("Fav did not succed: \(error)")})
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId,
                                                     success: { self.setFav(false)},
                                                     failure: {(error) in print("UnFav did not succed: \(error)")})
        }
    }
   
    
    
    func setFav(_ isfav: Bool){
        favorited = isfav
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
