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
    cell.criticsRatingLabel.text = [self.movie.criticRating stringValue];
    cell.userRatingLabel.text = [self.movie.userRating stringValue];
    
    
    return cell;
}

@end
