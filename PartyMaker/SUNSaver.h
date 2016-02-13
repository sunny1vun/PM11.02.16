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


@property (nonatomic, strong) NSString *partyName;
@property (nonatomic, strong) NSString *dateIsChosen;
@property (nonatomic, strong) UISlider *sliderTop;
@property (nonatomic, strong) UISlider *sliderBot;
@property (nonatomic, strong) NSString *descriptionOfParty;
@property (nonatomic, strong) UIPageControl * currentPage;
//запилить уникальный айди для каждой сохраняемой пати
@property (nonatomic) int uniqueID;
//@property (nonatomic, strong) NSData 

-(instancetype) initWithName:(NSString *)name   date:(NSString *)date
                   sliderTop: (UISlider *)sliderTop     sliderBot:(UISlider *)sliderBot
                 description:(NSString *)description    pageControl:(UIPageControl *)pageControl;



//-(NSMutableArray *)readFromPlist;
//-(BOOL)saveToPlist;


@end
