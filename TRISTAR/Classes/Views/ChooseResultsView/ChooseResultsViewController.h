//
//  ChooseResultsViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseResultsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *categories;
}

@property (retain, nonatomic) NSNumber *raceID;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIImageView *topImage;

@end
