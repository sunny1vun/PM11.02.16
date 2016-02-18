//
//  SUNPartyUser.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SUNParty;

NS_ASSUME_NONNULL_BEGIN

@interface SUNPartyUser : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
//@property (nonatomic, strong) NSString *email;
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *userId;
//@property (nonatomic, strong) NSString *password;

+(SUNPartyUser*) sharedInstance;

@end

NS_ASSUME_NONNULL_END

#import "SUNPartyUser+CoreDataProperties.h"
