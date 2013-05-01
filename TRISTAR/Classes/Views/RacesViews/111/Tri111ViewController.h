//
//  Tri111ViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChapterCell;

@interface Tri111ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate>{
    NSArray *titles ;
    NSArray *contents;
    ChapterCell *chapter;
}

- (IBAction)routePressed:(id)sender;
- (IBAction)rulesPressed:(id)sender;
-(IBAction)resultsPressed:(id)sender;

@property (strong, nonatomic) IBOutlet UITableViewCell *firstCell;
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (weak, nonatomic) IBOutlet UIButton *routeButton;
@property (weak, nonatomic) IBOutlet UIButton *rulesButton;
@property (weak, nonatomic) IBOutlet UIButton *resultsButton;
@end
