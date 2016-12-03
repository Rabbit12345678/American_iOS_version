//
//  YouTubeView.h
//  AmericanDiveBars
//
//  Created by spaculus on 9/22/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YouTubeView;

@protocol YouTubeViewDelegate <NSObject>

-(void)playYoutubeVideo:(YouTubeView *)youtubeView;

@optional
-(void)hideYoutubeVideo;

@end

@interface YouTubeView : UIView
@property (strong, nonatomic) id<YouTubeViewDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString * bar_video_link;
@property (strong, nonatomic) NSString * youtubeID;

-(void)webViewStopLoading;
- (IBAction)playYouTubeVideo:(id)sender;
-(void)configureYoutubeViewWithURL:(NSString *)youtubeURL;
@end
