//
//  Tri111ViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "Tri111ViewController.h"
#import "ChapterCell.h"
#import "RoutesViewController.h"
#import "ChooseResultsViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface Tri111ViewController ()

@end

@implementation Tri111ViewController
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
    titles = [[NSArray alloc] initWithObjects:@"*",@"EVENT INFORMATION",@"EVENT ORGANIZER",@"EVENT MANAGEMENT",@"FEDERATION",@"DISTANCE",@"ELIGIBILITY OF PARTICIPATION",@"AGE GROUP CLASSIFICATIONS",@"SIGN UP and FEES",@"PARTICIPANTS LIMIT",@"NUTRITION",@"RACE REGULATIONS",@"ATHLETES BRIEFING",@"DRAFTING",@"RACE COURT",@"ARBITRAL COURT",@"HELMET and SWIM CAP",@"TriStar111 Estonia COURSE",@"TRANSITION ZONE",@"SECURITY AT THE TRANSITION ZONE",@"START ZONE",@"TIMING",@"TIME LIMITS",@"MEDICAL SERVICE",@"LOST AND FOUND",@"ACCOMMODATION and OFFICIAL RACE HOTEL",@"PARKING",@"HOW TO GET THERE",@"TRAINING POSSIBILITIES",@"HOT SPOTS FOR THE RACE", nil];
    contents = [[NSArray alloc] initWithObjects:@"",@"TriStar111 Estonia\nDate: 2-4 August 2013\nEvent location: Pühajärve, 67414 Valgamaa, Estonia",@"MTÜ 113km Klubi\nAddress: Lageda tee 17-1\nCity/post code: 74020 Pärnamäe küla, Viimsi vald\nCountry: Estonia",@"General Event Manager: Ain-Alar Juhanson",@"Estonian Triathlon Union\nTabasalu pk.85\n76901 Harku vald, Harju maakond, Estonia\noffice: info@triatlon.ee\nwww.triatlon.ee",@"1km swim, 100km bike, 10km run",@"Athletes from 18 years old onwards are allowed to participate in the TriStar111 Estonia race.\n\nTriStar111 Estonia individual:\nTriathlon licence is obligatory for all individual athletes and the bikers of relay teams participating in TriStar111 Estonia and TriStar33.3 race. Licensed athletes are covered with insurance for serious injuries during the race.\nIf you do not have a valid yearly licence from your national triathlon federation, you can purchase a one-day licence (10 EUR) from the Estonian Triathlon Union. The licence can be purchased during the sign-up in TriStar111 Estonia web (under Services on the sign-up form). More information on licences from Estonian Triathlon Union ( info@triatlon.ee).\nNo qualification is needed in order to participate in TriStar111 Estonia. You do not need to be member of a club. You are not allowed to pass on your entry to anyone else. The organizer reserves the right to reject entries if deemed appropriate.\n\nTriStar111 Estonia relays: Each relay consists of 2-3 athletes who share the swim, bike and run splits. We allow women, men and mixed relay teams. Your time chip is the baton for each team.",@"18-24 / 25-29 / 30-34 / 35-39 / 40-44 / 45-49 / 50-54 / 55-59 / 60-64 / 65-69 / 70-74 / 75+",@"Sign up to all distances is open only on the race’s webpage www.TriStarEstonia.com until 28 July 2013. Hand-out of race materials is open in the race centre on Friday (August 2) and Saturday (August 4) for all distance athletes. Each participant must pick up his or her race pack personally. It´s obligatory to show an ID on spot. TriStar111 participants need to possess and present a triathlon licence, or buy a one day licence (one-day licence from Estonian Triathlon Union costs 10 EUR). Each participant needs to accept and sign an acceptance of the general conditions and a hold-harmless agreement during registration.",@"TriStar111 Estonia individuals: 800\nTriStar111 Estonia relay teams: 100",@"During and after the race athletes will be supplied with water, isotonic drinks and fruit",@"Estonian Triathlon Union race regulations apply. These regulations can be found on www.triatlon.ee. With the registration athletes accept the race regulations. Additionally Estonian traffic regulations (right side traffic) apply.",@"The TriStar111 Estonia race briefing will be held during the Energy Night on Saturday at 19:00. It is mandatory for all TriStar111 athletes.",@"Drafting is not allowed. The drafting zone is 10 meters in length and 3 meters in width.",@"Estonian Triathlon Union and MTÜ 113km Klubi.",@"Arbitral court will take place right after the race and will be composed of the representatives of the organizational team, representative of the Estonian Triathlon Union and the head marshal. Will be announced on race day.",@"It is mandatory to wear a helmet on the entire bike course. It is mandatory to wear the swim cap during the swim part.",@"Swim course\nThe one loop 1 kilometre swim will take place at one of Estonia's most beautiful lakes called Pühajärv (in translation Holy Lake). Swim is a mass start for individuals. Relay teams will start 11 minutes after the individuals.The water temperature is usually around 20°C this time of the year. Wetsuits are recommended, and they will not be allowed if the water temperature is warmer than 22°C on race day morning.\n\nBike course\nThe bike leg will take competitors 100 kilometres through the magical south Estonian landscape passing by numerous lakes. The bike course is challenging, having a difficult profile with big altitude differences. The 100km will be accomplished in 3 laps, and ca 1100 meters climbing altitude. The first lap is slightly longer than the second and the third lap. Drafting will be not allowed.\nThe bike course also has a highlighted spectator spot on Mäe Street (the highest point of the bike course).\n\nRun course\nThe run part will be challenging all the same and includes very picturesque views of the Pühajärve Lake. The run course goes by the light traffic road by the Pühajärve Lake towards Sihva and back. Passing the transition area, the athletes will head in the direction of Pühajärve town, arrive via a hillier area to Kolga road and turn back to the race centre in the Pühajärve SPA Hotel gardens.",@"There is only one transition zone at the tennis courts at Pühajärve SPA Hotel gardens. 2 separate transitions will be implemented with a bike park separate from the bag and changing area.",@"The transition zone is fenced. After the race bikes and race bags should be picked up at times shown in the event schedule. All equipment that has been left in transition area after that will be moved to lost and found in the race office.\n\nBike Security.\nBikes are guarded by triathlon staff from non-competitors.",@"Start zone for all distance races will be at the Pühajärve SPA Hotel beach.",@"Timing Chips will be provided by the organizers and collected after the race. Lost chips will be invoiced to the athlete. Different timing points will be handling in order to provide to each participant a swim split, a bike split, a run split and a general race split. At this moment we don’t support using your own chip.",@"Swim: 40 min\nSwim + Bike: 5:30\nSwim + Bike + Run: 7:00",@"Medical service will be available during and directly after the race.\nMassage is available at any time in the expo area.",@"All found items are collected in the race office on race days. After race days please send an email with your enquiry to office@tristar111estonia.com.",@"Pühajärve Spa Hotel\nAS Pühajärve Puhkekodu/nPühajärve, 67414 Valgamaa, Estonia\nPh: +372 76 65 500\nGSM: +372 50 44 238\nFax: +372 76 65 501\npjpk@pjpk.ee/nwww.pyhajarve.com/n\nOther accommodation possibilities and information about the area: Otepää Tourist Information Centre\nTartu mnt 1, 67404 Otepää, Estonia\nPh: +372 766 1200\nE-mail: turism@otepaa.ee, otepaa@visitestonia.com\nWeb: www.otepaa.ee, www.visitestonia.com",@"The competitors and spectators can park their car in the parking lot of Pühajärve Spa Hotel and the parking lot of Pühajärve beach. As the race goes along the Otepää-Sihva road, parking alongside the road is not allowed.\nEveryone has to obey the instructions of the police, race marshals and traffic controllers, both when parking and during the race.",@"The easiest way to reach Pühajärve from abroad is to fly to Tartu airport, 40 km from Pühajärve, but as it is a small airport, it has its limitations with connecting flights to other major airports. Therefore we would recommend Tallinn Airport which is 220km away, but has good connections all over the Europe.\nAnother option to reach Pühajärve is flying to Riga in Latvia; from there it is around 200 km to Pühajärve. Riga airport is covered by Air Baltic and Ryanair. Transfers are arranged upon request (please contact office@tristar111estonia.com).",@"Swim: Pühajärve SPA hotel has its own 25m swimming pool, which can be used for training. Also swim course will marked on Friday and can be used for training at your own risk.\n\nBike: Bike course is on public roads, so there are no restrictions of using it. Bike course will be marked on Friday as well. Also we will have some group rides before the race and these times will be announced later on.\n\nRun: There are plenty of trails and paths you can run on and the official run course will be marked on Friday and it is free for practice.",@"For those who like to stay in one place we recommend Pühajärve SPA Hotel park where you can see swim, transition areas bike, run and also the finish.\nFor those who look for more excitement we recommend Mäe Street on the bike course as it is the highest point of the 111 course just 2.3km from Pühajärve SPA Hotel. On the run there is a good spectator spot on Pühajärve park just on the side of the race centre where athletes have to run up the hill and down on their way back to finish.\n\nAny changes to the regulations will be posted on www.TriStarEstonia.com.\nAll prices mentioned in this regulation are including VAT.", nil];
    [self.navigationItem setTitle:@"TriStar 111"];
    [table registerNib:[UINib nibWithNibName:@"ChapterCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    chapter = [table dequeueReusableCellWithIdentifier:@"Cell"];
}

- (void)viewDidUnload
{
    [self setFirstCell:nil];
    [self setTable:nil];
    [self setRouteButton:nil];
    [self setRulesButton:nil];
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
    [vc setSwimID:11];
    [vc setBikeID:12];
    [vc setRunID:13];
    [vc setTitle:@"TriStar 111"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)rulesPressed:(id)sender {
}


-(IBAction)resultsPressed:(id)sender{
    ChooseResultsViewController *vc = [[ChooseResultsViewController alloc] initWithNibName:@"ChooseResultsViewController" bundle:nil];
    [vc setRaceID:[NSNumber numberWithInt:111]];
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
    [chapter.title setText:[titles objectAtIndex:indexPath.row]];
    [chapter.content setText:[contents objectAtIndex:indexPath.row]];
    CGRect rec = chapter.content.frame;
    rec.size = chapter.content.contentSize;
    [chapter.content setFrame:rec];
    return chapter.content.contentSize.height +49;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return firstCell;
    }
    ChapterCell *cell = [table dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[ChapterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.title setText:[titles objectAtIndex:indexPath.row]];
    [cell.content setText:[contents objectAtIndex:indexPath.row]];
    CGRect rec = cell.content.frame;
    rec.size.height = cell.content.contentSize.height;
    [cell.content setFrame:rec];
    [cell setFrame:CGRectMake(0, 0, 320, cell.content.contentSize.height+49)];
    return cell;
}

#pragma mark tableview delegate
@end
