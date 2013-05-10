//
//  PRKeeperViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PRKeeperViewController.h"
#import "EditPersonalBestViewController.h"
#import "PesronalBestCell.h"
#import "PersonalBestItem.h"
#import "AppDelegate.h"
#import "StringFactory.h"

@interface PRKeeperViewController ()

@end

@implementation PRKeeperViewController
@synthesize fetchedResultsController = _fetchedResultsController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PersonalBestCell" bundle:nil] forCellReuseIdentifier:@"PesronalBestCell"];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStyleBordered target:self action:@selector(insertNew)] ;
}

-(void)insertNew{
    EditPersonalBestViewController *vc = [[EditPersonalBestViewController alloc] initWithNibName:@"EditPersonalBestViewController" bundle:Nil];
    [vc setDelegate:self];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.tintColor = [UIColor blackColor];
    [self presentModalViewController:nvc animated:YES];

}

-(void)viewWillAppear:(BOOL)animated{
    NSError *error;
    if(![[self fetchedResultsController]performFetch:&error ]){
        NSLog(@"Unresolced error %@ %@",error,[error userInfo]);
        exit(-1);
    }
    [self.tableView reloadData ];
}

- (void)viewDidUnload
{
    [self setFetchedResultsController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(NSFetchedResultsController*)fetchedResultsController{
    if(_fetchedResultsController !=nil){
        return _fetchedResultsController;
    }
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PersonalBestItem" inManagedObjectContext:context];
    [request setEntity:entity];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"category" ascending:YES];
    NSSortDescriptor *sort2 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObjects:sort,sort2,nil]];
    
    [request setFetchBatchSize:20];
    
    NSFetchedResultsController *thefetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:@"PersonalBests"];
    self.fetchedResultsController = thefetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
    
}

#pragma  mark - tableview datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PesronalBestCell";
    PesronalBestCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[PesronalBestCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}



-(void)configureCell:(PesronalBestCell *)cell forIndexPath:(NSIndexPath *)indexPath{
    PersonalBestItem *item = [_fetchedResultsController objectAtIndexPath:indexPath];
    [cell.nameLabel setText:item.name];
    [cell.duratinLabel setText:[StringFactory exactDurationForTimeInterval:item.totalTime.intValue]];
    if (df==Nil) {
        df =[[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterMediumStyle];
    }
    [cell.dateLabel setText:[df stringFromDate:item.date]];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EditPersonalBestViewController *vc = [[EditPersonalBestViewController alloc] initWithNibName:@"EditPersonalBestViewController" bundle:Nil];
    [vc setDelegate:self];
    [vc setPersonalBestItem:[_fetchedResultsController objectAtIndexPath:indexPath]];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    nvc.navigationBar.tintColor = [UIColor blackColor];
    [self presentModalViewController:nvc animated:YES];
}

#pragma mark editdelegate

-(void)viewControllerDeleted{
    [self dismissModalViewControllerAnimated:YES];
}

-(void)viewControllerDissmedWithItem:(PersonalBestItem *)item{
    [self dismissModalViewControllerAnimated:YES];
}

@end
