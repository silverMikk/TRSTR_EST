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
#import <QuartzCore/QuartzCore.h>

@interface RacesViewController ()

@end

@implementation RacesViewController
@synthesize backGroundImage;
@synthesize delegate;
@synthesize tri111Button,tri11Button,tri33Button;
@synthesize runButton;
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
    
    
    [tri33Button.layer setShadowColor:[UIColor blackColor].CGColor];
    [tri33Button.layer setShadowOpacity:0.8];
    [tri33Button.layer setShadowRadius:3.0];
    [tri33Button.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [tri11Button.layer setShadowColor:[UIColor blackColor].CGColor];
    [tri11Button.layer setShadowOpacity:0.8];
    [tri11Button.layer setShadowRadius:3.0];
    [tri11Button.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [tri111Button.layer setShadowColor:[UIColor blackColor].CGColor];
    [tri111Button.layer setShadowOpacity:0.8];
    [tri111Button.layer setShadowRadius:3.0];
    [tri111Button.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [runButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [runButton.layer setShadowOpacity:0.8];
    [runButton.layer setShadowRadius:3.0];
    [runButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];

    
    // Do any additional setup after loading the view from its nib.
    [self.navigationItem setTitle:@"Races"];
    
    [backGroundImage setImage:[UIImage imageNamed:@"banner_10.png"]];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
}

- (void)viewDidUnload
{
    [self setBackGroundImage:nil];
    [self setRunButton:nil];
    [self setTri111Button:nil];
    [self setTri33Button:nil];
    [self setTri11Button:nil];
    [self setDelegate:nil];
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
