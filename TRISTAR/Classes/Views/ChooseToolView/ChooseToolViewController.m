//
//  ChooseToolViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ChooseToolViewController.h"
#import "PRKeeperViewController.h"
#import "PaceCalcViewController.h"
#import "CheckListViewController.h"
@interface ChooseToolViewController ()

@end

@implementation ChooseToolViewController
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
    [self.navigationItem setTitle:@"Tools"];
    // Do any additional setup after loading the view from its nib.
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
}

- (void)viewDidUnload
{
    [self setDelegate:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)paceCalcPressed:(id)sender {
    PaceCalcViewController *vc = [[PaceCalcViewController alloc] initWithNibName:@"PaceCalcViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)checkListPressed:(id)sender {
    CheckListViewController *vc = [[CheckListViewController alloc] initWithNibName:@"CheckListViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)personalBestPressed:(id)sender {
    PRKeeperViewController *vc = [[PRKeeperViewController alloc] initWithNibName:@"PRKeeperViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
