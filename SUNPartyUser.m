//
//  SUNPartyUser.m
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNPartyUser.h"
#import "SUNParty.h"

@implementation SUNPartyUser

// Insert code here to add functionality to your managed object subclass

+(SUNPartyUser*) sharedInstance{
    
    static SUNPartyUser *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[SUNPartyUser alloc] init];
    });
    
    return instance;
}


@end
