//
//  SUNParty.m
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNParty.h"

@implementation SUNParty

// Insert code here to add functionality to your managed object subclass

+(SUNParty*) sharedInstance{
    
    static SUNParty *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[SUNParty alloc] init];
    });
    
    return instance;
}


@end
