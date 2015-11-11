//
//  MediaTests.m
//  Blocstagram
//
//  Created by Lyndon Bartlett on 11/11/15.
//  Copyright © 2015 Lyndon Bartlett. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "Media.h"

@interface MediaTests : XCTestCase

@end

@implementation MediaTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testThatMediaInitializationWorks {
    
    NSDictionary *sourceDictionary = @{@"id": @"8675309",
                                       @"username" : @"d'oh",
                                       @"full_name" : @"Homer Simpson",
                                       @"profile_picture" : @"http://www.example.com/example.jpg",
                                       @"caption": @{@"text" : @"Caption goes here"},};
                                       
    
    Media *testMedia = [[Media alloc] initWithDictionary:sourceDictionary];
    
    XCTAssertEqualObjects(testMedia.idNumber, sourceDictionary[@"id"], @"ID should be equal");
    XCTAssertEqual(testMedia.caption, sourceDictionary[@"caption"][@"text"], @"Caption should be equal");
                                      }

@end
