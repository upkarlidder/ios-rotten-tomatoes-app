//
//  SFMovieDetailViewController.m
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-18.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import "SFMovieDetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface SFMovieDetailViewController ()

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    [self.scrollView setContentSize:CGMakeSize(contentWidth,contentHeight)];
    
//    
//    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    [self.view addSubview:scrollView];
//    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    
//    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(scrollView);
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics: 0 viewsDictionary:viewsDictionary]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics: 0 viewsDictionary:viewsDictionary]];
    
    
//    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.movieTitleLabel.text = self.movie.title;
    self.synopsisLabel.text= self.movie.synopsis;
    self.castsLabel.text = self.movie.casts;
    [self loadImageFromURL:self.movie.largeURL];
    
    [self sizeToFit:self.movieTitleLabel];
    [self sizeToFit:self.synopsisLabel];
    [self sizeToFit:self.castsLabel];
    
//    [self addUserRating:self.movie.];
//    [self addCriticsRating:self.criticsRating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadImageFromURL:(NSString *)imageURL
{
    NSURL *url = [NSURL URLWithString:imageURL];
    [self.image setImageWithURL:url];
}

- (void) sizeToFit:(UILabel *)label{
    [label setNumberOfLines:0];
    [label sizeToFit];
}

- (void)addUserRating:(NSInteger) userRating{
    UIImage *img = [UIImage imageNamed:@"thumbs up_icon.png"];
    [self.userRatingImageView setImage:img];
}

- (void)addCriticsRating:(NSInteger) userRating{
    UIImage *img = [UIImage imageNamed:@"thumbs down_icon.png"];
    [self.criticsRatingImageView setImage:img];
}

//table view methods
- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
        return 20;
    else if(indexPath.row == 1)
        return 40;
    else
        return 0;
}
//
//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    SFMovieCell *cell = (SFMovieCell*) [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
//    
//    SFMovie *movie = self.movies[indexPath.row];
//    
//    cell.movieTitleLabel.text = movie.title;
//    cell.synopsisLabel.text = movie.synopsis;
//    cell.casts.text = movie.casts;
//    
//    NSURL *url = [NSURL URLWithString:movie.thumbURL];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    UIImage *img = [[UIImage alloc] initWithData:data];
//    [cell.imageView setImage:img];
//    
//    return cell;
//}

//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//}
@end
