//
//  MediaTableViewCell.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/13/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Media;

@interface MediaTableViewCell : UITableViewCell

@property (nonatomic, strong) Media *mediaItem;

+(CGFloat) heightForMediaItem:(Media *)mediaItem width:(CGFloat)width;



@end
