//
//  FilterCollectionViewCell.m
//
//  Blocstagram
//
//  Created by Lyndon Bartlett on 11/10/15.
//
//
#import "FilterCollectionViewCell.h"
#import "PostToInstagramViewController.h"

@interface FilterCollectionViewCell () <UICollectionViewDelegate>

@end

@implementation FilterCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}



@end
