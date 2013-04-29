//
//  EditPersonalBestViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonalBestItem;
@protocol EditPersonalBestDelegate <NSObject>

-(void)viewControllerDissmedWithItem:(PersonalBestItem*)item;
-(void)viewControllerDeleted;

@end


@interface EditPersonalBestViewController : UIViewController

@property (nonatomic, assign) id<EditPersonalBestDelegate> delegate;
@property (retain, nonatomic) PersonalBestItem *personalBestItem;
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *hoursTf;
@property (weak, nonatomic) IBOutlet UITextField *minutesTf;
@property (weak, nonatomic) IBOutlet UITextField *secondsTf;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UITextField *commentsTf;

- (IBAction)datePressed:(id)sender;
- (IBAction)savePressed:(id)sender;
- (IBAction)deletePressed:(id)sender;

@end
