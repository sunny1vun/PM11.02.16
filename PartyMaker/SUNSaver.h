//
//  SUNSaver.h
//  PartyMaker
//
//  Created by 2 on 2/9/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SUNSaver : NSObject <NSCoding>

-(instancetype) initWithName:(NSString *)name   date:(NSString *)date
                   sliderTop: (UISlider *)sliderTop     sliderBot:(UISlider *)sliderBot
                 description:(NSString *)description    pageControl:(UIPageControl *)pageControl;
-(void)save;

@end
