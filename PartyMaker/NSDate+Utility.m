//
//  NSDate+Utility.m
//  PartyMaker
//
//  Created by 2 on 2/13/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "NSDate+Utility.h"

@implementation NSDate(Utility)

+(NSString*)formateToStringDate:(NSString*)dateIsChosen startTime:(UISlider*)sliderTop endTime:(UISlider*)sliderBottom{
    
    NSMutableString *formatedString = [[NSMutableString alloc] init];
    
    [formatedString appendString:dateIsChosen];
    
    CGFloat value = sliderTop.value;
    CGFloat hours = (int)value/60;
    CGFloat minutes = (value - hours * 60);
    
    [formatedString appendFormat:@"%2d:%02d ", (int)hours, (int)minutes];
    
    value = sliderTop.value;
    hours = (int)value/60;
    minutes = (value - hours * 60);
    
    [formatedString appendFormat:@"%2d:%02d", (int)hours, (int)minutes];
    
    
    
    return formatedString;
    
}

@end
