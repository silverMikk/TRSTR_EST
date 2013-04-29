//
//  ScheduleViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/13/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ScheduleViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController
@synthesize friDayTable;
@synthesize saturDayTable;
@synthesize sunDayTable;
@synthesize daysSegment;
@synthesize scroller;
@synthesize backgroundImage;
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
    [self.navigationItem setTitle:@"Schedule"];
    // Do any additional setup after loading the view from its nib.
    
    [backgroundImage setImage:[UIImage imageNamed:@"schedule.png"]];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
    [scroller setContentSize:CGSizeMake(960, scroller.frame.size.height)];
}

- (void)viewDidUnload
{
    [self setFriDayTable:nil];
    [self setSaturDayTable:nil];
    [self setSunDayTable:nil];
    [self setScroller:nil];
    [self setBackgroundImage:nil];
    [self setDaysSegment:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark scroller delegate


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    controlUsed = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    controlUsed = NO;
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (controlUsed) {
        return;
    }
    
    CGFloat pageqWith = self.scroller.frame.size.width;
    int index = floor(((self.scroller.contentOffset.x - pageqWith /2)/pageqWith )+1);
    if (page !=index && index>-1 && index<3) {
        page = index;
    }
    [daysSegment setSelectedSegmentIndex:page];
}



- (IBAction)segmentChanged:(id)sender {
    int x = self.scroller.frame.size.width * daysSegment.selectedSegmentIndex;
    [scroller scrollRectToVisible:CGRectMake(x, 0, self.scroller.frame.size.width, self.scroller.frame.size.height) animated:YES];
}
@end
