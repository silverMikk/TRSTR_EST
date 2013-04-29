//
//  RouteAgent.m
//  TRISTAR
//
//  Created by mishanet on 3/9/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "RouteAgent.h"
#import "RouteFactory.h"
#import "AppDelegate.h"
#import "RouteObject.h"
#import "WaypointObject.h"

@implementation RouteAgent


-(RouteObject*)getRouteObjectforID:(NSInteger)ID{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"RouteObject" inManagedObjectContext:app.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"routeId == %d",ID];
    [request setPredicate:pred];
    NSArray *arr = [app.managedObjectContext executeFetchRequest:request error:nil];
    if ([arr count]==1) {
        return [arr objectAtIndex:0];
    }else if ([arr count]>0) {
        NSLog(@"ERRROR FOUND TO MAN ROUTES WITH ID %d",ID);
    }else if (arr.count==0) {
        switch (ID) {
            case 5:
                [RouteFactory createStarRun];
                break;
                
            case 11:
                [RouteFactory createTri111_Swim];
                break;
                
            case 12:
                [RouteFactory createTri111_Bike];
                break;
                
            case 13:
                [RouteFactory createTri111_Run];
                break;
                
            case 31:
                [RouteFactory createTri33_Swim];
                break;
                
            case 32:
                [RouteFactory createTri33_Bike];
                break;
                
            case 33:
                [RouteFactory createTri33_Run];
                break;
                
            case 21:
                [RouteFactory createTri11_Swim];
                break;
                
            case 22:
                [RouteFactory createTri11_Bike];
                break;
                
            case 23:
                [RouteFactory createTri11_Run];   
                break;
                
            default:
                break;
        }
        return [self getRouteObjectforID:ID];
    }
    return nil;
}
-(NSArray*)getRouteWaypointsForID:(NSInteger)ID{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"WaypointObject" inManagedObjectContext:app.managedObjectContext];
    [request setEntity:entity];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"routeId == %d",ID];
    [request setPredicate:pred];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:YES];
    [request setSortDescriptors:[NSArray arrayWithObject:sort]];
    NSArray *arr = [app.managedObjectContext executeFetchRequest:request error:nil];
    if ([arr count]>0) {
        return arr;
    }else {
        switch (ID) {
            case 5:
                [RouteFactory createStarRun];
                break;
                
            case 11:
                [RouteFactory createTri111_Swim];
                break;
                
            case 12:
                [RouteFactory createTri111_Bike];
                break;
                
            case 13:
                [RouteFactory createTri111_Run];
                break;
                
            case 31:
                [RouteFactory createTri33_Swim];
                break;
                
            case 32:
                [RouteFactory createTri33_Bike];
                break;
                
            case 33:
                [RouteFactory createTri33_Run];
                break;
                
            case 21:
                [RouteFactory createTri11_Swim];
                break;
                
            case 22:
                [RouteFactory createTri11_Bike];
                break;
                
            case 23:
                [RouteFactory createTri11_Run];   
                break;
                
            default:
                break;
        }
        return [self getRouteWaypointsForID:ID];
    }
    return nil;
}

@end
