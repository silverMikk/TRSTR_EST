//
//  Tri11ViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Tri11ViewController.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
@interface Tri11ViewController ()

@end

@implementation Tri11ViewController

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
    [self.navigationItem setTitle:@"TriStar 11.1"];
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
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)rulesPressed:(id)sender {
}

- (IBAction)registrationPressed:(id)sender {
}

-(IBAction)resultsPressed:(id)sender{
    ChooseResultsViewController *vc = [[ChooseResultsViewController alloc] initWithNibName:@"ChooseResultsViewController" bundle:nil];
    [vc setRaceID:[NSNumber numberWithInt:11]];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
