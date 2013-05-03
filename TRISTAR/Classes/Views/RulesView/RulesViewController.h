//
//  RulesViewController.h
//  TRISTAR
//
//  Created by Silver Mikk on 5/2/13.
//
//

#import <UIKit/UIKit.h>

@class RuleCell;

@interface RulesViewController : UIViewController<UITableViewDataSource>{
    NSArray *content;
    RuleCell *sample;
}

@property (strong, nonatomic) IBOutlet UITableViewCell *firstCell;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UIImageView *backGround;
@end
