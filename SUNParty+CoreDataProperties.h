//
//  SUNParty+CoreDataProperties.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SUNParty.h"

NS_ASSUME_NONNULL_BEGIN

@interface SUNParty (CoreDataProperties)

@property (nonatomic) int64_t partyId;
@property (nullable, nonatomic, retain) NSString *partyName;
@property (nonatomic) int64_t startTime;
@property (nonatomic) int64_t endTime;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nonatomic) int64_t logo;
@property (nonatomic) int64_t creatorId;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, retain) NSSet<SUNPartyUser *> *relationship;

@end

@interface SUNParty (CoreDataGeneratedAccessors)

- (void)addRelationshipObject:(SUNPartyUser *)value;
- (void)removeRelationshipObject:(SUNPartyUser *)value;
- (void)addRelationship:(NSSet<SUNPartyUser *> *)values;
- (void)removeRelationship:(NSSet<SUNPartyUser *> *)values;

@end

NS_ASSUME_NONNULL_END
