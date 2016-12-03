//
//  TakeALookCell.m
//  AmericanDiveBars
//
//  Created by spaculus on 9/15/15.
//  Copyright (c) 2015 spaculus. All rights reserved.
//

#import "TakeALookCell.h"
#import "YouTubeView.h"

@interface TakeALookCell () <YTPlayerViewDelegate>

@end

@implementation TakeALookCell

- (void)awakeFromNib {
    // Initialization code
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)imageTapped:(id)sender {
    // Create image info
    JTSImageInfo *imageInfo = [[JTSImageInfo alloc] init];
    //imageInfo.image = self.imgLarge;
    imageInfo.placeholderImage = [UIImage imageNamed:@"bar-gallery-large-placeholder.png"];
    imageInfo.imageURL = self.imgLargeURL;
    imageInfo.referenceRect = self.imgYoutubeThumbnail.frame;
    imageInfo.referenceView = self.imgYoutubeThumbnail.superview;
    imageInfo.referenceContentMode = self.imgYoutubeThumbnail.contentMode;
    imageInfo.referenceCornerRadius = self.imgYoutubeThumbnail.layer.cornerRadius;
    
    // Setup view controller
    JTSImageViewController *imageViewer = [[JTSImageViewController alloc]
                                           initWithImageInfo:imageInfo
                                           mode:JTSImageViewControllerMode_Image
                                           backgroundStyle:JTSImageViewControllerBackgroundOption_Blurred];
    
    
    if ([[self delegate] respondsToSelector:@selector(presentImageViewController:)]) {
        [[self delegate] presentImageViewController:imageViewer];
    }

}

- (void)tapOnYoutubeView:(id)sender {
    if ([[self delegate] respondsToSelector:@selector(tapYoutubeVideo:)]) {
        [[self delegate] tapYoutubeVideo:self.bar_video_link];
    }
}



-(void)configureCellForYoutube {
    
    
    
    [self.playerView clearVideo];
    self.playerView.delegate = self;
    NSDictionary *playerVars = @{
                                 @"playsinline" : @1,
                                 };
    [self.playerView loadWithVideoId:self.youtubeID playerVars:playerVars];
    

    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnYoutubeView:)];
//    tap.numberOfTapsRequired = 1;
//    tap.numberOfTouchesRequired = 1;
//    [self.imgYoutubeThumbnail addGestureRecognizer:tap];
//    
//    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnYoutubeView:)];
//    tap2.numberOfTapsRequired = 1;
//    tap2.numberOfTouchesRequired = 1;
//    [self.imgPlayVideo addGestureRecognizer:tap2];
}


- (void)playerViewDidBecomeReady:(YTPlayerView *)playerView {
    NSLog(@"First Time");    
    self.playerView.hidden = NO;
    self.imgYoutubeThumbnail.hidden = YES;
}
- (void)playerView:(YTPlayerView *)playerView didChangeToQuality:(YTPlaybackQuality)quality {
}
- (void)playerView:(YTPlayerView *)playerView receivedError:(YTPlayerError)error {
}

- (void)playerView:(YTPlayerView *)playerView didChangeToState:(YTPlayerState)state {
    switch (state) {
        case kYTPlayerStatePlaying:
            NSLog(@"Started playback");
            break;
        case kYTPlayerStatePaused:
            NSLog(@"Paused playback");
            break;
            
        case kYTPlayerStateEnded:
            [playerView stopVideo];
            [playerView clearVideo];
            NSLog(@"End playback");
            break;
        default:
            break;
    }
}

-(void)configureCellWithURL :(NSURL *)imgURL {
    self.imgLargeURL = imgURL;
    [self.imgYoutubeThumbnail setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.imgYoutubeThumbnail addGestureRecognizer:tap];
}
@end
