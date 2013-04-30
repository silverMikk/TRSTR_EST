//
//  MainViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "PaceCalcViewController.h"
#import "ScheduleViewController.h"
#import <QuartzCore/QuartzCore.h>
#define bannerCount 10
@interface MainViewController ()

@end

@implementation MainViewController
@synthesize banner;
@synthesize raceButton,newsButton,toolButton,scheduleButton;

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
    
    [raceButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [raceButton.layer setShadowOpacity:0.8];
    [raceButton.layer setShadowRadius:3.0];
    [raceButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [newsButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [newsButton.layer setShadowOpacity:0.8];
    [newsButton.layer setShadowRadius:3.0];
    [newsButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [toolButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [toolButton.layer setShadowOpacity:0.8];
    [toolButton.layer setShadowRadius:3.0];
    [toolButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [scheduleButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [scheduleButton.layer setShadowOpacity:0.8];
    [scheduleButton.layer setShadowRadius:3.0];
    [scheduleButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
	// Do any additional setup after loading the view.
    bannerIndex=1;
    [banner setImage:[UIImage imageNamed:[NSString stringWithFormat:@"banner_%d.png",bannerIndex]]];
}

- (void)viewDidUnload
{
    [self setBanner:nil];
    [self setRaceButton:nil];
    [self setNewsButton:nil];
    [self setToolButton:nil];
    [self setScheduleButton:nil];
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
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.tristar.ee"]];
}

- (IBAction)toolsPressed:(id)sender {
    PaceCalcViewController *vc = [[PaceCalcViewController alloc] initWithNibName:@"PaceCalcViewController" bundle:nil];
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
