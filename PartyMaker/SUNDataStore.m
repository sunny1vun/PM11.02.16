//
//  SUNDataStore.m
//  PartyMaker
//
//  Created by 2 on 2/12/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNDataStore.h"

@implementation SUNDataStore

#pragma mark - saving reading

-(NSMutableArray *)readFromPlist{
    
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

-(BOOL)saveToPlist{
    
    BOOL wasSaved = NO;
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSString *partiesFilePathInDocuments = [documentPath stringByAppendingPathComponent:@"myLogs.plist"];
    NSString *partiesFilePathInBundle = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"/myLogs.plist"];
        NSLog(@"%@",partiesFilePathInDocuments);
    NSMutableArray *dataFromFile = [[NSMutableArray alloc] init];
    
    if( ![filemanager fileExistsAtPath: partiesFilePathInDocuments] ){
        
        NSError *error;
        [filemanager copyItemAtPath:partiesFilePathInBundle toPath:partiesFilePathInDocuments error:&error];
        
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
        [dataFromFile addObject:data];
        NSArray *dataToWrite = [NSArray arrayWithArray:dataFromFile];
        [dataToWrite writeToFile:partiesFilePathInDocuments atomically:YES];
        wasSaved =  YES;
        
        if ( !error ) {
            
            wasSaved = NO;
            NSLog(@"%@", error);
            
        }
        
    }else {
        
        dataFromFile = [self readFromPlist];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
        
        [dataFromFile addObject:data];
        
        NSArray *dataToWrite = [NSArray arrayWithArray:dataFromFile];
        
        [dataToWrite writeToFile:partiesFilePathInDocuments atomically:YES];
        
        wasSaved = YES;
        
    }
    
    return wasSaved;
    
}

@end
