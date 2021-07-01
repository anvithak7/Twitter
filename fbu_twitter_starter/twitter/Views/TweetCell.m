//
//  TweetCell.m
//  twitter
//
//  Created by Anvitha Kachinthaya on 6/30/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"
#import "Tweet.h"
#import "TimelineViewController.h"
#import <DateTools/DateTools.h>

@implementation TweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self refreshData];

    // Configure the view for the selected state
}
- (IBAction)didTapFavorite:(id)sender {
    if (self.tweet.favorited == NO) {
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
         }
        [self refreshData];
     }];
    }
    else if (self.tweet.favorited == YES) {
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
             }
            [self refreshData];
         }];
    }
}

- (IBAction)didTapRetweet:(id)sender {
    if (self.tweet.retweeted == NO) {
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
    [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
         if(error){
              NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
         }
         else {
             NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
         }
        [self refreshData];
     }];
    }
    else if (self.tweet.retweeted == YES) {
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        [[APIManager shared] unRetweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
             if(error){
                  NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
             }
             else {
                 NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
             }
            [self refreshData];
         }];
    }
}

- (void) refreshData {
    [self.replyButton setTitle:[NSString stringWithFormat:@"%d", self.tweet.replyCount] forState:UIControlStateNormal];
    [self.retweetButton setTitle:[NSString stringWithFormat:@"%d", self.tweet.retweetCount] forState:UIControlStateNormal];
    [self.favoriteButton setTitle:[NSString stringWithFormat:@"%d", self.tweet.favoriteCount] forState:UIControlStateNormal];
    if (self.tweet.retweeted == YES) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateNormal];
    } if (self.tweet.retweeted == NO) {
        [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    }
    if (self.tweet.favorited == YES) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateNormal];
    } if (self.tweet.favorited == NO) {
        [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    }
}

- (void) updateCellFromTweet:(Tweet*) tweetObj :(TweetCell*) tweetCell {
    tweetCell.userLabel.text = tweetObj.user.name;
    tweetCell.tweetLabel.text = tweetObj.text;
    NSString *URLString = tweetObj.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:urlData];
    tweetCell.profilePicture.image = nil;
    tweetCell.profilePicture.image = image;
    tweetCell.screenNameLabel.text = [@"@" stringByAppendingString:tweetObj.user.screenName];
    tweetCell.dateLabel.text = tweetObj.shortDateString;
    tweetCell.tweet = tweetObj;
}

@end
