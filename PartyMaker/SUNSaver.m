//
//  SUNSaver.m
//  PartyMaker
//
//  Created by 2 on 2/9/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNSaver.h"

@interface SUNSaver()

@property (nonatomic) NSString *partyName;
@property (nonatomic) NSString *dateIsChosen;
@property (nonatomic) UISlider *sliderTop;
@property (nonatomic) UISlider *sliderBot;
@property (nonatomic) NSString *descriptionOfParty;
@property (nonatomic) UIPageControl * currentPage;

@end

@implementation SUNSaver

-(void)save{
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *doucumentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
    
//    URL for my file in Bundle
//    NSURL *myLogsURL = [NSURL URLWithString:@"Application/58542917-CDEC-4C8A-B46F-8B81E6DF22BE/PartyMaker.app/myLogs.plist"];
    NSString *myLogsPath = [[NSBundle mainBundle] resourcePath];
//    [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"/myLogs.plist"];
    
    NSLog(@"%@", myLogsPath);
    
    myLogsPath = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"/myLogs.plist"];

    NSLog(@"%@", myLogsPath);
    
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *contents = [fileManager contentsOfDirectoryAtURL:bundleURL includingPropertiesForKeys:@[] options:NSDirectoryEnumerationSkipsHiddenFiles error:&error];
    NSLog(@"All nonhiden content of bundle \n%@", contents);

    if(error){
        NSLog(@"%s NSFileManager error: %@", __PRETTY_FUNCTION__, error);
    }
    
    //        //Path для моего плиста в документах
    //        NSString *filePath = [documentsPath stringByAppendingString:@"myLogs.plist"];
    NSString *partiesFolderPath = [doucumentPath stringByAppendingPathComponent: @"logs"];
    NSString *partiesFilePath = [doucumentPath stringByAppendingPathComponent:@"logs/myLogs.plist"];

    
    
//    NSString *partiesFilePathInBundle = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"myLogs.plist"];
//    NSString *partiesFilePathInBundle = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"Application/58542917-CDEC-4C8A-B46F-8B81E6DF22BE/PartyMaker.app/myLogs.plist"];
    NSString *partiesFilePathInBundle = myLogsPath;
    
    if( [filemanager fileExistsAtPath:partiesFilePathInBundle] ){
        
        NSLog(@"YES");
    
    }
    
    if ( [filemanager fileExistsAtPath: partiesFolderPath] ) {
        NSLog(@"Your Party Log exists at documents");
        NSLog(@"%@", partiesFilePath);
    }
    
    if(![filemanager fileExistsAtPath: partiesFilePath]){
        [filemanager createFileAtPath:partiesFilePath contents:[[NSData alloc] init] attributes:nil];
        NSError *error;
        [filemanager copyItemAtPath:partiesFilePathInBundle toPath:partiesFilePath error:&error];
        NSLog(@"%@", error);
        
    }
    
    if([filemanager fileExistsAtPath:partiesFilePath]){
        
        NSMutableArray *dataFromFile = [NSMutableArray arrayWithContentsOfFile:partiesFilePath];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
        
        [dataFromFile addObject:data];
        
        NSArray *dataToWrite = [NSArray arrayWithArray:dataFromFile];
        
        [dataToWrite writeToFile:partiesFilePath atomically:YES];
        
    }
    NSLog(@"Party name: %@\n", self.partyName);
    NSLog(@"Date: %@", self.dateIsChosen);
    NSLog(@"Start time: %d\n", (int)(self.sliderTop.value * 1439));
    NSLog(@"End time: %d", (int)(self.sliderBot.value * 1439));
    NSLog(@"Description: %@", self.descriptionOfParty);
    NSLog(@"Logo: %ld", (long)self.currentPage.currentPage);
}

#pragma mark- Coding and Encoding PartyMakerInfo

-(instancetype) initWithName:(NSString *)name   date:(NSString *)date
                   sliderTop: (UISlider *)sliderTop     sliderBot:(UISlider *)sliderBot
                 description:(NSString *)description    pageControl:(UIPageControl *)pageControl{
    self = [super init];
    self.partyName = name;
    self.dateIsChosen = date;
    self.sliderTop = sliderTop;
    self.sliderBot = sliderBot;
    self.descriptionOfParty = description;
    self.currentPage = pageControl;

    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];

    if ( self ) {

        self.dateIsChosen = [aDecoder decodeObjectForKey:@"dateIsChosen"];
        self.partyName = [aDecoder decodeObjectForKey:@"partyName"];
        self.sliderTop = [aDecoder decodeObjectForKey:@"sliderTop"];
        self.sliderBot = [aDecoder decodeObjectForKey:@"sliderBot"];
        self.currentPage = [aDecoder decodeObjectForKey:@"currentPage"];
        self.descriptionOfParty = [aDecoder decodeObjectForKey:@"descriptionOfParty"];

    }

    return self;
}

-(void) encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.dateIsChosen forKey:@"dateIsChosen"];
    [aCoder encodeObject:self.partyName forKey:@"partyName"];
    [aCoder encodeObject:self.sliderTop forKey:@"sliderTop"];
    [aCoder encodeObject:self.sliderBot forKey:@"sliderBot"];
    [aCoder encodeObject:self.currentPage forKey:@"currentPage"];
    [aCoder encodeObject:self.descriptionOfParty forKey:@"descriptionOfParty"];

}


@end
