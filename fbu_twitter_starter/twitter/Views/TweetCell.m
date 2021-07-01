//
//  TweetCell.m
//  twitter
//
//  Created by Anvitha Kachinthaya on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    if (!self.tweet.favorited) {
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
             self.tweet.favorited = YES;
             self.tweet.favoriteCount += 1;
             self.notFavorited.alpha = 0;
             self.favorited.alpha = 1;
             [self refreshData];
         }
     }];
    }
    else if (self.tweet.favorited) {
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
                 self.tweet.favorited = NO;
                 self.tweet.favoriteCount -= 1;
                 self.notFavorited.alpha = 1;
                 self.favorited.alpha = 0;
                 [self refreshData];
             }
         }];
        
    }
}

- (IBAction)didTapRetweet:(id)sender {
    if (!self.tweet.retweeted) {
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
             self.tweet.retweeted = YES;
             self.tweet.retweetCount += 1;
             self.notRetweeted.alpha = 0;
             self.retweeted.alpha = 1;
             [self refreshData];
         }
     }];
    }
    else if (self.tweet.retweeted) {
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
                 self.tweet.retweeted = NO;
                 self.tweet.retweetCount -= 1;
                 self.notRetweeted.alpha = 1;
                 self.retweeted.alpha = 0;
                 [self refreshData];
             }
         }];
    }
}

- (void) refreshData {
    self.replyCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.replyCount];
    self.retweetCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteCountLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    if (self.tweet.retweeted) {
        self.notRetweeted.alpha = 0;
        self.retweeted.alpha = 1;
    } else if (!self.tweet.retweeted) {
        self.notRetweeted.alpha = 1;
        self.retweeted.alpha = 0;
    }  if (!self.tweet.favorited) {
        self.notFavorited.alpha = 1;
        self.favorited.alpha = 0;
    }
}
@end
