//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/13/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media, MediaTableViewCell;

@protocol MediaTableViewCellDelegate <NSObject>

- (void) cell:(MediaTableViewCell *)cell didTapImageView:(UIImageView *)imageView;
- (void) cell:(MediaTableViewCell *)cell didLongPressImageView:(UIImageView *)imageView;
- (void) cell:(MediaTableViewCell *)cell didTapWithTwoFingersImageView:(UIImageView *)imageView;
- (void) cellDidPressLikeButton:(MediaTableViewCell *)cell;

@end

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic, strong) Media *mediaItem;
@property (nonatomic, weak) id <MediaTableViewCellDelegate> delegate;

+(CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width;



@end
