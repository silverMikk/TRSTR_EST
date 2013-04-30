//
//  StarRunViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "StarRunViewController.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChapterCell.h"
@interface StarRunViewController ()

@end

@implementation StarRunViewController
@synthesize firstCell;
@synthesize table;
@synthesize routeButton,resultsButton,rulesButton;

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
    
    [routeButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [routeButton.layer setShadowOpacity:0.8];
    [routeButton.layer setShadowRadius:3.0];
    [routeButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [resultsButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [resultsButton.layer setShadowOpacity:0.8];
    [resultsButton.layer setShadowRadius:3.0];
    [resultsButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [rulesButton.layer setShadowColor:[UIColor blackColor].CGColor];
    [rulesButton.layer setShadowOpacity:0.8];
    [rulesButton.layer setShadowRadius:3.0];
    [rulesButton.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    
    
    // Do any additional setup after loading the view from its nib.
    titles = [[NSArray alloc] initWithObjects:@"*",@"StarRun Estonia general overview",@"ELIGIBILITY OF PARTICIPATION",@"AGE GROUP CLASSIFICATIONS",@"SIGN UP and FEES",@"PARTICIPANTS LIMIT",@"NUTRITION",@"StarRun5 Estonia COURSE",@"TIMING",@"TIME LIMITS",@"MEDICAL SERVICE",@"LOST AND FOUND",@"ACCOMMODATION and OFFICIAL RACE HOTEL",@"PARKING",@"HOW TO GET THERE",@"TRAINING POSSIBILITIES",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    contents = [[NSArray alloc] initWithObjects:@"*",@"StarRun Estonia\nDate: 2 August 2013\nStart: 18:00\nDistance: 5km run",@"The StarRun5 Estonia is open for everybody.",@"StarRun5 doesn’t have classifications for age groups. 3 best both male and female athletes will be awarded with special price. All other finishers will take part in prize-lottery.",@"Sign up to StarRun5 is open on the race’s webpage www.TriStarEstonia.com until Wednesday, July 31st, 2013 and on-site on Friday, August 2nd, 10am-5.30pm. Hand-out of race materials is open 10am–5pm in the race centre on Friday, August 2nd. Each participant must pick up his or her race pack personally. It´s obligatory to show an ID on spot. Each participant needs to accept and sign an acceptance of the general conditions and a hold-harmless agreement during registration.\n\nStarRun5 entry fees\nEntry fee is 10 EUR which includes 5 EUR donation as athletes choice for either Livestrong – Tallinna Lastehaigla or 4Vita – renewing Pühajärve Park\n\nStarRun5 Estonia athletes will receive:\n- professional organization by MTÜ 113km Klubi and Star Events\n- support Livestrong or 4Vita\n- finisher certificate\n- participation in prize-lottery",@"Participants limit for the StarRun5 Estonia race: 300",@"No nutrition will be given on the StarRun5 course. After the race StarRun5 athletes will be supplied with water, isotonic drinks and fruit",@"Run’s start and finish is at Pühajärve SPA hotel Park with one loop course through Pühajärve Park.",@"Timing chips will be provided by the organizer and collected after the race. Lost chips will be invoiced to the athlete. At this moment we don’t support using your own chip.",@"StarRun5 Estonia finish will be closed 19:00.",@"Medical service will be available during and directly after the race.\nMassage is available at any time in the expo area.",@"All found items are collected in the race office on race days. After race days please send an email with your enquiry to office@tristar111estonia.com.",@"Pühajärve Spa Hotel\nAS Pühajärve Puhkekodu\nPühajärve, 67414 Valgamaa, Estonia\nTel: +372 76 65 500\nGSM: +372 50 44 238\nFax: +372 76 65 501\npjpk@pjpk.ee\nwww.pyhajarve.com\n\nOther accommodation possibiliti es and information about the area\nOtepää Tourist Information Centre\nTartu mnt 1, 67404 Otepää, Estonia\nTel: +372 766 1200\nE-mail: turism@otepaa.ee, otepaa@visitestonia.com\nWeb: www.otepaa.ee, www.visitestonia.com",@"Competitors and spectators can park their car in the parking lot of Pühajärve Spa Hotel and the parking lot of Pühajärve beach.\nAlso at the marked parking areas on nearby fields, parking alongside the road is not allowed.\nEveryone has to obey the instructions of the police, race marshals and traffic controllers, both when parking and during the race.",@"The easiest way to reach Pühajärve from abroad is to fly to Tartu airport, 40 km from Pühajärve, but as it is a small airport, it has its limitations with connecting flights to other major airports. Therefore we would recommend Tallinn Airport which is 220km away, but has good connections all over the Europe.\n\nAnother option to reach Pühajärve is flying to Riga in Latvia; from there it is around 200 km to Pühajärve. Riga airport is covered by Air Baltic and Ryanair. Transfers are arranged upon request (please contact office@tristar111estonia.com).",@"Swim: Pühajärve SPA hotel has its own 25m swimming pool, which can be used for training. Also swim course will marked on Friday and can be used for training at your own risk.\nBike: Bike course is on public roads, so there are no restrictions of using it. Bike course will be marked on Friday as well. Also we will have some group rides before the race and these times will be announced later on.\nRun: There are plenty of trails and paths you can run on and the official run course will be marked on Friday and it is free for practice.\nAny changes to the regulations will be posted on www.tristar111estonia.com.\n\nAll prices mentioned in this regulation are including VAT.",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    [self.navigationItem setTitle:@"StarRun"];
    [table registerNib:[UINib nibWithNibName:@"ChapterCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    chapter = [table dequeueReusableCellWithIdentifier:@"Cell"];
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
    [vc setRunID:5];
    [vc setSwimID:0];
    [vc setBikeID:0];
    [vc setTitle:@"Star Run"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)rulesPressed:(id)sender {
}

- (IBAction)resultsPressed:(id)sender {
    ChooseResultsViewController *vc = [[ChooseResultsViewController alloc] initWithNibName:@"ChooseResultsViewController" bundle:nil];
    [vc setRaceID:[NSNumber numberWithInt:5]];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark tableview data

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [titles count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return firstCell.frame.size.height;
    }
    [chapter.titleLabel setText:[titles objectAtIndex:indexPath.row]];
    [chapter.contentTextView setText:[contents objectAtIndex:indexPath.row]];
    CGRect rec = chapter.contentTextView.frame;
    rec.size = chapter.contentTextView.contentSize;
    [chapter.contentTextView setFrame:rec];
    return chapter.contentTextView.contentSize.height +49;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return firstCell;
    }
    ChapterCell *cell = [table dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[ChapterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.titleLabel setText:[titles objectAtIndex:indexPath.row]];
    [cell.contentTextView setText:[contents objectAtIndex:indexPath.row]];
    CGRect rec = cell.contentTextView.frame;
    rec.size.height = cell.contentTextView.contentSize.height;
    [cell.contentTextView setFrame:rec];
    [cell setFrame:CGRectMake(0, 0, 320, cell.contentTextView.contentSize.height+49)];
    return cell;
}

#pragma mark tableview delegate
@end
