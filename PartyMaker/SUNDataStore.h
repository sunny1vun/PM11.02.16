//
//  SUNDataStore.h
//  PartyMaker
//
//  Created by 2 on 2/12/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SUNSaver.h"
#import "SUNAuthorizationVC.h"
#import "SUNPartyUser.h"
#import "SUNParty.h"

@interface SUNDataStore : SUNSaver <NSFetchedResultsControllerDelegate>

#pragma mark - plist
+(SUNDataStore*) sharedInstance;

//if changing this methods then it need to be changed for using in classes such as: SUNMakingPartyByxibVC, SUNTableMenuVC
+(NSMutableArray *)readFromPlist;
+(BOOL)saveToPlist:(NSMutableArray*)dataFromFile;

#pragma mark - CoreData
@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//change what is abow to what is below
@property (strong, nonatomic) NSManagedObjectContext *backgroundThreadContext;
@property (strong, nonatomic) NSManagedObjectContext *mainThreadContext;

@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

- (void) performWriteOperation:(void (^)(NSManagedObjectContext*))writeBlock completion:(void(^)())completion;

//-(NSMutableArray *)readOperation;

- (BOOL)saveContext;
-(NSMutableArray *)fetchContextForParties:(NSManagedObjectContext *) forRead;
- (void) performFetchOperation:(void (^)(NSManagedObjectContext*))readBlock completion:(void(^)())completion;
//- (NSMutableArray *)readContext:(NSManagedObjectContext *)forReadOrWrite;
//- (NSURL *)applicationDocumentsDirectory;

//-(void)initWithParty: (

@end
