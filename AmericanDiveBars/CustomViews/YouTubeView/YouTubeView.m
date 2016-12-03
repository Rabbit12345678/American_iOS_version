//
//  YouTubeView.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/22/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "YouTubeView.h"

@interface YouTubeView () <UIWebViewDelegate>


@end

@implementation YouTubeView

- (IBAction)playYouTubeVideo:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(playYoutubeVideo:)]) {
        [[self delegate] playYoutubeVideo:self];
    }
}

-(void)configureYoutubeViewWithURL:(NSString *)youtubeURL {
    if ([youtubeURL length]==0) {
        return;
    }else {
        [self playVideoWithID:self.youtubeID forURL:youtubeURL];
    }
    
}

- (void)playVideoWithID:(NSString *)videoID forURL:(NSString *)urlString
{
    
    NSMutableString *embedHTML = [NSMutableString string];
    [embedHTML appendString:@"<html>"];
    [embedHTML appendString:@"<head>"];
    [embedHTML appendString:@"<style type=\"text/css\">"];
    [embedHTML appendString:@"body {"];
    [embedHTML appendString:@"background-color: transparent;"];
    [embedHTML appendString:@"color: white;"];
    [embedHTML appendString:@"margin: 0;"];
    [embedHTML appendString:@"}"];
    [embedHTML appendString:@"</style>"];
    [embedHTML appendString:@"</head>"];
    [embedHTML appendString:@"<body>"];
    [embedHTML appendFormat:@"<iframe id=\"ytplayer\" type=\"text/html\" width=\"%0.0f\" height=\"%0.0f\" src=\"http://www.youtube.com/embed/%@\" allowfullscreen=\"true\" allowScriptAccess=\"always\" frameborder=\"0\"/>", 304.0, 160.0, videoID];
    [embedHTML appendString:@"</body>"];
    [embedHTML appendString:@"</html>"];
    
    
    
    [self.webView setAllowsInlineMediaPlayback:YES];
    [self.webView setMediaPlaybackRequiresUserAction:NO];
    [self.webView loadHTMLString:embedHTML baseURL:nil];
    self.webView.delegate = self;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissMoviewPlayer:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    NSLog(@"start");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}
- (void)webViewDidFinishLoad:(UIWebView *)_webView {
    NSLog(@"end");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//    [self webViewStopLoading];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"error");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self webViewStopLoading];
}

-(void)webViewStopLoading {
    [self.webView stopLoading];
    if ([[self delegate] respondsToSelector:@selector(hideYoutubeVideo)]) {
        [[self delegate] hideYoutubeVideo];
    }
}

-(void)dismissMoviewPlayer:(NSNotification *)notif {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [self webViewStopLoading];
}

@end
