//
//  DataSource.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/12/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DataSource : NSObject

+(instancetype) sharedInstance;
@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end
