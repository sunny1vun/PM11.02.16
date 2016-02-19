//
//  SUNDataStore.m
//  PartyMaker
//
//  Created by 2 on 2/12/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNDataStore.h"
#import "SUNPartyMakerSDK.h"

@interface SUNDataStore()

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSDictionary *senderDictionary;
@property (nonatomic, strong) NSDictionary *responseDictionary;

@property (nonatomic) NSInteger count;
//- (BOOL) canPassThisWindowWithIdentifier:(NSString *)identifier senderDictionary:(NSDictionary*)senderDictionary responseDictionary:(NSDictionary*)response;
//
//- (BOOL) willPassNextWindow:(NSString *)identifier;
//-(void)willPassNextWindow(NSString *)identifier;
@end

@implementation SUNDataStore

#pragma mark - singlton

+(instancetype) sharedInstance{
    
    static SUNDataStore *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[self alloc] init];
        //call method below to shared instance from SUNMenuMakerVC at the end of setting @syntysyse properties then
        [instance initializeCoreDataFor];
        NSLog(@"DataStore initialised in singlton");

    });
    
    return instance;
}

#pragma mark - need to make from methods below new db methods

//if u will need fetching just write -> "fe" and xcode will show u magic

#pragma mark - from apple Core Data stack

//- (void)initializeCoreDataFor:(NSManagedObjectContext *) readOrWrite
- (void)initializeCoreDataFor
{
    //_managedObjectContext
//    _managedObjectContext = readOrWrite;
//    self.managedObjectContext = readOrWrite;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PartyMaker" withExtension:@"momd"];
    //_managedObjectModel

    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    NSAssert(mom != nil, @"Error initializing Managed Object Model");
    
    //_persistentStoreCoordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    //applicationDocumetnsDirectory
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    [self setManagedObjectContext:moc];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"PartyMaker.sqlite"];
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSError *error = nil;
        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        //setted nil in options
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
    });
}



#pragma mark - Core Data stack

//@synthesize managedObjectContext = _managedObjectContext;
//
@synthesize backgroundThreadContext = _backgroundThreadContext;
@synthesize mainThreadContext = _mainThreadContext;
//
//@synthesize managedObjectModel = _managedObjectModel;
//@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//@synthesize <#property#>

//- (NSURL *)applicationDocumentsDirectory {
//    // The directory the application uses to store the Core Data store file. This code uses a directory named "TS.PartyMaker" in the application's documents directory.
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}
//
//- (NSManagedObjectModel *)managedObjectModel {
//    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//
////    if (_managedObjectModel != nil) {
////        return _managedObjectModel;
////    }
//    
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"PartyMaker" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    return _managedObjectModel;
//}
//
//
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
//    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
////    if (_persistentStoreCoordinator != nil) {
////        return _persistentStoreCoordinator;
////    }
//    
//    // Create the coordinator and store
//    
//    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"PartyMaker.sqlite"];
//    NSError *error = nil;
//    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
//    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
//        // Report any error we got.
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
//        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
//        dict[NSUnderlyingErrorKey] = error;
//        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
//        // Replace this with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
////        abort();
//    }
//    
//    return _persistentStoreCoordinator;
//}
//
//
//- (NSManagedObjectContext *)managedObjectContext {
//    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
//    
////    if (_managedObjectContext != nil) {
////        return _managedObjectContext;
////    }
//    
//    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
//    if (!coordinator) {
//        return nil;
//    }
//    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
//    return _managedObjectContext;
//}
//

//use it to call in VC as "forReadWrite" parameter
- (NSManagedObjectContext *)backgroundThreadContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    
        if (_backgroundThreadContext != nil) {
            return _backgroundThreadContext;
        }
    
    _mainThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _mainThreadContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    _backgroundThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    _backgroundThreadContext.parentContext = _mainThreadContext;
    
    return _backgroundThreadContext;
}

- (NSManagedObjectContext *)mainThreadContext{
    
    if (_mainThreadContext != nil) {
        return _mainThreadContext;
    }
    _mainThreadContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    _mainThreadContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    
    return _mainThreadContext;
}


#pragma mark - fetching context "forReadOrWrite" finish it!
//
//-(NSFetchRequest *)fetchingContext{
//    
//    return request;
//}

//just transfer background context
-(NSMutableArray *)fetchContextForParties:(NSManagedObjectContext *) forRead{
    
    NSLog(@"Singlton can be first");
    NSManagedObjectContext *context = forRead;
    NSFetchRequest *fetch = [NSFetchRequest new];
    fetch.entity = [NSEntityDescription entityForName:@"SUNParty" inManagedObjectContext:context];
//    fetch.predicate = [NSPredicate predicateWithFormat:@"partyId == %@", entity.partyId];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"partyId" ascending:YES];
    
    [fetch setSortDescriptors:@[sortDescriptor]];
    
    NSError *error = nil;
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetch error:&error];
    NSMutableArray *results = [(NSArray*)fetchedObjects mutableCopy];
    if ( error ) {
        NSLog(@"PMRPartyManagedObject pmr_fetchPartyWithName: failed with error %@", error);
    }
    
    return results;
}


#pragma mark - Core Data Saving support
- (BOOL)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        //here used method [managedObjectContext save:&error] it saves context in dataCore
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            return NO;
        }
    }
    return YES;
}


//
//- (NSMutableArray *)readContext:(NSManagedObjectContext *) forReadOrWrite {
//    
//    [self initializeCoreDataFor:forReadOrWrite];
//    //each time when i'm asking for fetchedResultsController he sets himself and make me happy
////    NSFetchRequest *request = self.fetchedResultsController.fetchRequest;
//    //from here
//    NSFetchRequest *request = [[NSFetchRequest alloc] init];
//    // Edit the entity name as appropriate.
//    
//    [request setIncludesSubentities:YES]; //Omit subentities. Default is YES (i.e. include subentities)
//    
//    NSError *err;
//    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&err];
//    if(count == NSNotFound) {
//        //Handle error
//        NSLog(@"count of parties notfound %@", err);
//    }
//    
//    //    [fetchRequest release]; need to findout if i release fetch or no
//    
//    
//    //    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SUNSaver" inManagedObjectContext:self.managedObjectContext];
//    //    [fetchRequest setEntity:entity];
//    //
//    //    // Set the batch size to a suitable number.
//    //    [fetchRequest setFetchBatchSize:20];
//    
//    // Edit the sort key as appropriate. by sort below logic with plist is saved
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"partyId" ascending:YES];
//    
//    [request setSortDescriptors:@[sortDescriptor]];
////for here
//    
//    
//    
////    [request setIncludesSubentities:NO]; //Omit subentities. Default is YES (i.e. include subentities)
//
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
////    NSManagedObjectContext *context = //Get it from AppDelegate
//    NSError *error = nil;
//    
//    NSArray *preResults = [managedObjectContext executeFetchRequest:request error:&error];
//    
//    NSMutableArray *results = [(NSArray*)preResults mutableCopy];
//    
//    if (error != nil) {
//        
//        //Deal with failure
//        NSLog(@"reading with coreData failed with error - %@", error);
//    }
//    
////    [request release];
//    return results;
//}
//


#pragma mark - saving reading with CoreData

- (void) performWriteOperation:(void (^)(NSManagedObjectContext*))writeBlock completion:(void(^)())completion {
    
    [self.managedObjectContext performBlock:^{
        writeBlock(self.managedObjectContext);
        
        if ( self.managedObjectContext.hasChanges ) {
            NSError *error = nil;
            [self.managedObjectContext save:&error];
            NSLog(@"%s, error happened - %@", __PRETTY_FUNCTION__, error);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
    }];
    
}
//
//- (void)writeParty:(void (^)(NSManagedObjectContext*))writeBlock completion:(void (^ _Nullable )(void))completion {
//    
//    NSManagedObjectContext *context = self.backgroundThreadContext;
//    [context performBlock:^{
//        SUNPartyUser *partyObject = [PMRPartyManagedObject fetchPartyWithPartyID:@""
//                                                                                inContext:context];
//        [context deleteObject:partyObject];
//        
//        NSError *error = nil;
//        [context save:&error];
//        
//        if ( context.hasChanges ) {
//            NSLog(@"%s error saving context %@", __PRETTY_FUNCTION__, error);
//        }
//        
//        //calling completion
//        dispatch_async(dispatch_get_main_queue(), ^{
//            if (completion) {
//                completion();
//            }
//        });
//    }];
//}

//-(NSMutableArray *)readOperation:(id) sender{
//
//    NSMutableArray *returningArray = [[NSMutableArray alloc]init];
//    
//    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//    NSEntityDescription *party = [[self.fetchedResultsController fetchRequest] entity];
////    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[party name] inManagedObjectContext:context];
//    
//    // If appropriate, configure the new managed object.
//    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
//    if( [sender class] == [SUNSaver class] ){
////        [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
//        SUNSaver *model = (SUNSaver *) sender;
//        
//    }
////    [newManagedObject setValuesForKeysWithDictionary:@{@"comment":userEmail , @"endTime":password, @"startTime":userName}];
//    
//    // Save the context.
//    NSError *error = nil;
//    if (![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//
//    return returningArray;
//}

-(BOOL)writeOperation:(id) sender{
    
    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
    NSEntityDescription *party = [[self.fetchedResultsController fetchRequest] entity];
    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[party name] inManagedObjectContext:context];
    
    // If appropriate, configure the new managed object.
    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
    if( [sender class] == [SUNSaver class] ){
        //        [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
        SUNParty *model = (SUNParty *) sender;
        
//        [newManagedObject setValue:model.comment forKey:@"comment"];
//        [newManagedObject setValue:model.endTime forKey:@"endTime"];
//        [newManagedObject setValue:model.latitude forKey:@"latitude"];
//        [newManagedObject setValue:model.logo forKey:@"logo"];
//        [newManagedObject setValue:model.longitude forKey:@"longitude"];
//        [newManagedObject setValue:model.partyName forKey:@"partyName"];
//        [newManagedObject setValue:model.partyId forKey:@"partyId"];
//        [newManagedObject setValue:model.startTime forKey:@"startTime"];
    }
    //    [newManagedObject setValuesForKeysWithDictionary:@{@"comment":userEmail , @"endTime":password, @"startTime":userName}];
    
    // Save the context.
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return [[NSMutableArray alloc]init];
}

#pragma mark - saving reading

+(NSMutableArray *)readFromPlist{
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSString *partiesFilePathInDocuments = [documentPath stringByAppendingPathComponent:@"myLogs.plist"];
    
    NSMutableArray *dataFromFile = [[NSMutableArray alloc] init];
    if([filemanager fileExistsAtPath:partiesFilePathInDocuments]){
        
        dataFromFile = [NSMutableArray arrayWithContentsOfFile:partiesFilePathInDocuments];
        
    }else {
        NSLog(@"File is not exist at path: %@", partiesFilePathInDocuments);
    }
    
    return dataFromFile;
}

+(BOOL)saveToPlist:(NSMutableArray*) dataFromFile{
    
    BOOL wasSaved = NO;
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSString *partiesFilePathInDocuments = [documentPath stringByAppendingPathComponent:@"myLogs.plist"];
    NSString *partiesFilePathInBundle = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/myLogs.plist"];
        NSLog(@"%@",partiesFilePathInDocuments);
//    NSMutableArray *dataFromFile = [[NSMutableArray alloc] init];
    
    if( ![filemanager fileExistsAtPath: partiesFilePathInDocuments] ){
        
        NSError *error;
        [filemanager copyItemAtPath:partiesFilePathInBundle toPath:partiesFilePathInDocuments error:&error];
        
//        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
//        [dataFromFile addObject:data];
        NSArray *dataToWrite = [NSArray arrayWithArray:dataFromFile];
        [dataToWrite writeToFile:partiesFilePathInDocuments atomically:YES];
        wasSaved =  YES;
        
        if ( !error ) {
            
            wasSaved = NO;
            NSLog(@"%@", error);
            
        }
        
    }else {
        
//        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
//
//        //i need checking if i'm storing a new party or i'm storing edited party
//        [dataFromFile addObject:data];
//        checking was made on click of save button in my creating\editing view SUNMakingPartyByxibVC
        
        NSArray *dataToWrite = [NSArray arrayWithArray:dataFromFile];
        
        [dataToWrite writeToFile:partiesFilePathInDocuments atomically:YES];
        
        wasSaved = YES;
        
    }
    
    return wasSaved;
    
}

@end
