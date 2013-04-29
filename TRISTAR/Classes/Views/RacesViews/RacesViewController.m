//
//  RacesViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "RacesViewController.h"
#import "Tri111ViewController.h"
#import "Tri11ViewController.h"
#import "Tri33ViewController.h"
#import "StarRunViewController.h"

@interface RacesViewController ()

@end

@implementation RacesViewController
@synthesize backGroundImage;
@synthesize delegate;

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
    [self.navigationItem setTitle:@"Races"];
    
    [backGroundImage setImage:[UIImage imageNamed:@"banner_10.png"]];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
}

- (void)viewDidUnload
{
    [self setBackGroundImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)starRunPressed:(id)sender {
    StarRunViewController *vc= [[StarRunViewController alloc] initWithNibName:@"StarRunViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tri111Pressed:(id)sender {
    Tri111ViewController *vc= [[Tri111ViewController alloc] initWithNibName:@"Tri111ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tri33Pressed:(id)sender {
    Tri33ViewController *vc= [[Tri33ViewController alloc] initWithNibName:@"Tri33ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tri11Pressed:(id)sender {
    Tri11ViewController *vc= [[Tri11ViewController alloc] initWithNibName:@"Tri11ViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
