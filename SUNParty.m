//
//  SUNParty.m
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNParty.h"
#import "MBProgressHUD.h"

@implementation SUNParty

// Insert code here to add functionality to your managed object subclass
//
//@synthesize partyId = _partyId;
//@synthesize partyName = _partyName;
//@synthesize startTime = _startTime;
//@synthesize endTime = _endTime;
//@synthesize comment = _comment;
//@synthesize logo = logo;
//@synthesize creatorId = _creatorId;
//@synthesize latitude = _latitude;
//@synthesize longitude = _longitude;


+(SUNParty*) sharedInstance{
    
    static SUNParty *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}


-(void) initWithCreatorId:(NSNumber *)creatorId   startTime:(NSNumber *)startTime
                          endTime: (NSNumber *)endTime logo:(NSNumber *)currentPage  partyId:(NSNumber*)partyId latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude description:(NSString *)description partyName:(NSString *)partyName{
    self.creatorId = creatorId.longValue;
    self.startTime = startTime.longValue;
    self.endTime = endTime.longValue;
    self.logo = currentPage.longValue;
    self.partyId = partyId.longValue;
    self.latitude = latitude.doubleValue;
    self.longitude = longitude.doubleValue;
    self.comment = description;
    self.partyName = partyName;
    
    //    self.uniqueID =
}

@end
