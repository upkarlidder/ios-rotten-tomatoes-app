//
//  SFMoviesViewController.m
//  tomatoes
//
//  Created by Upkar Lidder on 2014-01-17.
//  Copyright (c) 2014 8indaas. All rights reserved.
//

#import "SFMoviesViewController.h"
#import "SFMovieCell.h"
#import "SFMovie.h"
#import "SFMovieDetailViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIImageview+AFNetworking.h"


@interface SFMoviesViewController ()
@property (nonatomic, strong) NSMutableArray *movies;
-(void) reload;
@property (nonatomic, strong) SVProgressHUD *hud;
@end

@implementation SFMoviesViewController

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

    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to refresh..."];
    self.refreshControl = refreshControl;
    [self reload];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refresh:(UIRefreshControl *)sender{
    [self reload];
    [sender endRefreshing];
}


- (void) reload{
    [SVProgressHUD showWithStatus:@"Updating" maskType:SVProgressHUDMaskTypeBlack];

    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:12];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        if (!connectionError && responseCode == 200){
        NSDictionary *object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:[object objectForKey:@"movies"]];
        self.movies = [[NSMutableArray alloc]init];
        
        for(NSDictionary *item in array){
            SFMovie *movie = [[SFMovie alloc]initWithDictionary:item];
            [self.movies addObject:movie];
            [SVProgressHUD dismiss];
        }
            
        [self.tableView reloadData];
        NSLog(@"%@", object);
        }
        else{
            //show error message
            NSLog(@"connectionError=%@", connectionError);
            NSLog(@"responseCode=%d", responseCode);
            [SVProgressHUD showErrorWithStatus:@"Oops, unable to load movies, check your internet!"];
        }
    }];
}

//table view methods
- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.movies.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SFMovieCell *cell = (SFMovieCell*) [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    SFMovie *movie = self.movies[indexPath.row];
    
    cell.movieTitleLabel.text = movie.title;
    cell.synopsisLabel.text = movie.synopsis;
    cell.casts.text = movie.casts;
    
    NSURL *url = [NSURL URLWithString:movie.thumbURL];
    [cell.image setImageWithURL:url];

    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showMovieDetails"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SFMovieDetailViewController *detailMovieController = segue.destinationViewController;
        SFMovie *currentMovie = [self.movies objectAtIndex:indexPath.row];
        detailMovieController.movie = currentMovie;
    }
}

@end
