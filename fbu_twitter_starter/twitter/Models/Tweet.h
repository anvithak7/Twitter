//
//  Tweet.h
//  twitter
//
//  Created by Anvitha Kachinthaya on 6/28/21.
//  Copyright © 2021 Emerson Malca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <DateTools/DateTools.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tweet : NSObject
//Properties
@property (nonatomic, strong) NSString *idStr; // For favoriting, retweeting & replying
@property (nonatomic, strong) NSString *text; // Text content of tweet
@property (nonatomic) int replyCount; // Update reply count label
@property (nonatomic) int favoriteCount; // Update favorite count label
@property (nonatomic) BOOL favorited; // Configure favorite button
@property (nonatomic) int retweetCount; // Update favorite count label
@property (nonatomic) BOOL retweeted; // Configure retweet button
@property (nonatomic, strong) User *user; // Contains Tweet author's name, screenname, etc.
@property (nonatomic, strong) NSString *createdAtString; // Display date
@property (nonatomic, strong) NSString *shortDateString; // Display short time ago

// For Retweets
@property (nonatomic, strong) User *retweetedByUser;  // user who retweeted if tweet is retweet

// Methods
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (NSMutableArray *)tweetsWithArray:(NSArray *)dictionaries;

@end

NS_ASSUME_NONNULL_END
