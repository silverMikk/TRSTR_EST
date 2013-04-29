//
//  StringFactory.h
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringFactory : NSObject


+(NSString*)swimPaceForMeterPerSecond:(double)mps;

+(NSString*)bikePaceForMeterPerSecond:(double)mps;

+(NSString*)runPaceForMeterPerSecond:(double)mps;

+(NSString*)exactDurationForTimeInterval:(int)seconds;



@end
