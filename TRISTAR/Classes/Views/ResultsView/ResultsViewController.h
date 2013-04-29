//
//  ResultsViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


@property (retain, nonatomic) NSNumber* raceID;
@property (retain, nonatomic) NSString *ageGroupID;
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
