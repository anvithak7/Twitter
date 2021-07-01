//
//  TweetCell.h
//  twitter
//
//  Created by Anvitha Kachinthaya on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "TimelineViewController.h"


NS_ASSUME_NONNULL_BEGIN

@interface TweetCell : UITableViewCell
@property (nonatomic, strong) Tweet *tweet;
@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *messageButton;

+ (void) updateCellFromTweet:(Tweet*) tweetObj;

@end

NS_ASSUME_NONNULL_END
