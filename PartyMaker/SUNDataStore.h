//
//  SUNDataStore.h
//  PartyMaker
//
//  Created by 2 on 2/12/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUNSaver.h"

@interface SUNDataStore : SUNSaver

-(NSMutableArray *)readFromPlist;
-(BOOL)saveToPlist;

@end
