//
//  ChooseResultsViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ChooseResultsViewController.h"
#import "ResultsViewController.h"
@interface ChooseResultsViewController ()

@end

@implementation ChooseResultsViewController
@synthesize raceID;
@synthesize table;
@synthesize topImage;


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
    categories = [[NSArray alloc] initWithObjects:@"Men",@"Woman",@"M18-24",@"M25-29",@"M30-34",@"M35-39",@"M40-44",@"M45-49",@"M50-54",@"M55-59",@"M60-64",@"M65-69",@"M70-74",@"MPRO",@"W18-24",@"W25-29",@"W30-34",@"W35-39",@"W40-44",@"W45-49",@"W50-54",@"W55-59",@"W60-64",@"W65-69",@"W70-74",@"WPRO", nil];
    [table reloadData];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setTopImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma tableviewdata

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [categories count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell;
    static NSString *cellIdentifier = @"Cell";
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell.textLabel setText:[categories objectAtIndex:indexPath.row]];
    return cell;
}

#pragma tableviewdelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ResultsViewController *vc= [[ResultsViewController alloc] initWithNibName:@"ResultsViewController" bundle:nil];
    [vc setRaceID:raceID];
    [vc setAgeGroupID:[categories objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
