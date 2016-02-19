//
//  SUNTableViewCell.h
//  PartyMaker
//
//  Created by 2 on 2/13/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SUNTableViewCell : UITableViewCell

+(NSString*)reuseIdentifier;

-(void)configureWithName:(NSString *)nameOfParty dateAndTimeOfParty:(NSString *)dateAndTimeOfParty logo:(UIImage*) logo;
//-(void)configureWithRightName:(NSString *)nameOfParty startTime:(NSString *)startTime endTime:(NSString*)endTime logo:(UIImage*)logo;

@end
