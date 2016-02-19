//
//  SUNPartyUser.m
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNPartyUser.h"
#import "SUNParty.h"

@implementation SUNPartyUser

// Insert code here to add functionality to your managed object subclass
//@synthesize name = _name;
//@synthesize email = _email;
//@synthesize userId = _userId;
//@synthesize password = _password;

+(SUNPartyUser*) sharedInstance{
    
    static SUNPartyUser *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(void) initWithEmail:(NSString *)email   name:(NSString *)name
               userId: (NSNumber *)userId password:(NSString *)password{
    
    self.name = name;
    self.email = email;
    self.userId = userId.longValue;
    self.password = password;
    
    //    self.uniqueID =
}

//-(NSFetchedResultsController *)fetchedResultsController{
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription entityForName:@"SUNPartyUser" inManagedObjectContext:self.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    // Specify criteria for filtering which objects to fetch
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"<#format string#>", <#arguments#>];
//    [fetchRequest setPredicate:predicate];
//    // Specify how the fetched objects should be sorted
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"<#key#>"
//                                                                   ascending:YES];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
//    
//    NSError *error = nil;
//    NSArray *fetchedObjects = [<#context#> executeFetchRequest:fetchRequest error:&error];
//    if (fetchedObjects == nil) {
//        <#Error handling code#>
//    }
//}
@end
