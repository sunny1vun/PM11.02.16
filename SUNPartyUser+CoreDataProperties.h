//
//  SUNPartyUser+CoreDataProperties.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SUNPartyUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface SUNPartyUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *password;
@property (nullable, nonatomic, retain) NSString *name;
@property (nonatomic) int64_t userId;
@property (nullable, nonatomic, retain) SUNParty *relationship;

@end

NS_ASSUME_NONNULL_END
