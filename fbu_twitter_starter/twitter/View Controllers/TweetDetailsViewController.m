//
//  TweetDetailsViewController.m
//  twitter
//
//  Created by Anvitha Kachinthaya on 7/1/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import "TweetDetailsViewController.h"
#import "Tweet.h"
#import "APIManager.h"

@interface TweetDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *replyButton;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UIButton *messageButton;

@end

@implementation TweetDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userLabel.text = self.tweet.user.name;
    self.screenNameLabel.text = [@"@" stringByAppendingString:self.tweet.user.screenName];
    self.tweetLabel.text = self.tweet.text;
    NSString *URLString = self.tweet.user.profilePicture;
    NSURL *url = [NSURL URLWithString:URLString];
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:urlData];
    self.profileView.image = nil;
    self.profileView.image = image;
    self.fullDateLabel.text = self.tweet.createdAtString;
    [self refreshData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
