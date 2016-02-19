//
//  SUNSaver.m
//  PartyMaker
//
//  Created by 2 on 2/9/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNSaver.h"

@interface SUNSaver()

@end

@implementation SUNSaver

+(SUNSaver*) sharedInstance{
    
    static SUNSaver *instance = nil;
    static dispatch_once_t oncedbExchange;
    dispatch_once(&oncedbExchange, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

#pragma mark- plist

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
//    self.uniqueID = 
    
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

#pragma mark - CoreData 

-(void) initWithCreatorId:(NSNumber *)creatorId   startTime:(NSNumber *)startTime
                  endTime: (NSNumber *)endTime logo:(NSNumber *)currentPage  partyId:(NSNumber*)partyId latitude:(NSNumber *)latitude longitude:(NSNumber *)longitude description:(NSString *)description partyName:(NSString *)partyName{
    self.creatorId = creatorId;
    self.startTime = startTime;
    self.endTime = endTime;
    self.logo = currentPage;
    self.partyId = partyId;
    self.latitude = latitude;
    self.longitude = longitude;
    self.comment = description;
    self.nameOfParty = partyName;
    
    //    self.uniqueID =
}



@end
