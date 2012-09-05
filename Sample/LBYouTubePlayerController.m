//
//  LBYouTubePlayerController.m
//  LBYouTubeView
//
//  Created by Laurin Brandner on 29.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LBYouTubePlayerController.h"
#import <AVFoundation/AVFoundation.h>

@interface LBYouTubePlayerController () 

@property (nonatomic, strong) AVPlayer* player;
@property (nonatomic, strong) AVPlayerLayer* playerLayer;

-(void)_setup;

@end
@implementation LBYouTubePlayerController

@synthesize player;
@synthesize playerLayer;

#pragma mark Initialization

-(id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _setup];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _setup];
    }
    return self;
}

-(void)_setup {
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor blackColor];
}

#pragma mark -
#pragma mark Other Methods

-(void) layoutSubviews {
    [super layoutSubviews];
    self.playerLayer.frame = self.bounds;
}

-(void)loadYouTubeVideo:(NSURL *)URL {
    if (self.player) {
        [self.playerLayer removeFromSuperlayer];
    }
    
    self.player = [AVPlayer playerWithURL:URL];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.bounds;
    [self.layer addSublayer:self.playerLayer];
    [self.player play];
//    [self.controller prepareToPlay];
//    self.controller.shouldAutoplay = YES;
//    self.controller.useApplicationAudioSession = NO;
//    self.controller.controlStyle = MPMovieControlStyleEmbedded;
//    self.controller.view.frame = self.bounds;
//    self.controller.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    [self addSubview:self.controller.view];
}

#pragma mark -

@end
