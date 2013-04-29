//
//  UpdateLogObject.h
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UpdateLogObject : NSManagedObject

@property (nonatomic, retain) NSDate * lastUpdateTri111Registration;
@property (nonatomic, retain) NSDate * lastUpdateTri33Results;
@property (nonatomic, retain) NSDate * lastUpdateTri111Results;
@property (nonatomic, retain) NSDate * lastUpdateTri11Registration;
@property (nonatomic, retain) NSDate * lastUpdateTri33Registration;
@property (nonatomic, retain) NSDate * lastUPdateTri11Results;

@end
