//
//  SUNParty.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUNPartyUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface SUNParty : SUNPartyUser

// Insert code here to declare functionality of your managed object subclass

//@property (nonatomic) NSInteger partyId;
//@property (nullable, nonatomic, retain) NSString *partyName;
//@property (nonatomic) NSInteger startTime;
//@property (nonatomic) NSInteger endTime;
//@property (nullable, nonatomic, retain) NSString *comment;
//@property (nonatomic) NSInteger logo;
//@property (nonatomic) NSInteger creatorId;
//@property (nonatomic) double latitude;
//@property (nonatomic) double longitude;

+(SUNParty*) sharedInstance;


@end

NS_ASSUME_NONNULL_END

#import "SUNParty+CoreDataProperties.h"
