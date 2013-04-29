//
//  CheckListItem.h
//  TRISTAR
//
//  Created by mishanet on 3/16/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CheckListItem : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * checked;
@property (nonatomic, retain) NSString * name;

@end
