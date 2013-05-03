//
//  Tri33ViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Tri33ViewController.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ChapterCell.h"
#import "RulesViewController.h"

@interface Tri33ViewController ()

@end

@implementation Tri33ViewController
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
    titles = [[NSArray alloc] initWithObjects:@"*",@"A. Le Coq TriStar33.3 Estonia general overview",@"ELIGIBILITY OF PARTICIPATION",@"LICENCE",@"AGE GROUP CLASSIFICATIONS",@"SIGN UP and FEES",@"PARTICIPANTS LIMIT",@"NUTRITION",@"RACE REGULATIONS",@"ATHLETES BRIEFING",@"DRAFTING",@"RACE COURT",@"ARBITRAL COURT",@"HELMETS",@"A. Le Coq TriStar33.3 Estonia COURSE",@"TRANSITION ZONE",@"SECURITY AT THE TRANSITION ZONE",@"START ZONE",@"TIMING",@"TIME LIMITS",@"MEDICAL SERVICE",@"LOST AND FOUND",@"ACCOMMODATION and OFFICIAL RACE HOTEL",@"PARKING",@"HOW TO GET THERE",@"TRAINING POSSIBILITIES",@"HOT SPOTS FOR THE RACE", nil];
    contents = [[NSArray alloc] initWithObjects:@"",@"A. Le Coq TriStar33.3 Estonia\n3 August 2013\nDistance: 0.3km swim, 30km bike, 3km run",@"Athletes from 14 years old onwards are allowed to participate in the A. Le Coq TriStar33.3 Estonia race. Minors need the written consent of their parents.",@"Triathlon licence is obligatory for all A. Le Coq TriStar33.3 athletes. Licensed athletes are covered with insurance for serious injuries during the race. If you do not have a valid yearly licence from your national triathlon federation, you can purchase a one-day licence (10 EUR) from the Estonian Triathlon Union. The licence can be purchased during the sign-up in TriStar Estonia web (under Services on the sign-up form). More information on licences from Estonian Triathlon Union ( info@triatlon.ee). No qualification is needed in order to participate in A. Le Coq TriStar33.3 Estonia. You do not need to be member of a club. You are not allowed to pass on your entry to anyone else. The organizer reserves the right to reject entries if deemed appropriate.",@"14-20 / 21-30 / 31-40 / 41-50 / 51-60 / 60+",@"Sign up to all distances is open only on the race’s webpage http://www.TriStarEstonia.com until 31 July 2012. Hand-out of race materials is open in the race centre on Friday (August 2) and Saturday (August 3) for all distance athletes.  Each participant must pick up his or her race pack personally. It´s obligatory to show an ID on spot. TriStar111 and TriStar33.3 starters need to possess and present a triathlon licence, or buy a one day licence (one-day licence from Estonian Triathlon Union costs 10 EUR). Each participant needs to accept and sign an acceptance of the general conditions and a hold-harmless agreement during registration. The entry fee for A. Le Coq TriStar33.3 Estonia includes:\n\n- professional organization by MTÜ 113km Klubi and Star Events\n- a welcome present at registration\n- a finisher t-shirt\n- a finisher medal\n- a finisher certificate\n- entrance to the Energy Night on Saturday\n\nThe exact sign up fees can be found online at http://tristar.ee/en/tristar-estonia/racedetails33/general-overview",@"Participant limits for A. Le Coq TriStar33.3 race: 300",@"During the run and after the race athletes will be supplied with water, isotonic drinks and fruit. No nutrition will be given on the A. Le Coq TriStar33.3 bike course.",@"Estonian Triathlon Union race regulations apply. These regulations can be found on www.triatlon.ee. With the registration athletes accept the race regulations. Additionally Estonian traffic regulations (right side traffic) apply.",@"The A. Le Coq  TriStar33.3 Estonia race briefing will be held on Saturday before the race at 13:00. It is mandatory for all A. Le Coq TriStar33.3 athletes.",@"Drafting is not allowed. The drafting area is 3 x 10 m.",@"Estonian Triathlon Union and MTÜ 113km Klubi.",@"Arbitral court will take place right after the race and will be composed of the representatives of the organizational team, representative of the Estonian Triathlon Union and the head marshal. Will be announced on race day.",@"It is mandatory to wear a helmet on the entire bike course. It is mandatory to wear the swim cap during the swim part.",@"Swim course \nThe one loop 300 meter swim will take place at one of Estonia's most beautiful lakes called Pühajärv. Swim is a mass start for individuals. Bike course One 30 kilometre lap. \n\nThe bike leg will take competitors 30 kilometres through the magical south Estonian landscape passing by numerous lakes. The bike course is challenging, having a difficult profile with big altitude differences.  The 100km will be accomplished in single loop, and ca 300 meters climbing altitude. Drafting will be not allowed. The bike course also has a highlighted spectator spot on Mäe Street (the highest point of the bike course). \n\nRun course One 3km lap. The run part will be challenging all the same and includes very picturesque views of the Pühajärve Lake. The run course goes by the light traffic road by the Pühajärve Lake towards Sihva and back. Passing the transition area, the athletes will head in the direction of Pühajärve town and turn back to the race centre in the Pühajärve SPA Hotel gardens.",@"There is only one transition zone at the tennis courts at Pühajärve SPA Hotel gardens. 2 separate transitions will be implemented with a bike park separate from the bag and changing area.",@"The transition zone is fenced. After the race bikes and race bags should be picked up at times shown in the event schedule. All equipment that has been left in transition area after that will be moved to lost and found in the race office.\n\nBike Security. Bikes are guarded by triathlon staff from non-competitors.",@"Start zone for all distance races will be at the Pühajärve SPA Hotel beach.",@"Timing Chips will be provided by the organizers and collected after the race. Lost chips will be invoiced to the athlete. Different timing points will be handling in order to provide to each participant a swim split, a bike split, a run split and a general race split. At this moment we don’t support using your own chip.",@"Swim: 00:30 Swim + Bike: 2:00 Swim + Bike + Run: 3:00",@"Medical service will be available during and directly after the race. Massage is available at any time in the expo area.",@"All found items are collected in the race office on race days. After race days please send an email with your enquiry to office@tristar111estonia.com.",@"Pühajärve Spa Hotel AS Pühajärve Puhkekodu \nPühajärve, 67414 Valgamaa, Estonia \nTel: +372 76 65 500 \nGSM: +372 50 44 238 \nFax: +372 76 65 501 \npjpk@pjpk.ee www.pyhajarve.com",@"The competitors and spectators can park their car in the parking lot of Pühajärve Spa Hotel and the parking lot of Pühajärve beach. As the race goes along the Otepää-Sihva road, parking alongside the road is not allowed. Everyone has to obey the instructions of the police, race marshals and traffic controllers, both when parking and during the race.",@"The easiest way to reach Pühajärve from abroad is to fly to Tartu airport, 40 km from Pühajärve, but as it is a small airport, it has its limitations with connecting flights to other major airports. Therefore we would recommend Tallinn Airport which is 220km away, but has good connections all over the Europe. Another option to reach Pühajärve is flying to Riga in Latvia; from there it is around 200 km to Pühajärve. Riga airport is covered by Air Baltic and Ryanair. Transfers are arranged upon request (please contact office@tristar111estonia.com).",@"Swim: Pühajärve SPA hotel has its own 25m swimming pool, which can be used for training. Also swim course will marked on Friday and can be used for training at your own risk. \n\nBike: Bike course is on public roads, so there are no restrictions of using it. Bike course will be marked on Friday as well. Also we will have some group rides before the race and these times will be announced later on. \n\nRun: There are plenty of trails and paths you can run on and the official run course will be marked on Friday and it is free for practice.",@"For those who like to stay in one place we recommend Pühajärve Spa Hotel park where you can see swim, transition areas bike, run and also the finish. For those who look for more excitement we recommend Mäe Street on the bike course as it is the highest point of the 111 course just 2.3km from Pühajärve SPA Hotel. On the run there is a good spectator spot on Pühajärve park just on the side of the race centre where athletes have to run up the hill and down on their way back to finish. Any changes to the regulations will be posted on www.tristarestonia.com. All prices mentioned in this regulation are including VAT.",nil];
    [self.navigationItem setTitle:@"TriStar 33"];
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
    [vc setSwimID:31];
    [vc setBikeID:32];
    [vc setRunID:33];
    [vc setTitle:@"TriStar 33.3"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)rulesPressed:(id)sender {
    RulesViewController *vc=[[RulesViewController alloc] initWithNibName:@"RulesViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}



-(IBAction)resultsPressed:(id)sender{
    UIActionSheet *sheet =[[UIActionSheet alloc]initWithTitle:@"Select a year" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"2012",@"2011", nil];
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
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tristar.ee/images/downloads/TRSTEE/trstee_2012_33.3.pdf"]];
        }else if (buttonIndex==1){
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://tristar.ee/images/downloads/TRSTEE/trstee2011_33_3_results_eng.pdf"]];
        }    }
}
@end
