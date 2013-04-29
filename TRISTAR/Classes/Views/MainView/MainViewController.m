//
//  MainViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "ChooseToolViewController.h"
#import "ScheduleViewController.h"

#define bannerCount 10
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize banner;

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
	// Do any additional setup after loading the view.
    bannerIndex=1;
    [banner setImage:[UIImage imageNamed:[NSString stringWithFormat:@"banner_%d.png",bannerIndex]]];
}

- (void)viewDidUnload
{
    [self setBanner:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{
    [banner setImage:[UIImage imageNamed:[NSString stringWithFormat:@"banner_%d.png",bannerIndex]]];
    bannerIndex++;
    if (bannerIndex>bannerCount) {
        bannerIndex=1;
    }
    CGRect imgRec = banner.frame;
    if(imgRec.origin.x==0){
        imgRec.origin.x=-80;
    }else {
        imgRec.origin.x=0;
    }
    [UIView animateWithDuration:10 animations:^{
        [banner setFrame:imgRec];
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    bannerTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(bannerTimerTarget) userInfo:nil repeats:YES];
}

-(void)bannerTimerTarget{
    [banner setImage:[UIImage imageNamed:[NSString stringWithFormat:@"banner_%d.png",bannerIndex]]];
    bannerIndex++;
    if (bannerIndex>bannerCount) {
        bannerIndex=1;
    }
    CGRect imgRec = banner.frame;
    if(imgRec.origin.x==0){
        imgRec.origin.x=-80;
    }else {
        imgRec.origin.x=0;
    }
    [UIView animateWithDuration:10 animations:^{
        [banner setFrame:imgRec];
        }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [bannerTimer invalidate];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)racesPressed:(id)sender {
    RacesViewController *vc = [[RacesViewController alloc] initWithNibName:@"RacesViewController" bundle:nil];
    [vc setDelegate:self];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.tintColor = [UIColor blackColor];
    [self presentModalViewController:nvc animated:YES];
}

- (IBAction)newsPressed:(id)sender {
}

- (IBAction)toolsPressed:(id)sender {
    ChooseToolViewController *vc = [[ChooseToolViewController alloc] initWithNibName:@"ChooseToolViewController" bundle:nil];
    [vc setDelegate:self];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.tintColor = [UIColor blackColor];
    [self presentModalViewController:nvc animated:YES];
}

- (IBAction)schedulePressed:(id)sender {
    ScheduleViewController *vc = [[ScheduleViewController alloc] initWithNibName:@"ScheduleViewController" bundle:nil];
    [vc setDelegate:self];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.tintColor = [UIColor blackColor];
    [self presentModalViewController:nvc animated:YES];
}

-(void)dissmisModalView{
    [self dismissModalViewControllerAnimated:YES];
}
@end
