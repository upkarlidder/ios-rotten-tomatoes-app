//
//  SFMovie.m
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-17.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import "SFMovie.h"

@implementation SFMovie

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.title = dictionary[@"title"];
        self.synopsis = dictionary[@"synopsis"];
        self.casts = [self parseCastArray:dictionary[@"abridged_cast"]];
        self.thumbURL = [self getThumbURL:dictionary[@"posters"]];
        self.largeURL = [self getLargeURL:dictionary[@"posters"]];
        self.userRating = [self getRating:dictionary[@"ratings"] ratingType:userRating];
        self.criticRating = [self getRating:dictionary[@"ratings"] ratingType:criticRating];

    }
    return self;
}

- (NSString* )parseCastArray:(NSArray *)castArray{
    NSMutableString *castString = [[NSMutableString alloc]init];
    int count = 1;
    for(NSDictionary *dic in castArray){
        NSString *item = [dic objectForKey:@"name"];
        [castString appendString:item];
        if(count < castArray.count)
            [castString appendString:@", "];
        count++;
    }

    return castString;
}

- (NSString* )getThumbURL:(NSDictionary *)movieDic{
    NSString *thumbURL = [[NSString alloc] initWithString:[movieDic objectForKey:@"thumbnail"]];
    return thumbURL;
}

- (NSString* )getLargeURL:(NSDictionary *)movieDic{
    NSString *largeURL = [[NSString alloc] initWithString:[movieDic objectForKey:@"detailed"]];
    return largeURL;
}

- (NSNumber *)getRating:(NSDictionary *)movieDic ratingType:(enum RatingsEnum) rating{
    
    NSNumber *result = [[NSNumber alloc]init];
    NSNumber *ratingNum = [[NSNumber alloc]init];
    
    switch (rating) {
        case userRating:
        {
            ratingNum = [movieDic objectForKey:@"audience_score"];
            break;
        }
        case criticRating:
        {
            ratingNum = [movieDic objectForKey:@"critics_score"];
            break;
        }
        default:
            break;
    }
    
    if(ratingNum && ratingNum > 0)
    {
        result = ratingNum;
    }

    return result;
}

@end
