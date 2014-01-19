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
        self.casts = [self cast:dictionary[@"abridged_cast"]];
        self.thumbURL = [self getThumbURL:dictionary[@"posters"]];
        self.largeURL = [self getLargeURL:dictionary[@"posters"]];
    }
    return self;
}

- (NSString* )cast:(NSArray *)castArray{
    NSMutableString *castString = [[NSMutableString alloc]init];
    for(NSDictionary *dic in castArray){
        NSString *item = [dic objectForKey:@"name"];
        [castString appendString:item];
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


@end
