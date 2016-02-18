//
//  SUNUser.m
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNUser.h"

@implementation SUNUser

+(SUNUser*) sharedInstance{
    
    static SUNUser *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[SUNUser alloc] init];
    });
    
    return instance;
}

@end
