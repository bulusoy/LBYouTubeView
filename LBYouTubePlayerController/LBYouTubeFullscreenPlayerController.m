//
//  LBYouTubeFullscreenPlayerController.m
//  LBYouTubeView
//
//  Created by Valerii Ivanov on 9/5/12.
//
//

#import "LBYouTubeFullscreenPlayerController.h"
#import "LBYouTubePlayerViewController.h"

@implementation LBYouTubeFullscreenPlayerController

@synthesize youtubeURL;
@synthesize statusBarStyle;

-(void) _setup {
    //self.controller = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:self.youtubeURL];
}

-(id)initWithYouTubeURL:(NSURL *)URL {
    self = [super init];
    if (self) {
        self.youtubeURL = URL;
        [self _setup];
    }
    return self;
}

-(id)initWithYouTubeID:(NSString *)youTubeID {
    self = [super init];
    if (self) {
        self.youtubeURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", youTubeID]];
        [self _setup];
    }
    return self;
}

#pragma mark -
#pragma mark UIViewController methods

-(void) viewDidLoad {
    [super viewDidLoad];
    [self setWantsFullScreenLayout:YES];
    self.controller = [[LBYouTubePlayerViewController alloc] initWithYouTubeURL:self.youtubeURL];
    self.controller.quality = LBYouTubePlayerQualityLarge;
    self.controller.view.frame = self.view.bounds;
    [self.view addSubview:self.controller.view];
    [self setupControls];
}

#pragma mark -
#pragma mark UI setup

-(void) setupControls {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Done" forState:UIControlStateNormal];
    button.frame = CGRectMake(10, 10, 100, 40);
    [button addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark -
#pragma mark Actions

-(void) doneAction:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark LBYouTubePlayerViewControllerDelegate

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL {
    NSLog(@"Did extract video source:%@", videoURL);
}

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller failedExtractingYouTubeURLWithError:(NSError *)error {
    NSLog(@"Failed loading video due to error:%@", error);
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark -
#pragma Other methods

-(void) showControls:(BOOL)show {
    if(show) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    } else {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}

-(void) setFullScreen:(BOOL)fullscreen {
    if(fullscreen) {
        self.statusBarStyle = [[UIApplication sharedApplication] statusBarStyle];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:self.statusBarStyle];
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}
@end
