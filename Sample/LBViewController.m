//
//  LBViewController.m
//  LBYouTubeView
//
//  Created by Laurin Brandner on 27.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LBViewController.h"
#import "LBYouTubePlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation LBViewController

@synthesize controller;

- (void)dealloc {
    self.controller.delegate = nil;
}

-(void)viewDidLoad {
    [super viewDidLoad];
	NSError *activationError = nil;
    [[AVAudioSession sharedInstance] setActive: YES error: &activationError];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
}


-(IBAction)buttonPressed:(id)sender {
    [activityView startAnimating];
    self.controller = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=u1zgFlCw8Aw"]];
    self.controller.delegate = self;
    self.controller.quality = LBYouTubePlayerQualityLarge;
    self.controller.view.frame = CGRectMake(-10.0f, -10.0f, 1.0f, 1.0f);
    //self.controller.view.center = self.view.center;
    [self.view addSubview:self.controller.view];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.controller.view.controller];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(exitFullScreen) name:MPMoviePlayerDidExitFullscreenNotification object:self.controller.view.controller];
}

-(void) exitFullScreen:(NSNotification*)notification {
    [self.controller.view removeFromSuperview];
    self.controller = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void) playbackStateChanged {
    
    if(self.controller.view.controller.loadState & MPMovieLoadStatePlayable) {
        [activityView stopAnimating];
        [self.controller.view.controller setFullscreen:YES];
        [self.controller.view.controller.
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    }
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark - 
#pragma mark LBYouTubePlayerViewControllerDelegate

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL {
    NSLog(@"Did extract video source:%@", videoURL);
    
}

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller failedExtractingYouTubeURLWithError:(NSError *)error {
    NSLog(@"Failed loading video due to error:%@", error);
}

@end
