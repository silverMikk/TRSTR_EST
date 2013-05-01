//
//  ScheduleViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/13/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleCell.h"
#import <QuartzCore/QuartzCore.h>

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
    
    fridayTimes = [[NSArray alloc] initWithObjects:@"10.00 – 19.00",@"10.00 – 19.00",@"18:00",@"19.00",@"23.00",nil];
    fridayContent = [[NSArray alloc] initWithObjects:@"Star & Co Village open",@"Registration for TriStar111, 33.3 and 11.1",@"StarRun",@"Special event in Otepää Adventure Park",@"Afterparty in official nightclub \"Comeback\"", nil];
    
    saturdayTimes = [[NSArray alloc] initWithObjects:@"8.00 – 19.00",@"8.00 – 9.00",@"9.00 – 12.00",@"9.00 – 19.00",@"8.00 – 9.30",@"9.40",@"10.00",@"11.00 – 12.00",@"13.00",@"13.30 – 14.30",@"15.00",@"17.00 – 18.00",@"18.00",@"19.00",@"23.00", nil];
    saturdayContent = [[NSArray alloc] initWithObjects:@"Star & Co Village is open",@"Registration is open for 11.1 distance",@"Registration is open for 33.3 distance",@"Registration is open for 111 distance",@"Bike check-in for 11.1 athletes",@"TriStar11.1 race briefing at the beach",@"Start of TriStar11.1 Estonia",@"Bike check out for 11.1 athletes",@"Race briefing for 33.3 athletes",@"Bike check-in for 33.3 athletes",@"Start of TriStar33.3 Estonia",@"Bike check out for 33.3 athletes", @"Award ceremony for 11.1 and 33.3 athletes", @"Energy Night and race briefing for 111 athletes", @"Afterparty in official nightclub \"Comeback\"", nil];
    
    sundayTimes = [[NSArray alloc] initWithObjects:@"8.00 – 19.00",@"8.00 – 10.15",@"11.00",@"11:11",@"14.13",@"16:00",@"17.00 – 19.00",@"18.00",@"19:00",@"19.30",@"21.00",@"23.00",nil];
    sundayContent = [[NSArray alloc] initWithObjects:@"Star & Co Village is open",@"Bike & bags check in for 111 athletes",@"Start of TriStar111 Estonia individual competition",@"Start of TriStar111 Estonia relay competition",@"Expected first finisher",@"Flower ceremony for top 3 men and women",@"Bike check out for 111 athletes",@"TriStar111 Estonia finish is closed",@"Award ceremony",@"Star Night with dinner buffet",@"Live concert",@"Afterparty in official nightclub \"Comeback\"", nil];
    
    [self.navigationItem setTitle:@"Schedule"];
    // Do any additional setup after loading the view from its nib.
    
    [backgroundImage setImage:[UIImage imageNamed:@"schedule.png"]];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
    [scroller setContentSize:CGSizeMake(960, scroller.frame.size.height)];
    
    [friDayTable registerNib:[UINib nibWithNibName:@"ScheduleCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [saturDayTable registerNib:[UINib nibWithNibName:@"ScheduleCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [sunDayTable registerNib:[UINib nibWithNibName:@"ScheduleCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [friDayTable setFrame:CGRectMake(0, 0, self.view.frame.size.width, scroller.frame.size.height)];
    [scroller addSubview:friDayTable];
    [saturDayTable setFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, scroller.frame.size.height)];
    [scroller addSubview:saturDayTable];
    [sunDayTable setFrame:CGRectMake(self.view.frame.size.width*2, 0, self.view.frame.size.width, scroller.frame.size.height)];
    [scroller addSubview:sunDayTable];
    
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

#pragma mark tableview datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (tableView.tag) {
        case 1:
            return fridayContent.count;
            break;
            
        case 2:
            return saturdayContent.count;
            break;
            
        case 3:
            return sundayContent.count;
            break;
            
        default:
            break;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier =@"Cell";
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell=[[ScheduleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    switch (tableView.tag) {
        case 1:
            [cell.timeLabel setText:[fridayTimes objectAtIndex:indexPath.row]];
            [cell.nameLabel setText:[fridayContent objectAtIndex:indexPath.row]];
            break;
            
        case 2:
            [cell.timeLabel setText:[saturdayTimes objectAtIndex:indexPath.row]];
            [cell.nameLabel setText:[saturdayContent objectAtIndex:indexPath.row]];
            break;
            
        case 3:
            [cell.timeLabel setText:[sundayTimes objectAtIndex:indexPath.row]];
            [cell.nameLabel setText:[sundayContent objectAtIndex:indexPath.row]];
            break;
            
        default:
            break;
    }
    cell.backView.layer.cornerRadius=5;
    return cell;
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
