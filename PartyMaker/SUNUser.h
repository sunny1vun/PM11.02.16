//
//  SUNUser.h
//  PartyMaker
//
//  Created by 2 on 2/17/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SUNUser : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *password;

+(SUNUser*) sharedInstance;
//+(NSString *)getPassword;
//+(NSString *)getId;

@end
