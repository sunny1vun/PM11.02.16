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

@interface SUNParty : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

//use NSNumber for server and CoreData cause its object, and NSInteger its structure
//@property (nonatomic) NSNumber *partyId;
//@property (nullable, nonatomic, retain) NSString *partyName;
//@property (nonatomic) NSNumber* startTime;
//@property (nonatomic) NSNumber* endTime;
//@property (nullable, nonatomic, retain) NSString *comment;
//@property (nonatomic) NSNumber* logo;
//@property (nonatomic) NSNumber* creatorId;
//@property (nonatomic) NSNumber* latitude;
//@property (nonatomic) NSNumber* longitude;

//check in what type u need to return, in class for +CoreDataProperties
+(SUNParty*) sharedInstance;

//check if startTime is right from timestamp
-(void) initWithCreatorId:(NSNumber *)creatorId   startTime:(NSNumber *)startTime
                          endTime: (NSNumber *)endTime logo:(NSNumber *)currentPage  partyId:(NSNumber*)partyId latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude description:(NSString *)description partyName:(NSString *)partyName;

@end

NS_ASSUME_NONNULL_END

#import "SUNParty+CoreDataProperties.h"
