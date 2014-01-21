//
//  SFMovieCell.h
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-17.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFMovieCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *synopsisLabel;
@property (nonatomic, weak)IBOutlet UILabel *casts;

@property (nonatomic, weak) IBOutlet UIImageView *image;


@end
