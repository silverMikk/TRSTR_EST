//
//  PRKeeperViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditPersonalBestViewController.h"
@class PesronalBestCell;
@interface PRKeeperViewController : UITableViewController<NSFetchedResultsControllerDelegate,EditPersonalBestDelegate>{
    NSDateFormatter *df;
}


@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;


-(void)configureCell:(PesronalBestCell*)cell forIndexPath:(NSIndexPath*)indexPath;
@end
