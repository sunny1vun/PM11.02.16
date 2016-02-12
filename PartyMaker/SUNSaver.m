//
//  SUNSaver.m
//  PartyMaker
//
//  Created by 2 on 2/9/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNSaver.h"

@interface SUNSaver()

@property (nonatomic, strong) NSString *partyName;
@property (nonatomic, strong) NSString *dateIsChosen;
@property (nonatomic, strong) UISlider *sliderTop;
@property (nonatomic, strong) UISlider *sliderBot;
@property (nonatomic, strong) NSString *descriptionOfParty;
@property (nonatomic, strong) UIPageControl * currentPage;
//запилить уникальный айди для каждой сохраняемой пати
@property (nonatomic) int uniqueID;

@end

@implementation SUNSaver

#pragma mark - saving reading

-(NSMutableArray *)readFromPlist{
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSString *partiesFilePathInDocuments = [documentPath stringByAppendingPathComponent:@"logs/myLogs.plist"];
    
    NSMutableArray *dataFromFile = [[NSMutableArray alloc] init];
    if([filemanager fileExistsAtPath:partiesFilePathInDocuments]){
        
        dataFromFile = [NSMutableArray arrayWithContentsOfFile:partiesFilePathInDocuments];
        
    }else {
        //NSLog(@"File is not exist at path: %@", partiesFilePathInDocuments);
    }

    return dataFromFile;
}

-(BOOL)saveToPlist{
    
    BOOL wasSaved = NO;
    
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    
    NSString *partiesFilePathInDocuments = [documentPath stringByAppendingPathComponent:@"logs/myLogs.plist"];
    NSString *partiesFilePathInBundle = [[[NSBundle mainBundle]resourcePath] stringByAppendingString:@"/myLogs.plist"];
//    NSLog(@"%@",partiesFilePathInDocuments);
    NSMutableArray *dataFromFile = [[NSMutableArray alloc] init];
    
    if(![filemanager fileExistsAtPath: partiesFilePathInDocuments]){

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
