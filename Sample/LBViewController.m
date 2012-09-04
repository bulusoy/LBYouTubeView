//
//  LBViewController.m
//  LBYouTubeView
//
//  Created by Laurin Brandner on 27.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LBViewController.h"
#import "LBYouTubePlayerViewController.h"

@implementation LBViewController

@synthesize controller;

- (void)dealloc {
    self.controller.delegate = nil;
}

-(void)viewDidLoad {
    [super viewDidLoad];
	
    self.controller = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=u1zgFlCw8Aw"]];
    self.controller.delegate = self;
    self.controller.quality = LBYouTubePlayerQualityLarge;
    self.controller.view.frame = CGRectMake(-10.0f, -10.0f, 1.0f, 1.0f);
    self.controller.view.center = self.view.center;
    [self.view addSubview:self.controller.view];
    //only to test, you sould use notifications!
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(test:) userInfo:nil repeats:NO];
}

-(void) test:(id) sender {
    if(self.controller.view.controller.loadState == MPMovieLoadStatePlayable) {
        [self.controller.view.controller setFullscreen:YES];
    } else {
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(test:) userInfo:nil repeats:NO];
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
