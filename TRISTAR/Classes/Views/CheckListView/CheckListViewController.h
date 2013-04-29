//
//  CheckListViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckListViewController : UITableViewController<NSFetchedResultsControllerDelegate>



@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;


-(void)configureCell:(UITableViewCell*)cell forIndexPath:(NSIndexPath*)indexPath;

@end
