//
//  Tri11ViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Tri11ViewController.h"
#import "ChapterCell.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface Tri11ViewController ()

@end

@implementation Tri11ViewController
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
    titles = [[NSArray alloc] initWithObjects:@"*",@"TriStar11.1 Estonia general overview",@"ELIGIBILITY OF PARTICIPATION",@"AGE GROUP CLASSIFICATIONS",@"SIGN UP and FEES",@"PARTICIPANTS LIMIT",@"NUTRITION",@"RACE REGULATIONS",@"ATHLETES BRIEFING",@"DRAFTING",@"RACE COURT",@"ARBITRAL COURT",@"HELMETS",@"TriStar11.1 Estonia COURSE",@"TRANSITION ZONE",@"SECURITY AT THE TRANSITION ZONE",@"START ZONE",@"TIMING",@"TIME LIMITS",@"MEDICAL SERVICE",@"LOST AND FOUND",@"ACCOMMODATION and OFFICIAL RACE HOTEL",@"PARKING",@"HOW TO GET THERE",@"TRAINING POSSIBILITIES", nil];
    contents = [[NSArray alloc] initWithObjects:@"",@"TriStar11.1 Estonia\n2 August 2013\n\nDistance: 0.1km swim, 10km bike, 1km run",@"The TriStar11.1 Estonia distance is open only for children under 18 years.",@"TriStar11.1 Estonia:\n9-10 (class D)\n11-12 (class C)\n13-14 (class B)",@"Sign up to all distances is open on the race’s webpage www.TriStarEstonia.com until Thursday, August 3rd 2012. Hand-out of race materials is open in the race centre on Friday (August 2) and Saturday (August 3) for all distance athletes. Each participant must pick up his or her race pack personally. It´s obligatory to show an ID on spot. Each participant needs to accept and sign an acceptance of the general conditions and a hold-harmless agreement during registration.\n\nTriStar11.1 entry fees\n\nEntry to the children’s race is free for everyone under 14 years of age.\n\nTriStar11.1 Estonia athletes will receive:\n-professional organization by MTÜ 113km Klubi and Star Events\n-a finisher medal\n-a finisher certificate\n-entrance to the Energy Night on Saturday",@"Participant limits for the TriStar11.1 race: 300",@"After the race TriStar11.1 athletes will be supplied with water, isotonic drinks and fruit. No nutrition will be given on the TriStar11.1 course.",@"Estonian Triathlon Union race regulations apply. These regulations can be found on www.triatlon.ee. With the registration athletes accept the race regulations. Additionally Estonian traffic regulations (right side traffic) apply.",@"The TriStar11.1 Estonia race briefing will be held on Saturday before the race at 9:40. It is mandatory for all TriStar11.1 athletes.",@"Drafting is allowed.",@"Estonian Triathlon Union and MTÜ 113km Klubi.",@"Arbitral court will take place right after the race and will be composed of the representatives of the organizational team, representative of the Estonian Triathlon Union and the head marshal. Will be announced on race day.",@"It is mandatory to wear a helmet on the entire bike course. It is mandatory to wear the swim cap during the swim part.",@"Swim course\nThe one loop 100 meter swim will take place at one of Estonia's most beautiful lakes called Pühajärv. Swim is a mass start for individuals.\n\nBike course\nOne 10 kilometre lap on the following route: Pühajärve village – Tamme Avenue – Kolga road – old roller track – Sihva – Pühajärve.\n\nRun course\n1km out and back course on the light traffic road by the Pühajärve Lake towards Otepää.",@"There is only one transition zone at the tennis courts at Pühajärve SPA Hotel gardens. 2 separate transitions will be implemented with a bike park separate from the bag and changing area.",@"The transition zone is fenced. After the race bikes and race bags should be picked up at times shown in the event schedule. All equipment that has been left in transition area after that will be moved to lost and found in the race office.\n\nBike Security. \nBikes are guarded by triathlon staff from non-competitors.",@"Start zone for all distance races will be at the Pühajärve SPA Hotel beach.",@"Timing Chips will be provided by the organizers and collected after the race. Lost chips will be invoiced to the athlete. Different timing points will be handling in order to provide to each participant a swim split, a bike split, a run split and a general race split. At this moment we don’t support using your own chip.",@"TriStar11.1 finish will be closed 1h 30 min after the start.",@"Medical service will be available during and directly after the race.\nMassage is available at any time in the expo area.",@"All found items are collected in the race office on race days. After race days please send an email with your enquiry to office@tristar111estonia.com.",@"Pühajärve Spa Hotel\nAS Pühajärve Puhkekodu\nPühajärve, 67414 Valgamaa, Estonia\nTel: +372 76 65 500\nGSM: +372 50 44 238\nFax: +372 76 65 501 pjpk@pjpk.ee\nwww.pyhajarve.com\n\nOther accommodation possibilities and information about the area\n\nOtepää Tourist Information Centre\nTartu mnt 1, 67404 Otepää, Estonia\nTel: +372 766 1200\nE-mail: turism@otepaa.ee, otepaa@visitestonia.com\nWeb: www.otepaa.ee, www.visitestonia.com",@"The competitors and spectators can park their car in the parking lot of Pühajärve Spa Hotel and the parking lot of Pühajärve beach.\nAs the race goes along the Otepää-Sihva road, parking alongside the road is not allowed.\nEveryone has to obey the instructions of the police, race marshals and traffic controllers, both when parking and during the race.",@"The easiest way to reach Pühajärve from abroad is to fly to Tartu airport, 40 km from Pühajärve, but as it is a small airport, it has its limitations with connecting flights to other major airports. Therefore we would recommend Tallinn Airport which is 220km away, but has good connections all over the Europe.\n\nAnother option to reach Pühajärve is flying to Riga in Latvia; from there it is around 200 km to Pühajärve. Riga airport is covered by Air Baltic and Ryanair. Transfers are arranged upon request (please contact office@tristar111estonia.com).",@"Swim: Pühajärve SPA hotel has its own 25m swimming pool, which can be used for training. Also swim course will marked on Friday and can be used for training at your own risk.\nBike: Bike course is on public roads, so there are no restrictions of using it. Bike course will be marked on Friday as well. Also we will have some group rides before the race and these times will be announced later on.\nRun: There are plenty of trails and paths you can run on and the official run course will be marked on Friday and it is free for practice.\n\nAny changes to the regulations will be posted on www.tristar111estonia.com.\nAll prices mentioned in this regulation are including VAT.",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@"", nil];
    [self.navigationItem setTitle:@"TriStar 11.1"];
    [table registerNib:[UINib nibWithNibName:@"ChapterCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    chapter = [table dequeueReusableCellWithIdentifier:@"Cell"];
}

- (void)viewDidUnload
{
    [self setResultsButton:nil];
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

-(IBAction)resultsPressed:(id)sender{
    UIActionSheet *sheet =[[UIActionSheet alloc]initWithTitle:@"Select a year" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"2012",@"2011",@"2010", nil];
    [sheet showInView:self.view];
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

#pragma mark actionsheet delegate
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex!=actionSheet.cancelButtonIndex) {
        NSLog(@"%d",buttonIndex);
        if (buttonIndex==0) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tristar.ee/images/downloads/TRSTEE/trstee_2012_11.1.pdf"]];
        }else if (buttonIndex==1){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tristar.ee/images/downloads/TRSTEE/trstee2011_11_1_results_eng.pdf"]];
        }else{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tristar.ee/images/downloads/TRSTEE/TRSTEE2010_11.1_results.pdf"]];
        }
    }
}
@end
