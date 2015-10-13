//
//  Comment.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/12/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) NSString *idNumber;

@property (nonatomic, strong) User *from;
@property (nonatomic, strong) NSString *text;

@end
