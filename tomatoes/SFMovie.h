//
//  SFMovie.h
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-17.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFMovie : NSObject
- (id) initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property(nonatomic, strong) NSString *casts;
@property(nonatomic, strong)NSString *thumbURL;
@property(nonatomic, strong)NSString *largeURL;
@end
