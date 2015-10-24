//
//  MediaFullScreenViewController.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/24/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaFullScreenViewController : UIViewController

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype) initWithMedia:(Media *)media;

- (void) centerScrollView;

@end