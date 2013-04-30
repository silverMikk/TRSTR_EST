//
//  PaceCalcViewController.m
//  TRISTAR
//
//  Created by mishanet on 3/4/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "PaceCalcViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "SplitValues.h"
#import "StringFactory.h"

@interface PaceCalcViewController ()

@end

@implementation PaceCalcViewController
@synthesize swimDurationLabel;
@synthesize T1DurationLabel;
@synthesize bikeDurationLabel;
@synthesize T2DurationLabel;
@synthesize runDurationLabel;
@synthesize totalDurationLabel;
@synthesize swimSpeedLabel;
@synthesize bikeSpeedLabel;
@synthesize runSpeedLabel;
@synthesize swimDistanceLabel;
@synthesize bikeDistanceLabel;
@synthesize runDistanceLabel;
@synthesize unitsSegment;
@synthesize distanceSegment;
@synthesize swimSlider;
@synthesize T1Slider;
@synthesize bikeSlider;
@synthesize T2Slider;
@synthesize t1Label;
@synthesize t2Label;
@synthesize runSlider;
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
    swimDurationLabel.layer.cornerRadius=5;
    T1DurationLabel.layer.cornerRadius=5;
    bikeDurationLabel.layer.cornerRadius=5;
    T2DurationLabel.layer.cornerRadius=5;
    runDurationLabel.layer.cornerRadius=5;
    totalDurationLabel.layer.cornerRadius=5;
    
    swimSpeedLabel.layer.cornerRadius=5;
    bikeSpeedLabel.layer.cornerRadius=5;
    runSpeedLabel.layer.cornerRadius=5;
    
    t1Label.layer.cornerRadius=5;
    t2Label.layer.cornerRadius=5;
    
    swimDistanceLabel.layer.cornerRadius=5;
    bikeDistanceLabel.layer.cornerRadius=5;
    runDistanceLabel.layer.cornerRadius=5;
    
    [self.navigationItem setTitle:@"Pace Calculator"];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Main" style:UIBarButtonItemStyleBordered target:self.delegate action:@selector(dissmisModalView)];
    [self.navigationItem setLeftBarButtonItem:button];
    // Do any additional setup after loading the view from its nib.
    [unitsSegment setSelectedSegmentIndex:0];
    [distanceSegment setSelectedSegmentIndex:0];
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    context = [app managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SplitValues" inManagedObjectContext:context];
    [request setEntity:entity];
    NSArray *arr = [context executeFetchRequest:request error:nil];
    if ([arr count]!=0) {
        splitValues = [arr objectAtIndex:0];
    }else {
        
        splitValues = [NSEntityDescription insertNewObjectForEntityForName:@"SplitValues" inManagedObjectContext:context];
        
        [splitValues setT1_111:[NSNumber numberWithDouble:300]];
        [splitValues setT1_11:[NSNumber numberWithDouble:300]];
        [splitValues setT1_33:[NSNumber numberWithDouble:300]];
        
        [splitValues setT2_111:[NSNumber numberWithDouble:300]];
        [splitValues setT2_11:[NSNumber numberWithDouble:300]];
        [splitValues setT2_33:[NSNumber numberWithDouble:300]];
        
        [splitValues setSwim111:[NSNumber numberWithDouble:1200]];
        [splitValues setSwim11:[NSNumber numberWithDouble:120]];
        [splitValues setSwim33:[NSNumber numberWithDouble:360]];
        
        [splitValues setBike111:[NSNumber numberWithDouble:12000]];
        [splitValues setBike11:[NSNumber numberWithDouble:1200]];
        [splitValues setBike33:[NSNumber numberWithDouble:3600]];
        
        [splitValues setRun111:[NSNumber numberWithDouble:3600]];
        [splitValues setRun11:[NSNumber numberWithDouble:300]];
        [splitValues setRun33:[NSNumber numberWithDouble:900]];
    }
}

- (void)viewDidUnload
{
    [self setSwimDurationLabel:nil];
    [self setT1DurationLabel:nil];
    [self setBikeDurationLabel:nil];
    [self setT2DurationLabel:nil];
    [self setRunDurationLabel:nil];
    [self setTotalDurationLabel:nil];
    [self setSwimSpeedLabel:nil];
    [self setBikeSpeedLabel:nil];
    [self setRunSpeedLabel:nil];
    [self setSwimDistanceLabel:nil];
    [self setBikeDistanceLabel:nil];
    [self setRunDistanceLabel:nil];
    [self setUnitsSegment:nil];
    [self setDistanceSegment:nil];
    [self setSwimSlider:nil];
    [self setT1Slider:nil];
    [self setBikeSlider:nil];
    [self setT2Slider:nil];
    [self setRunSlider:nil];
    [self setT1Label:nil];
    [self setT2Label:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    switch ([distanceSegment selectedSegmentIndex]) {
        case 0:
            meterToSwim = 1000;
            meterToBike = 100000;
            meterToRun = 10000;
            [self setSlidersTo111];
            break;
            
        case 1:
            meterToSwim = 300;
            meterToBike = 30000;
            meterToRun = 3000;
            [self setSlidersTo33];
            break;
            
        case 2:
            meterToSwim = 100;
            meterToBike = 10000;
            meterToRun = 1000;
            [self setSlidersTo11];
            break;
            
        default:
            break;
    }
}

-(void)viewDidDisappear:(BOOL)animated{
    [context save:nil];
}

-(void)setSlidersTo111{
    
    [swimSlider setMinimumValue:660.0];
    [swimSlider setMaximumValue:1800.0];
    [bikeSlider setMinimumValue:7800];
    [bikeSlider setMaximumValue:14400];
    [runSlider setMinimumValue:1800];
    [runSlider setMaximumValue:3800];
    
    [swimSlider setValue:splitValues.swim111.doubleValue];
    [bikeSlider setValue:splitValues.bike111.doubleValue];
    [runSlider setValue:splitValues.run111.doubleValue];
    [T1Slider setValue:splitValues.t1_111.doubleValue];
    [T2Slider setValue:splitValues.t2_111.doubleValue];
    
    [self adjustPaceLabels];
}

-(void)setSlidersTo11{
    
    [swimSlider setMinimumValue:60.0];
    [swimSlider setMaximumValue:240.0];
    [bikeSlider setMinimumValue:900];
    [bikeSlider setMaximumValue:2700];
    [runSlider setMinimumValue:180];
    [runSlider setMaximumValue:600];
    
    [swimSlider setValue:splitValues.swim11.doubleValue];
    [bikeSlider setValue:splitValues.bike11.doubleValue];
    [runSlider setValue:splitValues.run11.doubleValue];
    [T1Slider setValue:splitValues.t1_11.doubleValue];
    [T2Slider setValue:splitValues.t2_11.doubleValue];
    
    [self adjustPaceLabels];
}

-(void)setSlidersTo33{
    
    
    [swimSlider setMinimumValue:180.0];
    [swimSlider setMaximumValue:720.0];
    [bikeSlider setMinimumValue:2400];
    [bikeSlider setMaximumValue:5400];
    [runSlider setMinimumValue:540];
    [runSlider setMaximumValue:1500];
    
    [swimSlider setValue:splitValues.swim33.doubleValue];
    [bikeSlider setValue:splitValues.bike33.doubleValue];
    [runSlider setValue:splitValues.run33.doubleValue];
    [T1Slider setValue:splitValues.t1_33.doubleValue];
    [T2Slider setValue:splitValues.t2_33.doubleValue];
    
    [self adjustPaceLabels];
}

-(void)saveChanges{
    switch ([distanceSegment selectedSegmentIndex]) {
        case 0:
            [splitValues setSwim111:[NSNumber numberWithDouble:[swimSlider value]]];
            [splitValues setBike111:[NSNumber numberWithDouble:[bikeSlider value]]];
            [splitValues setRun111:[NSNumber numberWithDouble:[runSlider value]]];
            [splitValues setT1_111:[NSNumber numberWithDouble:[T1Slider value]]];
            [splitValues setT2_111:[NSNumber numberWithDouble:[T2Slider value]]];
            break;
            
        case 1:
            [splitValues setSwim33:[NSNumber numberWithDouble:[swimSlider value]]];
            [splitValues setBike33:[NSNumber numberWithDouble:[bikeSlider value]]];
            [splitValues setRun33:[NSNumber numberWithDouble:[runSlider value]]];
            [splitValues setT1_33:[NSNumber numberWithDouble:[T1Slider value]]];
            [splitValues setT2_33:[NSNumber numberWithDouble:[T2Slider value]]];
            [self setSlidersTo33];
            break;
            
        case 2:
            [splitValues setSwim11:[NSNumber numberWithDouble:[swimSlider value]]];
            [splitValues setBike11:[NSNumber numberWithDouble:[bikeSlider value]]];
            [splitValues setRun11:[NSNumber numberWithDouble:[runSlider value]]];
            [splitValues setT1_11:[NSNumber numberWithDouble:[T1Slider value]]];
            [splitValues setT2_11:[NSNumber numberWithDouble:[T2Slider value]]];
            [self setSlidersTo11];
            break;
            
        default:
            break;
    }

}

-(void)adjustPaceLabels{
    double meterPerSecondSwim = meterToSwim / swimSlider.value;
    double meterPerSecondBike = meterToBike / bikeSlider.value;
    double meterPerSecondRun = meterToRun / runSlider.value;
    
    int totalTime = swimSlider.value + bikeSlider.value + runSlider.value + T1Slider.value +T2Slider.value;
    
    [swimDurationLabel setText:[StringFactory exactDurationForTimeInterval:swimSlider.value]];
    [bikeDurationLabel setText:[StringFactory exactDurationForTimeInterval:bikeSlider.value]];
    [runDurationLabel setText:[StringFactory exactDurationForTimeInterval:runSlider.value]];
    
    [T1DurationLabel setText:[StringFactory exactDurationForTimeInterval:T1Slider.value]];
    [T2DurationLabel setText:[StringFactory exactDurationForTimeInterval:T2Slider.value]];
    
    [swimSpeedLabel setText:[StringFactory swimPaceForMeterPerSecond:meterPerSecondSwim]];
    [bikeSpeedLabel setText:[StringFactory bikePaceForMeterPerSecond:meterPerSecondBike]];
    [runSpeedLabel setText:[StringFactory runPaceForMeterPerSecond:meterPerSecondRun]];
    
    [totalDurationLabel setText:[StringFactory exactDurationForTimeInterval:totalTime]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)swimSliderChanged:(id)sender {
    [self adjustPaceLabels];
    [self saveChanges];
}

- (IBAction)T1SliderChanged:(id)sender {
    [self adjustPaceLabels];
    [self saveChanges];
}

- (IBAction)bikeSliderChanged:(id)sender {
    [self adjustPaceLabels];
    [self saveChanges];
}

- (IBAction)T2SliderChanged:(id)sender {
    [self adjustPaceLabels];
    [self saveChanges];
}

- (IBAction)runSliderChanged:(id)sender {
    [self adjustPaceLabels];
    [self saveChanges];
}

- (IBAction)unitsChanged:(id)sender {
}

- (IBAction)distanceChanged:(id)sender {
    switch ([distanceSegment selectedSegmentIndex]) {
        case 0:
            meterToSwim = 1000;
            meterToBike = 100000;
            meterToRun = 10000;
            [self setSlidersTo111];
            break;
            
        case 1:
            meterToSwim = 300;
            meterToBike = 30000;
            meterToRun = 3000;
            [self setSlidersTo33];
            break;
            
        case 2:
            meterToSwim = 100;
            meterToBike = 10000;
            meterToRun = 1000;
            [self setSlidersTo11];
            break;
            
        default:
            break;
    }

}
@end
