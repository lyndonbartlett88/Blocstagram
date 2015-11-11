//
//  CommentText.m
//  Blocstagram
//
//  Created by Lyndon Bartlett on 11/11/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ComposeCommentView.h"

@interface CommentComposeTest : XCTestCase

@end

@implementation CommentComposeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testCommentComp {
    ComposeCommentView *commentViewTest = [[ComposeCommentView alloc] init];
    [commentViewTest setText:@"test"];
    XCTAssertTrue(commentViewTest.isWritingComment);
    [commentViewTest setText:@""];
    XCTAssertFalse(commentViewTest.isWritingComment);
}


@end
