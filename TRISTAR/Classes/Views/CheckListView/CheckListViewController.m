//
//  CheckListViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CheckListViewController.h"
#import "AppDelegate.h"
#import "CheckListItem.h"

@interface CheckListViewController ()

@end

@implementation CheckListViewController

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
 
    
    NSError *error;
    if(![[self fetchedResultsController]performFetch:&error ]){
        NSLog(@"Unresolced error %@ %@",error,[error userInfo]);
        exit(-1);
    }
[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Reset" style:UIBarButtonItemStyleBordered target:self action:@selector(reset)] ];
}

-(void)reset{
    for (int i=0; i< [self numberOfSectionsInTableView:self.tableView] ; i++) {
        for (int j=0;j<[self tableView:self.tableView numberOfRowsInSection:i]; j++) {
            CheckListItem *item = [_fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            [item setChecked:[NSNumber numberWithInt:0]];
            
        }
    }
    [self.tableView reloadData];
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

-(void)viewDidDisappear:(BOOL)animated{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app.managedObjectContext save:nil];
}

-(NSFetchedResultsController*)fetchedResultsController{
    if(_fetchedResultsController !=nil){
        return _fetchedResultsController;
    }
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"CheckListItem" inManagedObjectContext:context];
    [request setEntity:entity];
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"category" ascending:YES];
    NSSortDescriptor *sort2 = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObjects:sort,sort2,nil]];
    
    [request setFetchBatchSize:20];
    
    NSFetchedResultsController *thefetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:context sectionNameKeyPath:nil cacheName:@"CheckItems"];
    self.fetchedResultsController = thefetchedResultsController;
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
    
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Preparation";
            break;
            
        case 1:
            return @"Swim";
            break;
            
        case 2:
            return @"Bike";
            break;
            
        case 3:
            return @"Run";
            break;
            
        case 4:
            return @"Finish";
            break;
            
        default:
            break;
    }
    return nil;
}


-(void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath{
    CheckListItem *item = [_fetchedResultsController objectAtIndexPath:indexPath];
    [cell.textLabel setText:item.name];
    if (item.checked.boolValue) {
        [cell.detailTextLabel setText:@"Check"];
    }else {
        [cell.detailTextLabel setText:@"No"];
    }
}

#pragma  mark - tableview datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CheckListItem *item = [_fetchedResultsController objectAtIndexPath:indexPath];
    [item setChecked:[NSNumber numberWithBool:!(item.checked.boolValue)]];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath ] withRowAnimation:UITableViewRowAnimationFade];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
