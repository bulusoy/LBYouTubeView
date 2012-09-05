//
//  LBYouTubePlayerController.h
//  LBYouTubeView
//
//  Created by Laurin Brandner on 29.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVPlayer;
@class AVPlayerLayer;

@interface LBYouTubePlayerController : UIView {
    AVPlayer* player;
    AVPlayerLayer *playerLayer;
}

@property (nonatomic, strong, readonly) AVPlayer* player;
@property (nonatomic, strong, readonly) AVPlayerLayer* playerLayer;

-(void)loadYouTubeVideo:(NSURL*)URL;

@end
