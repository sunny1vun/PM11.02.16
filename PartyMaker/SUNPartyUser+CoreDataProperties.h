//
//  SUNPartyUser+CoreDataProperties.h
//  
//
//  Created by 2 on 2/18/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SUNPartyUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface SUNPartyUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *password;
@property (nonatomic) int64_t userId;

@end

NS_ASSUME_NONNULL_END
