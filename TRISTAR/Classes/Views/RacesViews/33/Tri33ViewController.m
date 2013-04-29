//
//  Tri33ViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Tri33ViewController.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
@interface Tri33ViewController ()

@end

@implementation Tri33ViewController

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
    [self.navigationItem setTitle:@"TriStar 33.3"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)routePressed:(id)sender {
    RoutesViewController *vc = [[RoutesViewController alloc] initWithNibName:@"RoutesViewController" bundle:nil];
    [vc setSwimID:31];
    [vc setBikeID:32];
    [vc setRunID:33];
    [vc setTitle:@"TriStar 33.3"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)rulesPressed:(id)sender {
}

- (IBAction)registrationPressed:(id)sender {
}


-(IBAction)resultsPressed:(id)sender{
    ChooseResultsViewController *vc = [[ChooseResultsViewController alloc] initWithNibName:@"ChooseResultsViewController" bundle:nil];
    [vc setRaceID:[NSNumber numberWithInt:33]];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
