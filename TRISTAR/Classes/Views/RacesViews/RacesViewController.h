//
//  RacesViewController.h
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalViewDelegate <NSObject>

-(void)dissmisModalView;

@end

@interface RacesViewController : UIViewController

@property (nonatomic, assign) id<ModalViewDelegate> delegate;

- (IBAction)starRunPressed:(id)sender;
- (IBAction)tri111Pressed:(id)sender;
- (IBAction)tri33Pressed:(id)sender;
- (IBAction)tri11Pressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImage;
@end
