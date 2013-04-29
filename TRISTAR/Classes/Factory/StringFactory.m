//
//  StringFactory.m
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "StringFactory.h"

@implementation StringFactory


+(NSString*)swimPaceForMeterPerSecond:(double)mps{
    double speed = mps * 36;
    double pace = 60/speed;
    double frac = pace - (int)pace;
    int sec = 60*frac;
    if (sec==0) {
        return [NSString stringWithFormat:@"%dmin/100m",(int)pace];
    }if (sec<10) {
        return [NSString stringWithFormat:@"%d:0%dmin/100m",(int)pace,sec];
    }
    return [NSString stringWithFormat:@"%d:%dmin/100m",(int)pace,sec];
    
}

+(NSString*)bikePaceForMeterPerSecond:(double)mps{
    return [NSString stringWithFormat:@"%.1f km/h",(mps*3.6)];
}

+(NSString*)runPaceForMeterPerSecond:(double)mps{
    double speed = mps * 3.6;
    double pace = 60/speed;
    double frac = pace - (int)pace;
    int sec = 60*frac;
    if (sec==0) {
        return [NSString stringWithFormat:@"%dmin/km",(int)pace];
    }if (sec<10) {
        return [NSString stringWithFormat:@"%d:0%dmin/km",(int)pace,sec];
    }
    return [NSString stringWithFormat:@"%d:%dmin/km",(int)pace,sec];
}

+(NSString*)exactDurationForTimeInterval:(int)seconds{
    int h = floor(seconds/(60*60));
    int m = floor((seconds -(60*60*h))/60);
    int s = seconds-(floor(seconds/60)*60);
    
    if (h>0) {
        if (m>9) {
            if (s>9) {
                return [NSString stringWithFormat:@"%d:%d:%d",h,m,s];
            }else {
                return [NSString stringWithFormat:@"%d:%d:0%d",h,m,s];
            }
        }else {
            if (s>9) {
                return [NSString stringWithFormat:@"%d:0%d:%d",h,m,s];
            }else {
                return [NSString stringWithFormat:@"%d:0%d:0%d",h,m,s];
            }
        }
    }else{
        if (s>9) {
            return [NSString stringWithFormat:@"%d:%d",m,s];
        }else {
            return [NSString stringWithFormat:@"%d:0%d",m,s];
        }
    }
    
}



@end
