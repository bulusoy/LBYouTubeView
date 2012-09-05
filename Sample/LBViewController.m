//
//  LBViewController.m
//  LBYouTubeView
//
//  Created by Laurin Brandner on 27.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LBViewController.h"
#import "LBYouTubeFullscreenPlayerController.h"

@implementation LBViewController


- (void)dealloc {
}

-(void)viewDidLoad {
    [super viewDidLoad];
}


-(IBAction)buttonPressed:(id)sender {
    LBYouTubeFullscreenPlayerController *controller = [[LBYouTubeFullscreenPlayerController alloc] initWithYouTubeURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=u1zgFlCw8Aw"]];
    [controller setFullScreen:YES];
    [self presentModalViewController:controller animated:YES];
}


-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

@end
