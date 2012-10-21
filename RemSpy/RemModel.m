//
//  RemModel.m
//  RemSpy
//
//  Created by Zhang on 15/10/12.
//  Copyright (c) 2012 Zhang. All rights reserved.
//

#import "RemModel.h"

@interface RemModel(){
    EKEventStore *store;
    NSDateFormatter *formatter;
}

@end

@implementation RemModel


- (id)init
{
    self = [super init];
    store = [[EKEventStore alloc] init];
    if([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] ==EKAuthorizationStatusNotDetermined){
        [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
            
        }];
    }else{
        
    }
    
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterMediumStyle];
    }
    
    return self;
}


- (NSArray *)retrieveAllRemindersLists
{
    return [store calendarsForEntityType:EKEntityTypeReminder];
}

- (void)retrieveRemindersFromList:(EKCalendar *)cal withCompletion:(void (^)(NSArray *))completion
{
    if([EKEventStore authorizationStatusForEntityType:EKEntityTypeReminder] == EKAuthorizationStatusAuthorized){
        [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
            NSPredicate *predicate = [store predicateForRemindersInCalendars:[NSArray arrayWithObjects:cal, nil]];
            [store fetchRemindersMatchingPredicate:predicate completion:^(NSArray *reminders) {
                completion(reminders);
            }];
        }];
    }
}

- (void)sendReminders:(NSArray *)reminders
{
    
}



@end
