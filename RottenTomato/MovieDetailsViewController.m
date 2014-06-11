//
//  MovieDetailsViewController.m
//  RottenTomato
//
//  Created by Eddie Freeman on 6/9/14.
//  Copyright (c) 2014 NinjaSudo Inc. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "UIImageView+AFNetworking.h"


@interface MovieDetailsViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIView *backgroundView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@end

@implementation MovieDetailsViewController

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
  // Do any additional setup after loading the view from its nib.
  
  // Configure the title
  self.navigationItem.title = self.movie.title;
  
  // Set Synopsis
  self.synopsisLabel.text = self.movie.synopsis;
  self.synopsisLabel.numberOfLines = 0;
  [self.synopsisLabel sizeToFit];
  // recompute the size of the background view now that we know the height of the synopsis label
  CGRect newBackgroundViewFrame = self.backgroundView.frame;

  newBackgroundViewFrame.size.height = self.synopsisLabel.frame.origin.y + self.synopsisLabel.frame.size.height + 200;
  self.backgroundView.frame = newBackgroundViewFrame;
  
  [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.backgroundView.frame.origin.y + self.backgroundView.frame.size.height - 180)];
  
  // Load Poster Image
  [self.posterImageView setImageWithURL:[[NSURL alloc] initWithString:self.movie.posters[@"original"]]];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
