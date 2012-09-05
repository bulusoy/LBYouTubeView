//
//  LBYouTubeFullscreenPlayerController.h
//  LBYouTubeView
//
//  Created by Valerii Ivanov on 9/5/12.
//
//

#import <Foundation/Foundation.h>

@class LBYouTubePlayerViewController;

@interface LBYouTubeFullscreenPlayerController : UIViewController {
    LBYouTubePlayerViewController* controller;
    NSURL* youtubeURL;
    UIStatusBarStyle statusBarStyle;
}

@property (nonatomic, strong) LBYouTubePlayerViewController* controller;
@property (nonatomic, strong) NSURL* youtubeURL;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

-(id)initWithYouTubeURL:(NSURL *)URL;
-(id)initWithYouTubeID:(NSString *)youTubeID;

// Set fullscreen
-(void) setFullScreen:(BOOL)fullscreen;
// Show controls
-(void) showControls:(BOOL)show;

@end
