//
//  SUNPartyUser.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUNDataStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface SUNPartyUser : NSManagedObject

// Insert code here to declare functionality of your managed object subclass
//@property (nonatomic, strong) NSString *email;
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *userId;
//@property (nonatomic, strong) NSString *password;

//@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
//@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

+(SUNPartyUser*) sharedInstance;

-(void) initWithEmail:(NSString *)email   name:(NSString *)name
               userId: (NSString *)userId password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END

#import "SUNPartyUser+CoreDataProperties.h"
