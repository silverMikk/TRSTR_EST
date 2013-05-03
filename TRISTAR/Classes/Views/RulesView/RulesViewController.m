//
//  RulesViewController.m
//  TRISTAR
//
//  Created by Silver Mikk on 5/2/13.
//
//

#import "RulesViewController.h"
#import "RuleCell.h"
@interface RulesViewController ()

@end

@implementation RulesViewController
@synthesize firstCell,title,table,backGround;

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
    [backGround setImage:[UIImage imageNamed:@"banner_4.PNG"]];
    content =[[NSArray alloc] initWithObjects:@"Drafting off another competitor or motor vehicle is forbidden. The draft zone will be a rectangle 10 meters long by 3 meters wide.",@"The bike, helmet and transition bags have to be checked in prior to race to allow time for competitors to make modifications, if necessary, to comply with the rules.",@"Race Marshals' instructions have to be followed.",@"Littering is not allowed. Competitors throwing away bike bottles, packaging of bars and gels or the like will be disqualified immediately.",@"Only approved helmets are allowed. (Helmets must be approved by a national accredited testing authority recognised by a national federation that is an affiliate of the ITU.)",@"Protests must be made in written to the Referee.",@"Escorting is forbidden.",@"Relays must pass o n the timing chip in order to be classified.v",@"Mobile phones, MP3 players, headsets etc. are not allowed.",@"TriStar111 Estonia and A. Le Coq TriStar33.3 Estonia abide by rules set by the World Anti-Doping Agency (WADA) Code. Age group athletes can also be drug tested.", nil];
    [self.navigationItem setTitle:@"Rules"];
    [table registerNib:[UINib nibWithNibName:@"RuleCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    sample = [table dequeueReusableCellWithIdentifier:@"Cell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFirstCell:nil];
    [self setTitleLabel:nil];
    [self setTable:nil];
    [self setBackGround:nil];
    [super viewDidUnload];
}


#pragma mark tableview data

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [content count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return firstCell.frame.size.height;
    }
    [sample.numberLabel setText:[NSString stringWithFormat:@"%d.",indexPath.row]];
    [sample.nameLabel setText:[content objectAtIndex:indexPath.row]];
    CGRect rec = sample.contentView.frame;
    rec.size = sample.nameLabel.contentSize;
    [sample.nameLabel setFrame:rec];
    return sample.nameLabel.contentSize.height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return firstCell;
    }
    RuleCell *cell = [table dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell==nil) {
        cell=[[RuleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    [cell.numberLabel setText:[NSString stringWithFormat:@"%d.",indexPath.row]];
    [cell.nameLabel setText:[content objectAtIndex:indexPath.row]];
   
    [cell setFrame:CGRectMake(0, 0, 320, cell.nameLabel.contentSize.height)];
    return cell;
}


@end
