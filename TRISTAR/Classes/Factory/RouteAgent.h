//
//  RouteAgent.h
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RouteObject;

@interface RouteAgent : NSObject

-(RouteObject*)getRouteObjectforID:(NSInteger)ID;
-(NSArray*)getRouteWaypointsForID:(NSInteger)ID;
@end
