//
//  ScheduleViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/13/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RacesViewController.h"

@interface ScheduleViewController : UIViewController{
    int page;
    bool controlUsed;
}

@property (nonatomic,assign) id<ModalViewDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITableView *friDayTable;
@property (strong, nonatomic) IBOutlet UITableView *saturDayTable;
@property (strong, nonatomic) IBOutlet UITableView *sunDayTable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *daysSegment;

@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
- (IBAction)segmentChanged:(id)sender;
@end
