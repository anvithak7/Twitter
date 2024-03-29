# Project 3 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **16** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust its layout for iPhone 11, Pro and SE device sizes as well as accommodate device rotation.
- [X] User should display the relative timestamp for each tweet "8m", "7h"
- [X] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet and favorite.

The following **optional** features are implemented:

- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [X] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 280) (**1 point**)
- [X] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!
- [X] A user cannot type more than 280 characters while composing a tweet.

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How to simplify code when creating a profile view with multiple table views with a user's tweets, their liked tweets, and retweets and display it well.
2. Using UITextViews for the Tweets and making links and attachments in Tweets show up.
3. Making placeholder text disappear upon typing. I tried using RSKPlaceholderView, but that seems to be in Swift, and I wasn't able to successfully implement it into my project with the research I did.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/2FWfN38rVK.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/B5ne5ICRrq.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/b5B1wMBGX1.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/DR50JEoKAO.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


GIF created with [Kap](https://getkap.co/).

## Notes

Describe any challenges encountered while building the app.

Understanding how the Twitter API worked and the syntax for it, as well as trying to constrain everything perfectly within the screens was a challenge, as sometimes, autolayout would raise errors even when every logical constraint I could think of was placed, and having to fix constraints took much longer than placing them. Making the code efficient was also a challenge for this one for me, because of limitations with the given components for the UI and the way Twitter returned some information–even the seemingly simplest of tasks (like placing a profile picture on a new screen (which I did not have time to finish yet)) required extra methods in the APIManager and new endpoints to call, which were difficult to find within Twitter's documentation. Due to some of these issues, some of the features I wanted to add are not yet completed, although I hope to add them soon. I wanted text within a textview to disappear upon typing, but that required additional frameworks, and I couldn't find one easily for Objective C, nor could I unfortunately get the one in Swift working at all. I also had issues with slow network requests that caused unsightly and strange behavior in the time it took to load (everything except the contents of a tweet loading at a time, for example). I aim to find a way to make these faster and better.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [BDBOAuth1Manager](https://github.com/bdbergeron/BDBOAuth1Manager)
- [DateTools](https://github.com/MatthewYork/DateTools)

## License

    Copyright [2021] []

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
