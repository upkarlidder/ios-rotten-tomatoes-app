//
//  SFMovieDetailViewController.m
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-18.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import "SFMovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"
#import "SFMovieDetailCell.h"

@interface SFMovieDetailViewController ()
//@property(nonatomic, strong) SFMovie *movie;
@end

@implementation SFMovieDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SFMovieDetailCell *cell = (SFMovieDetailCell*) [tableView dequeueReusableCellWithIdentifier:@"MovieDetailCell"];
    
    //set up movie details inside the cell
    cell.movieTitleLabel.text = self.movie.title;
    cell.synopsisLabel.text = self.movie.synopsis;
    cell.castsLabel.text = self.movie.casts;
    NSURL *url = [NSURL URLWithString:self.movie.largeURL];
    [cell.image setImageWithURL:url];
    cell.criticsRatingLabel.text = [NSString stringWithFormat:@"%@ %@", [self.movie.criticRating stringValue],@"critics like it"];
    cell.userRatingLabel.text = [NSString stringWithFormat:@"%@ %@", [self.movie.userRating stringValue],@"users like it"];
    if([self.movie.userRating integerValue] < 50)
       [cell.userRatingImageView setImage:[UIImage imageNamed:@"thumbs_down_icon.png"]];
    else
        [cell.userRatingImageView setImage:[UIImage imageNamed:@"thumbs_up_icon.png"]];
    
    if([self.movie.criticRating integerValue] < 50)
        [cell.criticsRatingImageView setImage:[UIImage imageNamed:@"thumbs_down_icon.png"]];
    else
        [cell.criticsRatingImageView setImage:[UIImage imageNamed:@"thumbs_up_icon.png"]];
    
    return cell;
}

@end
