//
//  RegistrationObject.h
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface RegistrationObject : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * agegroup;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSNumber * raceID;
@property (nonatomic, retain) NSNumber * startNumber;

@end
