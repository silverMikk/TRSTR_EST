//
//  ResultObject.h
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ResultObject : NSManagedObject

@property (nonatomic, retain) NSNumber * ageGroupPosition;
@property (nonatomic, retain) NSNumber * bikeTime;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * overAllPosition;
@property (nonatomic, retain) NSNumber * raceID;
@property (nonatomic, retain) NSNumber * runTime;
@property (nonatomic, retain) NSNumber * startNumber;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSNumber * swimTime;
@property (nonatomic, retain) NSNumber * t1Time;
@property (nonatomic, retain) NSNumber * t2Time;
@property (nonatomic, retain) NSNumber * totalTime;
@property (nonatomic, retain) NSString * ageGroupID;

@end
