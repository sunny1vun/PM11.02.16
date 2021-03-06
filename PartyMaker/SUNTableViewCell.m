//
//  SUNTableViewCell.m
//  PartyMaker
//
//  Created by 2 on 2/13/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNTableViewCell.h"

@interface SUNTableViewCell()

@property (nonatomic , strong) IBOutlet UIImageView *logoImageView;
@property (nonatomic , strong) IBOutlet UILabel *nameOfPartyLabel;
@property (nonatomic , strong) IBOutlet UILabel *dateAndTimeOfPartyLabel;

@end

@implementation SUNTableViewCell

-(void)configureWithName:(NSString *)nameOfParty dateAndTimeOfParty:(NSString *)dateAndTimeOfParty logo:(UIImage*) logo{
    
    self.logoImageView.image = logo;
    self.nameOfPartyLabel.text = nameOfParty;
    self.dateAndTimeOfPartyLabel.text = dateAndTimeOfParty;
    
}

-(void)prepareForReuse{
    
    [super prepareForReuse];
    
    self.logoImageView.image = nil;
    self.nameOfPartyLabel.text = nil;
    self.dateAndTimeOfPartyLabel.text = nil;
    
}

+(NSString*)reuseIdentifier{
    
    return @"SUNTableViewReuseIdentifier";
}


@end
