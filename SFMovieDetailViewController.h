//
//  SFMovieDetailViewController.h
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-18.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFMovie.h"

@interface SFMovieDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *movieTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *synopsisLabel;
@property (nonatomic, weak)IBOutlet UILabel *castsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *image;
@property (nonatomic, weak) IBOutlet UIImageView *userRatingImageView;
@property (nonatomic, weak) IBOutlet UIImageView *criticsRatingImageView;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@property (nonatomic, weak) SFMovie *movie;

@end
