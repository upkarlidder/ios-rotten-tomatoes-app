//
//  SFModelTest.m
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-18.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SFMovie.h"


@interface SFModelTest : XCTestCase

@end

@implementation SFModelTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testModelCanGetCastMembersFromJSONArray
{
//    NSString *abridgedCast = [NSString alloc] initWithString:@"";
    
}

- (void) testModelCastsParsingMethod{
    SFMovie *movie = [[SFMovie alloc]init];
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"Tom Hanks" forKey:@"name"];
    [arr addObject:dic];
    dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"Julia Roberts" forKey:@"name"];
    [arr addObject:dic];
    dic = [[NSMutableDictionary alloc]init];
    [dic setObject:@"Jennifer Lawrance" forKey:@"name"];
    [arr addObject:dic];

    NSString *expected = @"Tom Hanks, Julia Roberts, Jennifer Lawrance";
    
    NSString *actual = [movie parseCastArray:arr];
    
    XCTAssertEqualObjects(expected, actual, @"");
    
    
    NSLog(@"done");
}

- (void) testGetCriticRatingMethod{
    
    NSMutableDictionary *ratingDictionary = [[NSMutableDictionary alloc]init];
    [ratingDictionary setObject:@"Certified Fresh" forKey:@"critics_rating"];
    [ratingDictionary setObject:[[NSNumber alloc] initWithInt:70] forKey:@"critics_score"];
    [ratingDictionary setObject:@"Certified Fresh" forKey:@"audience_rating"];
    [ratingDictionary setObject:[[NSNumber alloc] initWithInt:70] forKey:@"audience_score"];
    
    SFMovie *movie = [[SFMovie alloc]init];
//    enum RatingsEnum userRating = userRating;
    
    NSNumber *cRating = [movie getRating:ratingDictionary ratingType:criticRating];
    NSLog(@"%@",[cRating class]);

    XCTAssertEqualObjects(cRating, [[NSNumber alloc]initWithInt:70], @"");
}
@end
