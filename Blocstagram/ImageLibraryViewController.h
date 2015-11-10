//
//  ImageLibraryViewController.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 11/9/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <UIKit/UIKit.h>



@class ImageLibraryViewController;

@protocol ImageLibraryViewControllerDelegate <NSObject>

- (void) imageLibraryViewController:(ImageLibraryViewController *)imageLibraryViewController didCompleteWithImage:(UIImage *)image;

@end

@interface ImageLibraryViewController : UICollectionViewController

@property (nonatomic, weak) NSObject <ImageLibraryViewControllerDelegate> *delegate;


@end
