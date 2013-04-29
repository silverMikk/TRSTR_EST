//
//  SampleDataFactory.m
//  TRISTAR
//
//  Created by mishanet on 3/24/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate.h"
#import "SampleDataFactory.h"

#import "RegistrationObject.h"
#import "PersonalBestItem.h"
#import "ResultObject.h"
#import "CheckListItem.h"

#define kTri111RaceId 111
#define kTri11RaceId 11
#define kTri33RaceId 33
#define kStarRunRaceId 5

@implementation SampleDataFactory


+(void)samplePersonalBests{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent2 = [NSEntityDescription entityForName:@"PersonalBestItem" inManagedObjectContext:app.managedObjectContext];
    [request2 setEntity:ent2];
    NSArray *arr2 = [app.managedObjectContext executeFetchRequest:request2 error:nil];
    if ([arr2 count]==0) {
        PersonalBestItem *item1 = [NSEntityDescription insertNewObjectForEntityForName:@"PersonalBestItem" inManagedObjectContext:app.managedObjectContext];
        [item1 setDate:[NSDate date]];
        [item1 setName:@"Tartu Mill Triatlon"];
        [item1 setCategory:@"Olympic"];
        [item1 setTotalTime:[NSNumber numberWithInt:(7532)]];
        [item1 setComment:@"Ei midagi erilist"];
        
        
        [app.managedObjectContext save:nil];
    }
}
+(void)sampleCheckLIstItems{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent = [NSEntityDescription entityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
    [request setEntity:ent];
    NSArray *arr = [app.managedObjectContext executeFetchRequest:request error:nil];
    if ([arr count]==0) {
        NSArray *items1 = [NSArray arrayWithObjects:@"Tri Top",@"Tri Shorts",@"Timing Chip",@"Numbers",@"Race Belt",@"Watch",@"Hat",@"Warmup Jacket",@"Warmup Pants",@"Water",@"Sports Drink",@"Gel",@"Bagel",@"Banana",nil];
        NSArray *items2 =[NSArray arrayWithObjects:@"Swim cap",@"Goggles",@"Wetsuit",@"Body Glide",@"Towel",@"Gel",@"Water",@"Sports drink", nil];
        NSArray *items3 =[NSArray arrayWithObjects:@"Glasses",@"Helmet",@"Socks",@"Bike Shoes",@"Socks",@"Gloves",@"Spare Tube",@"Pocket Pump",@"Floor Pump",@"C02 Cartridge",@"Tire Irons",@"Gel",@"Bars",@"Water",@"Sports drink", nil];
        NSArray *items4 =[NSArray arrayWithObjects:@"Running Shoes",@"Visor",@"Water belt",@"Sun Screen",@"Gel",@"Water",@"Sports drink", nil];
        NSArray *items5 =[NSArray arrayWithObjects:@"Plastic Bag",@"Shirt",@"Shorts",@"Mobile Phone",@"Money", nil];
        
        for (NSString *item in items1) {
            CheckListItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
            [newItem setName:item];
            [newItem setChecked:[NSNumber numberWithBool:NO]];
            [newItem setCategory:@"Preparation"];
        }
        for (NSString *item in items2) {
            CheckListItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
            [newItem setName:item];
            [newItem setChecked:[NSNumber numberWithBool:NO]];
            [newItem setCategory:@"Swim"];
        }
        for (NSString *item in items3) {
            CheckListItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
            [newItem setName:item];
            [newItem setChecked:[NSNumber numberWithBool:NO]];
            [newItem setCategory:@"Bike"];
        }
        for (NSString *item in items4) {
            CheckListItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
            [newItem setName:item];
            [newItem setChecked:[NSNumber numberWithBool:NO]];
            [newItem setCategory:@"Run"];
        }
        for (NSString *item in items5) {
            CheckListItem *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"CheckListItem" inManagedObjectContext:app.managedObjectContext];
            [newItem setName:item];
            [newItem setChecked:[NSNumber numberWithBool:NO]];
            [newItem setCategory:@"Finish"];
        }
        
        
        [app.managedObjectContext save:nil];   
    }
    
    
   
}

+(void)sampleTri111Results{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent2 = [NSEntityDescription entityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
    [request2 setEntity:ent2];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"raceID == %d",kTri111RaceId];
    [request2 setPredicate:pred];
    NSArray *arr2 = [app.managedObjectContext executeFetchRequest:request2 error:nil];
    if ([arr2 count]==0) {
        ResultObject *result1 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result1 setAgeGroupPosition:[NSNumber numberWithInt:1]];
        [result1 setOverAllPosition:[NSNumber numberWithInt:1]];
        
        [result1 setSwimTime:[NSNumber numberWithInt:660]];
        [result1 setT1Time:[NSNumber numberWithInt:60]];
        [result1 setBikeTime:[NSNumber numberWithInt:9000]];
        [result1 setT2Time:[NSNumber numberWithInt:60]];
        [result1 setRunTime:[NSNumber numberWithInt:2100]];
        
        [result1 setTotalTime:[NSNumber numberWithInt:11880]];
        
        [result1 setRaceID:[NSNumber numberWithInt:kTri111RaceId]];
        [result1 setAgeGroupID:@"MPRO"];
        [result1 setStartNumber:[NSNumber numberWithInt:1]];
        
        [result1 setName:@"Silver"];
        [result1 setSurname:@"Mikk"];
        
        //
        ResultObject *result2 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result2 setAgeGroupPosition:[NSNumber numberWithInt:2]];
        [result2 setOverAllPosition:[NSNumber numberWithInt:2]];
        
        [result2 setSwimTime:[NSNumber numberWithInt:660]];
        [result2 setT1Time:[NSNumber numberWithInt:60]];
        [result2 setBikeTime:[NSNumber numberWithInt:9000]];
        [result2 setT2Time:[NSNumber numberWithInt:60]];
        [result2 setRunTime:[NSNumber numberWithInt:2100]];
        
        [result2 setTotalTime:[NSNumber numberWithInt:11880]];
        
        [result2 setRaceID:[NSNumber numberWithInt:kTri111RaceId]];
        [result2 setAgeGroupID:@"MPRO"];
        [result2 setStartNumber:[NSNumber numberWithInt:2]];
        
        [result2 setName:@"Ain-Alar"];
        [result2 setSurname:@"Juhanson"];
        
        //
        ResultObject *result3 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result3 setAgeGroupPosition:[NSNumber numberWithInt:12]];
        [result3 setOverAllPosition:[NSNumber numberWithInt:343]];
        
        [result3 setSwimTime:[NSNumber numberWithInt:660]];
        [result3 setT1Time:[NSNumber numberWithInt:60]];
        [result3 setBikeTime:[NSNumber numberWithInt:9000]];
        [result3 setT2Time:[NSNumber numberWithInt:60]];
        [result3 setRunTime:[NSNumber numberWithInt:2100]];
        
        [result3 setTotalTime:[NSNumber numberWithInt:11880]];
        
        [result3 setRaceID:[NSNumber numberWithInt:kTri111RaceId]];
        [result3 setAgeGroupID:@"WPRO"];
        [result3 setStartNumber:[NSNumber numberWithInt:1234]];
        
        [result3 setName:@"Liis"];
        [result3 setSurname:@"Ojokas"];
        
        //
        ResultObject *result4 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result4 setSwimTime:[NSNumber numberWithInt:660]];
        [result4 setT1Time:[NSNumber numberWithInt:60]];
        [result4 setBikeTime:[NSNumber numberWithInt:9000]];
        [result4 setT2Time:[NSNumber numberWithInt:60]];
        [result4 setRunTime:[NSNumber numberWithInt:2100]];
        
        [result4 setTotalTime:[NSNumber numberWithInt:11880]];
    
        [result4 setRaceID:[NSNumber numberWithInt:kTri111RaceId]];
        [result4 setAgeGroupID:@"M60-64"];
        [result4 setStartNumber:[NSNumber numberWithInt:21]];
        
        [result4 setName:@"Kregor"];
        [result4 setSurname:@"Zirk"];
        
        //
        
        [app.managedObjectContext save:nil];
    }

}
+(void)sampleTri11Results{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent2 = [NSEntityDescription entityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
    [request2 setEntity:ent2];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"raceID == %d",kTri11RaceId];
    [request2 setPredicate:pred];
    NSArray *arr2 = [app.managedObjectContext executeFetchRequest:request2 error:nil];
    if ([arr2 count]==0) {
        ResultObject *result1 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result1 setAgeGroupPosition:[NSNumber numberWithInt:1]];
        [result1 setOverAllPosition:[NSNumber numberWithInt:1]];
        
        [result1 setSwimTime:[NSNumber numberWithInt:666]];
        [result1 setT1Time:[NSNumber numberWithInt:60]];
        [result1 setBikeTime:[NSNumber numberWithInt:666]];
        [result1 setT2Time:[NSNumber numberWithInt:60]];
        [result1 setRunTime:[NSNumber numberWithInt:666]];
        
        [result1 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result1 setRaceID:[NSNumber numberWithInt:kTri11RaceId]];
        [result1 setAgeGroupID:@"MPRO"];
        [result1 setStartNumber:[NSNumber numberWithInt:1]];
        
        [result1 setName:@"Silver"];
        [result1 setSurname:@"Mikk"];
        
        //
        ResultObject *result2 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result2 setAgeGroupPosition:[NSNumber numberWithInt:2]];
        [result2 setOverAllPosition:[NSNumber numberWithInt:2]];
        
        [result2 setSwimTime:[NSNumber numberWithInt:666]];
        [result2 setT1Time:[NSNumber numberWithInt:60]];
        [result2 setBikeTime:[NSNumber numberWithInt:666]];
        [result2 setT2Time:[NSNumber numberWithInt:60]];
        [result2 setRunTime:[NSNumber numberWithInt:666]];
        
        [result2 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result2 setRaceID:[NSNumber numberWithInt:kTri11RaceId]];
        [result2 setAgeGroupID:@"MPRO"];
        [result2 setStartNumber:[NSNumber numberWithInt:2]];
        
        [result2 setName:@"Ain-Alar"];
        [result2 setSurname:@"Juhanson"];
        
        //
        ResultObject *result3 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result3 setAgeGroupPosition:[NSNumber numberWithInt:12]];
        [result3 setOverAllPosition:[NSNumber numberWithInt:343]];
        
        [result3 setSwimTime:[NSNumber numberWithInt:666]];
        [result3 setT1Time:[NSNumber numberWithInt:60]];
        [result3 setBikeTime:[NSNumber numberWithInt:666]];
        [result3 setT2Time:[NSNumber numberWithInt:60]];
        [result3 setRunTime:[NSNumber numberWithInt:666]];
        
        [result3 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result3 setRaceID:[NSNumber numberWithInt:kTri11RaceId]];
        [result3 setAgeGroupID:@"WPRO"];
        [result3 setStartNumber:[NSNumber numberWithInt:1234]];
        
        [result3 setName:@"Liis"];
        [result3 setSurname:@"Ojokas"];
        
        //
        ResultObject *result4 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result4 setAgeGroupPosition:[NSNumber numberWithInt:1231]];
        [result4 setOverAllPosition:[NSNumber numberWithInt:31]];
        
        [result4 setSwimTime:[NSNumber numberWithInt:666]];
        [result4 setT1Time:[NSNumber numberWithInt:60]];
        [result4 setBikeTime:[NSNumber numberWithInt:666]];
        [result4 setT2Time:[NSNumber numberWithInt:60]];
        [result4 setRunTime:[NSNumber numberWithInt:666]];
        
        [result4 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result4 setRaceID:[NSNumber numberWithInt:kTri11RaceId]];
        [result4 setAgeGroupID:@"M60-64"];
        [result4 setStartNumber:[NSNumber numberWithInt:21]];
        
        [result4 setName:@"Kregor"];
        [result4 setSurname:@"Zirk"];
        
        //
        
        [app.managedObjectContext save:nil];
    }

}
+(void)sampleTri33Results{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent2 = [NSEntityDescription entityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
    [request2 setEntity:ent2];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"raceID == %d",kTri33RaceId];
    [request2 setPredicate:pred];
    NSArray *arr2 = [app.managedObjectContext executeFetchRequest:request2 error:nil];
    if ([arr2 count]==0) {
        ResultObject *result1 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result1 setAgeGroupPosition:[NSNumber numberWithInt:1]];
        [result1 setOverAllPosition:[NSNumber numberWithInt:1]];
        
        [result1 setSwimTime:[NSNumber numberWithInt:666]];
        [result1 setT1Time:[NSNumber numberWithInt:60]];
        [result1 setBikeTime:[NSNumber numberWithInt:666]];
        [result1 setT2Time:[NSNumber numberWithInt:60]];
        [result1 setRunTime:[NSNumber numberWithInt:666]];
        
        [result1 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result1 setRaceID:[NSNumber numberWithInt:kTri33RaceId]];
        [result1 setAgeGroupID:@"MPRO"];
        [result1 setStartNumber:[NSNumber numberWithInt:1]];
        
        [result1 setName:@"Silver"];
        [result1 setSurname:@"Mikk"];
        
        //
        ResultObject *result2 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result2 setAgeGroupPosition:[NSNumber numberWithInt:2]];
        [result2 setOverAllPosition:[NSNumber numberWithInt:2]];
        
        [result2 setSwimTime:[NSNumber numberWithInt:666]];
        [result2 setT1Time:[NSNumber numberWithInt:60]];
        [result2 setBikeTime:[NSNumber numberWithInt:666]];
        [result2 setT2Time:[NSNumber numberWithInt:60]];
        [result2 setRunTime:[NSNumber numberWithInt:666]];
        
        [result2 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result2 setRaceID:[NSNumber numberWithInt:kTri33RaceId]];
        [result2 setAgeGroupID:@"MPRO"];
        [result2 setStartNumber:[NSNumber numberWithInt:2]];
        
        [result2 setName:@"Ain-Alar"];
        [result2 setSurname:@"Juhanson"];
        
        //
        ResultObject *result3 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result3 setAgeGroupPosition:[NSNumber numberWithInt:12]];
        [result3 setOverAllPosition:[NSNumber numberWithInt:343]];
        
        [result3 setSwimTime:[NSNumber numberWithInt:666]];
        [result3 setT1Time:[NSNumber numberWithInt:60]];
        [result3 setBikeTime:[NSNumber numberWithInt:666]];
        [result3 setT2Time:[NSNumber numberWithInt:60]];
        [result3 setRunTime:[NSNumber numberWithInt:666]];
        
        [result3 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result3 setRaceID:[NSNumber numberWithInt:kTri33RaceId]];
        [result3 setAgeGroupID:@"WPRO"];
        [result3 setStartNumber:[NSNumber numberWithInt:1234]];
        
        [result3 setName:@"Liis"];
        [result3 setSurname:@"Ojokas"];
        
        //
        ResultObject *result4 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result4 setAgeGroupPosition:[NSNumber numberWithInt:1231]];
        [result4 setOverAllPosition:[NSNumber numberWithInt:31]];
        
        [result4 setSwimTime:[NSNumber numberWithInt:666]];
        [result4 setT1Time:[NSNumber numberWithInt:60]];
        [result4 setBikeTime:[NSNumber numberWithInt:666]];
        [result4 setT2Time:[NSNumber numberWithInt:60]];
        [result4 setRunTime:[NSNumber numberWithInt:666]];
        
        [result4 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result4 setRaceID:[NSNumber numberWithInt:kTri33RaceId]];
        [result4 setAgeGroupID:@"M60-64"];
        [result4 setStartNumber:[NSNumber numberWithInt:21]];
        
        [result4 setName:@"Kregor"];
        [result4 setSurname:@"Zirk"];
        
        //
        
        [app.managedObjectContext save:nil];
    }

}
+(void)sampleStarRunResults{
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *request2 = [[NSFetchRequest alloc] init];
    NSEntityDescription *ent2 = [NSEntityDescription entityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
    [request2 setEntity:ent2];
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"raceID == %d",kStarRunRaceId];
    [request2 setPredicate:pred];
    NSArray *arr2 = [app.managedObjectContext executeFetchRequest:request2 error:nil];
    if ([arr2 count]==0) {
        ResultObject *result1 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result1 setAgeGroupPosition:[NSNumber numberWithInt:1]];
        [result1 setOverAllPosition:[NSNumber numberWithInt:1]];
        
        [result1 setSwimTime:[NSNumber numberWithInt:0]];
        [result1 setT1Time:[NSNumber numberWithInt:0]];
        [result1 setBikeTime:[NSNumber numberWithInt:0]];
        [result1 setT2Time:[NSNumber numberWithInt:0]];
        [result1 setRunTime:[NSNumber numberWithInt:666]];
        
        [result1 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result1 setRaceID:[NSNumber numberWithInt:kStarRunRaceId]];
        [result1 setAgeGroupID:@"MPRO"];
        [result1 setStartNumber:[NSNumber numberWithInt:1]];
        
        [result1 setName:@"Silver"];
        [result1 setSurname:@"Mikk"];
        
        //
        ResultObject *result2 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result2 setAgeGroupPosition:[NSNumber numberWithInt:2]];
        [result2 setOverAllPosition:[NSNumber numberWithInt:2]];
        
        [result2 setSwimTime:[NSNumber numberWithInt:0]];
        [result2 setT1Time:[NSNumber numberWithInt:0]];
        [result2 setBikeTime:[NSNumber numberWithInt:0]];
        [result2 setT2Time:[NSNumber numberWithInt:0]];
        [result2 setRunTime:[NSNumber numberWithInt:666]];
        
        [result2 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result2 setRaceID:[NSNumber numberWithInt:kStarRunRaceId]];
        [result2 setAgeGroupID:@"MPRO"];
        [result2 setStartNumber:[NSNumber numberWithInt:2]];
        
        [result2 setName:@"Ain-Alar"];
        [result2 setSurname:@"Juhanson"];
        
        //
        ResultObject *result3 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result3 setAgeGroupPosition:[NSNumber numberWithInt:12]];
        [result3 setOverAllPosition:[NSNumber numberWithInt:343]];
        
        [result3 setSwimTime:[NSNumber numberWithInt:0]];
        [result3 setT1Time:[NSNumber numberWithInt:0]];
        [result3 setBikeTime:[NSNumber numberWithInt:0]];
        [result3 setT2Time:[NSNumber numberWithInt:0]];
        [result3 setRunTime:[NSNumber numberWithInt:666]];
        
        [result3 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result3 setRaceID:[NSNumber numberWithInt:kStarRunRaceId]];
        [result3 setAgeGroupID:@"WPRO"];
        [result3 setStartNumber:[NSNumber numberWithInt:1234]];
        
        [result3 setName:@"Liis"];
        [result3 setSurname:@"Ojokas"];
        
        //
        ResultObject *result4 = [NSEntityDescription insertNewObjectForEntityForName:@"ResultObject" inManagedObjectContext:app.managedObjectContext];
        
        [result4 setAgeGroupPosition:[NSNumber numberWithInt:1231]];
        [result4 setOverAllPosition:[NSNumber numberWithInt:31]];
        
        [result4 setSwimTime:[NSNumber numberWithInt:0]];
        [result4 setT1Time:[NSNumber numberWithInt:0]];
        [result4 setBikeTime:[NSNumber numberWithInt:0]];
        [result4 setT2Time:[NSNumber numberWithInt:0]];
        [result4 setRunTime:[NSNumber numberWithInt:666]];
        
        [result4 setTotalTime:[NSNumber numberWithInt:666]];
        
        [result4 setRaceID:[NSNumber numberWithInt:kStarRunRaceId]];
        [result4 setAgeGroupID:@"M60-64"];
        [result4 setStartNumber:[NSNumber numberWithInt:21]];
        
        [result4 setName:@"Kregor"];
        [result4 setSurname:@"Zirk"];
        
        //
        
        [app.managedObjectContext save:nil];
    }

}

+(void)sampleTri111Registrations{
    
}
+(void)sampleTri11Registrations{

}
+(void)sampleTri33Registrations{
    
}
+(void)sampleStarRunRegistrations{

}

@end
