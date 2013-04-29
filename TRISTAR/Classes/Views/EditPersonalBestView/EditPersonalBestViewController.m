//
//  EditPersonalBestViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "EditPersonalBestViewController.h"
#import "PersonalBestItem.h"
#import "AppDelegate.h"
@interface EditPersonalBestViewController ()

@end

@implementation EditPersonalBestViewController
@synthesize delegate,personalBestItem;
@synthesize nameTf;
@synthesize hoursTf;
@synthesize minutesTf;
@synthesize secondsTf;
@synthesize commentsTf;
@synthesize dateButton;

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
}

- (void)viewDidUnload
{
    [self setNameTf:nil];
    [self setHoursTf:nil];
    [self setMinutesTf:nil];
    [self setSecondsTf:nil];
    [self setDelegate:nil];
    [self setPersonalBestItem:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    if (personalBestItem ==nil) {
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        personalBestItem =[NSEntityDescription insertNewObjectForEntityForName:@"PersonalBestItem" inManagedObjectContext:app.managedObjectContext];
    }
    [nameTf setText:personalBestItem.name];
    int total = personalBestItem.totalTime.intValue;
    int hours = total / (60*60);
    total -=hours*60*60;
    int minutes = total/ 60;
    total -=minutes*60;
    int sec = total;
    
    [hoursTf setText:[NSString stringWithFormat:@"%d",hours]];
    [minutesTf setText:[NSString stringWithFormat:@"%d",minutes]];
    [secondsTf setText:[NSString stringWithFormat:@"%d",sec]];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateStyle:NSDateFormatterMediumStyle];
    
    
                         
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)datePressed:(id)sender{
    
}
- (IBAction)savePressed:(id)sender{
    [delegate viewControllerDissmedWithItem:personalBestItem];
}
- (IBAction)deletePressed:(id)sender{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.managedObjectContext deleteObject:personalBestItem];
    [delegate viewControllerDeleted];
}

@end
