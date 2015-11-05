//
//  DataSource.h
//  Blocstagram
//
//  Created by Lyndon Bartlett on 10/12/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Media;

typedef void (^NewItemCompletionBlock)(NSError *error);

@interface DataSource : NSObject

+(instancetype) sharedInstance;
+ (NSString *) instagramClientID;

- (void) deleteMediaItem:(Media *)item;
- (void) replaceObjectInMediaItemsAtIndex:(NSUInteger)index withObject:(id)object;
- (void) removeObjectFromMediaItemsAtIndex:(NSUInteger)index;
- (void) insertObject:(Media *)object inMediaItemsAtIndex:(NSUInteger)index;
- (void) requestNewItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) requestOldItemsWithCompletionHandler:(NewItemCompletionBlock)completionHandler;
- (void) downloadImageForMediaItem:(Media *)mediaItem;
- (void) toggleLikeOnMediaItem:(Media *)mediaItem withCompletionHandler:(void (^)(void))completionHandler;
- (void) commentOnMediaItem:(Media *)mediaItem withCommentText:(NSString *)commentText;

@property (nonatomic, strong, readonly) NSString *accessToken;

@property (nonatomic, strong, readonly) NSArray *mediaItems;

@end