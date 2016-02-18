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

@interface SUNDataStore : SUNSaver

#pragma mark - plist
+(SUNDataStore*) sharedInstance;

//if changing this methods then it need to be changed for using in classes such as: SUNMakingPartyByxibVC, SUNTableMenuVC
+(NSMutableArray *)readFromPlist;
+(BOOL)saveToPlist:(NSMutableArray*)dataFromFile;

#pragma mark - CoreData
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
