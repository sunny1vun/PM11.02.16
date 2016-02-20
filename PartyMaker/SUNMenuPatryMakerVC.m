//
//  SUNMenuPatryMakerVC.m
//  PartyMaker
//
//  Created by 2 on 2/13/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNMenuPatryMakerVC.h"
#import "SUNTableViewCell.h"
#import "SUNSaver.h"
#import "SUNDataStore.h"
#import "SUNParty.h"
#import "NSDate+Utility.h"
#import "SUNPartyInfoVC.h"

@interface SUNMenuPatryMakerVC () <UITableViewDataSource , UITableViewDelegate>



@end

@implementation SUNMenuPatryMakerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TableView was first");
    //filled in my dataArray with files from plist
    self.dataArray = [SUNDataStore readFromPlist];
    
//    NSManagedObjectID *objectID = [[SUNSaver sharedInstance].fetchedResultsController objectAtIndexPath:indexPath];
//    
//    //here how u wrote data to datacore
//    [[SUNDataStore sharedInstance] performWriteOperation:^(NSManagedObjectContext *context) {
//        
//        NSError *error = nil;
//        SUNSaver *party = [context existingObjectWithID:objectID error:&error];
//        NSLog(@"%s, error happened - %@", __PRETTY_FUNCTION__, error);
//        
//    } completion:^{
//       SUNDataStore *instance = [SUNDataStore sharedInstance];
//      [instance initializeCoreData]];
    //

//
//    }];
    
    
    //here i need to fill dataArray from CoreData
//    SUNDataStore *dataStore =[SUNDataStore sharedInstance];
//    self.partiesArray = [dataStore fetchContextForParties:dataStore.backgroundThreadContext];
    
    //try to perform that code works as u like
//    [[SUNDataStore sharedInstance] performFetchOperation:^(NSManagedObjectContext *context) {
//        
//        NSError *error = nil;
//        SUNParty *party = [context existingObjectWithID:objectID error:&error];
//        NSLog(@"%s, error happened - %@", __PRETTY_FUNCTION__, error);
//        
//    } completion:^{
//        
//        [[SUNDataStore sharedInstance] initializeCoreData]];
//        
//        
//    }];

    
//    Here comes connection of instance of VC and dataSource and delegate of my tableView by code
//    But i connected them in storyBoard by pressing right btnmouse and throwing it to my VC
  //  self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Loading all parties from file all times when viewAppears (need to load all files ones and then save and edit only selected party)

    self.dataArray = [SUNDataStore readFromPlist];

    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - for datacore
//make from this method readmethod and write method in SUNDataStore
//- (void)insertNewObject:(id)sender {
//    NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
//    NSEntityDescription *party = [[self.fetchedResultsController fetchRequest] entity];
//    NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[party name] inManagedObjectContext:context];
//    
//    // If appropriate, configure the new managed object.
//    // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
//    [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
//    
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
//}

//can be usefull
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSString *formatedDateWithTime = [NSDate formateToStringDate:savedParty.dateIsChosen startTime:savedParty.sliderTop endTime:savedParty.sliderBot];
//            NSString *imageName = [[NSString alloc] initWithFormat:@"PartyLogo_Small_%li", (long)savedParty.currentPage.currentPage];
//
//            //filling from model from coredata my cell
//                [cell configureWithName:savedParty.partyName dateAndTimeOfParty:formatedDateWithTime logo:[UIImage imageNamed: imageName]];
//        });
//    });

#pragma mark - UITableViewDataSourse methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
//    return self.partiesArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SUNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SUNTableViewCell reuseIdentifier] forIndexPath:indexPath];
    
    if(cell == nil){
        cell = [[SUNTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[SUNTableViewCell reuseIdentifier]];
    }
    
    //getting current party from plist and then filling my model
    SUNSaver *savedParty = [NSKeyedUnarchiver unarchiveObjectWithData:self.dataArray[indexPath.row]];

    //no need for sorting cause it's already sorted by partyId ( partyId == data.timeStampFrom1970 )
    //    partId /seconds / minutes / hours / days = years
    //    1357234941 / 60 / 60 / 24 / 365 = 43.037637652207
    
//    SUNParty *partyEntity = self.partiesArray[indexPath.row];
//    partyEntity.startTime
    
    NSString *formatedDateWithTime;
    NSString *imageName;
    if (savedParty.dateIsChosen!= nil){
//        formatedDateWithTime = [NSDate formateToStringDate:savedParty.dateIsChosen startTime:savedParty.sliderTop endTime:savedParty.sliderBot];
//        //image from plist
//        
//        imageName = [[NSString alloc] initWithFormat:@"PartyLogo_Small_%li", (long)savedParty.currentPage.currentPage];
//        //filling from model from plist my cell
//        [cell configureWithName:savedParty.partyName dateAndTimeOfParty:formatedDateWithTime logo:[UIImage imageNamed: imageName]];
    }else{
        //preparing for cell usage
     formatedDateWithTime = [NSDate formateToStringStartTime:savedParty.startTime endTime:savedParty.endTime];
        //image from datacore or server
        imageName = [[NSString alloc] initWithFormat:@"PartyLogo_Small_%li", (long)savedParty.logo.intValue];
        //filling my cell from model of dataCore or server
        [cell configureWithName:savedParty.nameOfParty dateAndTimeOfParty:formatedDateWithTime logo:[UIImage imageNamed: imageName]];

        
    }

    
    cell.selectedBackgroundView.backgroundColor = [[UIColor alloc] initWithRed:52/255.f green:56/255.f blue:66/255.f alpha:1.f];
    
    
    
    return cell;
}

#pragma mark - UITableViewDelegate methods
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    return indexPath;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"On row %ld was touched", (long)indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - segues methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if( [segue.identifier isEqualToString:@"toPartyInfo"] ){
        
        SUNPartyInfoVC *partyInfoVC = segue.destinationViewController;
        
//        need to create instance of SUNSaver and then send it to instance of partyInfoVC
//          in dataArray stored instances of SUNSaver with has all property that i need cause it's model
        
        self.indexOfSelectedCell = [self.tableView indexPathForSelectedRow].row;
        
        SUNSaver *selectedParty = [NSKeyedUnarchiver unarchiveObjectWithData:self.dataArray[self.indexOfSelectedCell]];
        partyInfoVC.selectedParty = selectedParty;
        partyInfoVC.indexOfSelectedParty = self.indexOfSelectedCell;
        
        NSLog(@"going to party info %li", (long)self.indexOfSelectedCell);
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
