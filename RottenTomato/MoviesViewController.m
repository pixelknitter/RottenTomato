//
//  MoviesViewController.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

typedef enum {
  General = 1,
  Network =2
} ErrorType;

#import "MoviesViewController.h"
#import "MovieDetailsViewController.h"
#import "DejalActivityView.h"
#import "MovieCell.h"

static NSString * const BaseURLString = @"http://api.rottentomatoes.com/api/public/v1.0/lists/";

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *movies;

@property (nonatomic, strong) UIView *errorView;
@property (nonatomic, strong) DejalActivityView *progressView;

- (void) showError:(ErrorType)type;

@end

@implementation MoviesViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Create Progress View
  self.progressView = [[DejalBezelActivityView alloc] initForView:self.tableView withLabel:@"Loading Movies" width:self.tableView.frame.size.width/3];
  
  [self.progressView animateShow];
  
  // Create Error View
  self.errorView = [self createErrorView];
  // Add Error View
  [self.tableView addSubview:self.errorView];
  
  // Configure the title
  self.navigationItem.title = @"Movies";
  
  // Set up refresh controller
  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self action:@selector(requestMovieData) forControlEvents:UIControlEventValueChanged];
  self.refreshControl = refreshControl;
  
  // Set up initial data load
  [self requestMovieData];
  
  // Alternatively, configure the title with a custom view
//  self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title"]];
  
  // Uncomment the following line to preserve selection between presentations.
  // self.clearsSelectionOnViewWillAppear = NO;
  
  // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  // self.navigationItem.rightBarButtonItem = self.editButtonItem;
  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  self.tableView.rowHeight = 100;
  
  [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:@"MovieCell"];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
  Movie *movie = [self.movies objectAtIndex:indexPath.row];
  
  NSLog(@"%@  :  %d", movie.title, indexPath.row);
  
  movieCell.titleLabel.text = movie.title;
  movieCell.consensusLabel.text = movie.criticsConsensus;
//  
//  NSLog(@"%@  :  %d", movie.synopsis, indexPath.row);
//  NSLog(@"%@  :  %d", movie.criticsConsensus, indexPath.row);
  
  [movieCell.posterImage setImageWithURL:[[NSURL alloc] initWithString:movie.posters[@"profile"]]];
  
  return movieCell;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  // Navigation logic may go here, for example:
  // Create the next view controller.
  MovieDetailsViewController *detailViewController = [[MovieDetailsViewController alloc] initWithNibName:@"MovieDetailsViewController" bundle:nil];
  
  detailViewController.movie = [self.movies objectAtIndex:indexPath.row];
  
  // Push the view controller.
  [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - Data Requests

- (void)updateTable
{
  [self.tableView reloadData];
  
  [self.refreshControl endRefreshing];
}

- (void)requestMovieData {
//  if(searchParam) {
//    searchParam
//
  if(!self.dataSource) {
    [self showError:General];
    return;
  }
  
  NSString *apiParameter = @"apikey=g9au4hv6khv6wzvzgt55gpqs"; // s
  NSString *urlString = [NSString stringWithFormat:@"%@%@?%@", BaseURLString, self.dataSource, apiParameter];
  
  NSURL *dataURL = [[NSURL alloc] initWithString:urlString];
  
  NSURLRequest *request = [NSURLRequest requestWithURL:dataURL];
  [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//    NSLog(@"%@", responseObject);
    if(connectionError) {
      NSLog(@"%@", connectionError);
      [self showError:Network];
      [self.refreshControl endRefreshing];
    } else {
      id responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
      // Parse into models
      self.movies = [Movie  moviesWithArray:responseObject[@"movies"]];
      [self updateTable];
    }
    if(!self.progressView.hidden) {
      [self.progressView animateRemove];
    }
  }];
}

#pragma mark - Helper Functions

- (UIView*)createErrorView {
  // Set Size
  CGRect frameRect = self.tableView.frame;
  frameRect.size.height = 20;
  // Create View
  self.errorView = [[UIView alloc] initWithFrame:frameRect];
  self.errorView.backgroundColor = [UIColor colorWithRed:255/255.0f green:59/255.0f blue:37/255.0f alpha:1.0f]; // Red-Orange
  self.errorView.alpha = 0.90;
  self.errorView.hidden = true;
  
  // Add Message Label
  UILabel *messageLabel = [[UILabel alloc] initWithFrame:self.errorView.frame];
  messageLabel.text = @"Error Message";
  messageLabel.textColor = [UIColor whiteColor];
  messageLabel.textAlignment = NSTextAlignmentCenter;
  messageLabel.tag = 100;
  
  [self.errorView addSubview:messageLabel];
  
  return self.errorView;
}

- (void) showError:(ErrorType)type {
  NSString *message = @"";
  switch (type) {
    case General:
      message = @"An Error has Occurred";
      break;
    case Network:
      message = @"Network Error";
    default:
//      message = @"An Error has Occurred";
      break;
  }
  // Set Message Text
  UILabel *messageLabel = (UILabel*)[self.errorView viewWithTag:100];
  messageLabel.text = message;
  NSLog(@"%@", messageLabel.text);
  // Unhide Error View
  self.errorView.hidden = false;
  
  // Hide it again after a delay
  [self performSelector:@selector(removeError) withObject:nil
             afterDelay:2];
}

- (void) removeError {
  self.errorView.hidden = true;
}

@end
