//
//  SUNCastomVC.m
//  PartyMaker
//
//  Created by 2 on 2/3/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNMakingPartyVC.h"

@interface SUNMakingPartyVC()
//@property (nonatomic) UIPageControl *pageControl;
//@property (nonatomic) UIScrollView *scrollView;
@property int doneWasPressed;


@end

@implementation SUNMakingPartyVC


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (([self.navigationController.viewControllers count]> 1)== YES) {
        [self.view setBackgroundColor: [[UIColor alloc] initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1.f]];
        //        self.title= [NSString stringWithFormat:@"Some %i", (int)[self.navigationController.viewControllers count]];
        self.title= @"CREATE PARTY";
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    }
    
    
}
//
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark- Making UnclickAbleFronend

-(void)addRound:(NSString*) forLabel{
    if ([forLabel isEqualToString:@"CHOOSE DAY"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 84.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 84.f, 68.f, 11.f)];
//        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;

        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
//        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"PARTY NAME"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 134.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 134.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"START"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 180.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 180.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"END"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 221.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 221.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"LOGO"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 299.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 299.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"DESCRIPTION"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 416.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 416.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }else if ([forLabel isEqualToString:@"FINAL"]) {
        UIView *round= [[UIView alloc] initWithFrame:CGRectMake(10.f, 536.5f, 10.f, 10.f)];
        round.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        round.layer.cornerRadius= 5.f;
        
        UILabel *labelOfRound= [[UILabel alloc] initWithFrame:CGRectMake(26.f, 536.f, 68.f, 11.f)];
        //        labelOfRound.backgroundColor = [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
        [labelOfRound setText:forLabel];
        [labelOfRound setTextColor:[[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f]];
        labelOfRound.font = [UIFont fontWithName:@"Helvetica" size:11];
        labelOfRound.adjustsFontSizeToFitWidth= YES;
        
        [self.view addSubview: round];
        [self.view addSubview: labelOfRound];
        //        UILabel *labelOfRound = [[UILabel alloc] initWithFrame:(CGRect){}];
    }
}

-(void)addLine{
    UIView *line= [[UIView alloc] initWithFrame:(CGRect){14.5f, 85.f, 1.f, 452.f}];
    line.backgroundColor= [[UIColor alloc] initWithRed:230/255.f green:224/255.f blue:213/255.f alpha:1.f];
    
    [self.view addSubview:line];
}

#pragma mark- Making ClickableFrontend

-(void)addDateButton{
    UIButton *chooseDate= [UIButton buttonWithType:UIButtonTypeCustom];
    chooseDate.frame= (CGRect){121, 74, 190, 37};
    chooseDate.layer.cornerRadius= 3.f;
//    chooseDate.titleLabel.font
    chooseDate.backgroundColor= [[UIColor alloc] initWithRed:239/255.f green:177/255.f blue:27/255.f alpha:1.f];
    [chooseDate setTitle:@"CHOOSE DATE"forState:UIControlStateNormal];
    [chooseDate setTitle:@"CHOOSE DATE"forState:UIControlStateHighlighted];
    [chooseDate setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseDate setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [chooseDate addTarget:self action:@selector(onDateClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseDate];
}

-(void)addTextField{
    UITextField *textField = [[UITextField alloc] initWithFrame:(CGRect){121, 121, 190, 37}];
    textField.layer.cornerRadius= 3.f;
    textField.placeholder = @"Your Party Name";
    [textField setTextAlignment: NSTextAlignmentCenter ];
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Some Text" attributes:@{ NSForegroundColorAttributeName : [[UIColor alloc] initWithRed:76/255.f green:82/255.f blue:92/255.f alpha:1.f] }];
    textField.attributedPlaceholder = str;

    textField.textColor = [UIColor lightGrayColor];
    textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    textField.backgroundColor = [[UIColor alloc] initWithRed:35/255.f green:37/255.f blue:43/255.f alpha:1.f];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.rightViewMode = UITextFieldViewModeAlways;
    //    textField.rightView = [[UIImageViewalloc] initWithImage:[UIImageimageNamed:@"Img1"]];
    textField.leftViewMode = UITextFieldViewModeAlways;
    //    textField.leftView = [[UIImageView alloc] ...];
    textField.returnKeyType = UIReturnKeyDone;
//    textField.returnKeyType= UIReturnKeyDefault;
//    textField.delegate = ;
    [textField addTarget:self action:@selector(onTextFieldEditingEnded) forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:textField];
}

-(void)addTopSlider{
    
    UISlider *slider = [[UISlider alloc] initWithFrame:(CGRect){174, 170, 137, 30}];
    slider.minimumValueImage = [UIImage imageNamed:@"Sun-32"];
    slider.maximumValueImage = [[UIImage imageNamed:@"Sun-64"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    slider.minimumTrackTintColor = [[UIColor alloc] initWithRed:240/255.f green:180/255.f blue:30/255.f alpha:1.f];
    slider.maximumTrackTintColor = [[UIColor alloc] initWithRed:28/255.f green:30/255.f blue:35/255.f alpha:1.f];
    slider.thumbTintColor = [UIColor whiteColor];
    slider.tintColor = [UIColor blackColor];
//    slider.value = 1.f/1440; property that takes control of scrollValue
    slider.value=(390.f)/1439;
//    slider.value= 700.f;
    [slider setMaximumValue:(1409.f)/1439];
//    [slider setMinimumValue:0.f];
    [slider addTarget:self action:@selector(onTopSlide:) forControlEvents:UIControlEventValueChanged];
    
    UIImage *imageForTop= [UIImage imageNamed:@"TimePopup"];
    UIImageView *imageViewFT= [[UIImageView alloc] initWithImage:imageForTop];
    imageViewFT.frame= (CGRect){121.f,173.5f,47.f, 26.f};
    UILabel *labelForIVFT= [[UILabel alloc] initWithFrame:(CGRect){5.f, 8.f, 40.f, 10.f}];
    
    int value= (int)(slider.value*1439);
    int hours= 0;
    for(hours; value>= 60; hours++){
        value-= 60;
    }
    int minutes= value;
    NSMutableString *labelText= [[NSMutableString alloc] initWithFormat:@"%02i-%02i",hours, minutes];
    [labelForIVFT setText:labelText ];
    [labelForIVFT setTextColor:[UIColor whiteColor]];
    labelForIVFT.font = [UIFont fontWithName:@"Helvetica" size:11];
    labelForIVFT.adjustsFontSizeToFitWidth= YES;
    [imageViewFT addSubview:labelForIVFT];
    
    [self.view addSubview:imageViewFT];
    
    [self.view addSubview:slider];
}

-(void)addBotSlider{
    UISlider *sliderBot = [[UISlider alloc] initWithFrame:(CGRect){121, 213, 137, 30}];
    sliderBot.minimumValueImage = [UIImage imageNamed:@"Sun-32"];
    sliderBot.maximumValueImage = [[UIImage imageNamed:@"Sun-64"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    sliderBot.minimumTrackTintColor = [[UIColor alloc] initWithRed:240/255.f green:180/255.f blue:30/255.f alpha:1.f];
    sliderBot.maximumTrackTintColor = [[UIColor alloc] initWithRed:28/255.f green:30/255.f blue:35/255.f alpha:1.f];
    sliderBot.thumbTintColor = [UIColor whiteColor];
    sliderBot.tintColor = [UIColor blackColor];
    sliderBot.value= (420.5f)/1439;
//    [sliderBot setMaximumValue:1439.f];
    [sliderBot setMinimumValue:(30.f)/1439];
    [sliderBot addTarget:self action:@selector(onBotSlide:) forControlEvents:UIControlEventValueChanged];
    
    UIImage *imageForTop= [UIImage imageNamed:@"TimePopup"];
    //making mirroring frip
    UIImage *imageForBot= [UIImage imageWithCGImage:[imageForTop CGImage] scale:1.f orientation:UIImageOrientationUpMirrored];
    UIImageView *imageViewFT= [[UIImageView alloc] initWithImage:imageForBot];
    imageViewFT.frame= (CGRect){258.f,212.5f,47.f, 26.f};
    UILabel *labelForIVFT= [[UILabel alloc] initWithFrame:(CGRect){15.f, 8.f, 40.f, 10.f}];
    
    int value= (int)(sliderBot.value*1439);
    int hours= 0;
    for(hours; value>= 60; hours++){
        value-= 60;
    }
    int minutes= value;
    NSMutableString *labelText= [[NSMutableString alloc] initWithFormat:@"%02i-%02i",hours, minutes];
    
    [labelForIVFT setText:labelText ];
    [labelForIVFT setTextColor:[UIColor whiteColor]];
    labelForIVFT.font = [UIFont fontWithName:@"Helvetica" size:11];
    labelForIVFT.adjustsFontSizeToFitWidth= YES;
    [imageViewFT addSubview:labelForIVFT];
    
    [self.view addSubview:imageViewFT];
    [self.view addSubview:sliderBot];
}

-(void)addScrollViewWithPageControl{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:(CGRect){121, 254, 190, 101}];
    scrollView.pagingEnabled = YES;
    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 55, 0);
    UIImageView *imageView = [[UIImageView alloc] init];
    [scrollView.viewForFirstBaselineLayout setBackgroundColor:[[UIColor alloc] initWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1.f]];
    [scrollView addSubview:imageView];
    scrollView.contentSize = imageView.frame.size;
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:(CGRect){0, 1284, 750, 50}];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    pageControl.backgroundColor = [UIColor blackColor];
    [pageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
    
    //    pageControl.numberOfPages = scrollView.contentSize.width/[UIScreenmainScreen].bounds.size.width;[partyMakerVC.view addSubview:pageControl];
    //    partyMakerVC.pageControl = pageControl;
    //    UIView *viewForSliderImages= [[UIView alloc] initWithFrame:(CGRect){121, 229, 190, 101}];
    //    viewForSliderImages.scrollView = scrollView;
    //    [viewForSliderImages addSubview:pageControl];
    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];
    
//    self.pageControl = pageControl;
//    self.scrollView = scrollView;
}

-(void)addTextView{
    UITextView *textView = [[UITextView alloc] initWithFrame:(CGRect){121, 366, 185, 100}];
//    textView.text = @"Some text";
    textView.font = [UIFont fontWithName:@"Arial-Bold" size:11];
    textView.backgroundColor = [[UIColor alloc] initWithRed:35/255.f green:37/255.f blue:43/255.f alpha:1.f];
    textView.textColor = [UIColor lightGrayColor];
//    textView.delegate = self;
    UIView *line= [[UIView alloc] initWithFrame:(CGRect){0.f,0.f, 185.f, 6.f}];
    line.backgroundColor= [[UIColor alloc] initWithRed:40/255.f green:132/255.f blue:175/255.f alpha:1.f];
    
    [textView addSubview:line];
    [self.view addSubview:textView];
}

-(void)addSaveButton{
    UIButton *chooseSave= [UIButton buttonWithType:UIButtonTypeCustom];
    chooseSave.frame= (CGRect){121, 478, 190, 36};
    chooseSave.layer.cornerRadius= 3.f;
    chooseSave.backgroundColor= [[UIColor alloc] initWithRed:140/255.f green:186/255.f blue:29/255.f alpha:1.f];
    [chooseSave setTitle:@"Save"forState:UIControlStateNormal];
    [chooseSave setTitle:@"Highlighted"forState:UIControlStateHighlighted];
    [chooseSave setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseSave addTarget:self action:@selector(onSaveClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseSave];
}
-(void)addCancelButton{
    UIButton *chooseCancel= [UIButton buttonWithType:UIButtonTypeCustom];
    chooseCancel.frame= (CGRect){121, 522, 190, 36};
    chooseCancel.layer.cornerRadius= 3.f;
    chooseCancel.backgroundColor= [[UIColor alloc] initWithRed:236/255.f green:71/255.f blue:19/255.f alpha:1.f];
    [chooseCancel setTitle:@"Cancel"forState:UIControlStateNormal];
    [chooseCancel setTitle:@"Highlighted"forState:UIControlStateHighlighted];
    [chooseCancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseCancel addTarget:self action:@selector(onCancelClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseCancel];
}

#pragma mark- Hided views

-(void)addHidenViews{
    UIToolbar *toolsForDatePicker= [[UIToolbar alloc] initWithFrame:(CGRect){0.f, self.view.frame.size.height, self.view.frame.size.width, 36}];
    
    [toolsForDatePicker setBarTintColor:[[UIColor alloc] initWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1.f]];
    UIBarButtonItem *cancelButton= [[UIBarButtonItem alloc] initWithTitle: @"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onDateCanceled)];
    [cancelButton setTintColor:[UIColor whiteColor]];
    //    [cancelButton UIBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace];
    UIBarButtonItem *doneButton= [[UIBarButtonItem alloc] initWithTitle: @"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onDateDone)];
    [doneButton setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *flexaibleSpace= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //    toolsForDatePicker set
    [toolsForDatePicker setItems:@[cancelButton, flexaibleSpace,doneButton]];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] initWithFrame:(CGRect){0.f, self.view.frame.size.height+36, self.view.frame.size.width, self.view.frame.size.height- 366- 36}];
//    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    datePicker.datePickerMode = UIDatePickerModeDate;
    datePicker.backgroundColor = [UIColor whiteColor];
    [datePicker addTarget:self action:@selector(onDateChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:toolsForDatePicker];
    [self.view addSubview:datePicker];
}

#pragma mark- Making Backend

-(void)onDateClicked:(UIControlEvents *)event{
    
    for (id searcher in self.view.subviews) {
        if([searcher class] == [UIToolbar class]){
            UIToolbar *toolsForDatePicker= (UIToolbar*) searcher;
            
            for (id searcher in self.view.subviews) {
                if([searcher class] == [UIDatePicker class]){
                    UIDatePicker *datePicker= (UIDatePicker*) searcher;
                    
                    [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
                        CGRect frameForDatePicker= toolsForDatePicker.viewForFirstBaselineLayout.frame;
                        frameForDatePicker.origin.y= 374;
                        toolsForDatePicker.frame= frameForDatePicker;
                        
                        frameForDatePicker= datePicker.viewForFirstBaselineLayout.frame;
                        frameForDatePicker.origin.y= 374+ 36;
                        datePicker.frame= frameForDatePicker;
                        
                    }   completion:nil];

                }
            }
        }
    }
    
    UIButton *button= self.view.subviews[0];
    button.enabled= NO;
    for (UIView *viewButton in self.view.subviews) {
        if([viewButton class]== [UIButton class]){
            UIButton *button= (UIButton*)viewButton;
            button.enabled= NO;
            //тут нужно отключить кликабельность кнопки а потом просто включить по Done или Cancel
            break;
        }
    }
    
}

-(void)onDateChanged:(UIControlEvents *)event{
}


-(void)onDateDone{//stores date to normalTitle of CHOOSE DATE button and hides views
    
        for(UIView *view in self.view.subviews){
            if([view class]== [UIDatePicker class]){
                UIDatePicker *datePicker= (UIDatePicker*)view;
                
                NSDate *dateOfPicker= datePicker.date;
    //            NSDate *myDate = datePicker.date;
                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
                [dateFormat setDateFormat:@"dd.MM.yyyy"];
                NSMutableString *prettyDate = [[NSMutableString alloc] init];
                [prettyDate appendString:[dateFormat stringFromDate:dateOfPicker]];
//                [prettyDate appendString:self.view.subviews[0].description];
//                NSLog(@"%@", prettyDate);
                for (UIView *viewButton in self.view.subviews) {
                    if([viewButton class]== [UIButton class]){
                        UIButton *button= (UIButton*)viewButton;
                        [button setTitle:prettyDate forState:UIControlStateNormal];
//                        [button setTitle:prettyDate forState:<#(UIControlState)#>]
                        button.enabled= YES;
                        self.doneWasPressed= 1;
                        break;
                    }
                }
                //hiding views
                for (id searcher in self.view.subviews) {
                    if([searcher class] == [UIToolbar class]){
                        UIToolbar *toolsForDatePicker= (UIToolbar*) searcher;
                        
                        [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
                            CGRect frameForAnimations= toolsForDatePicker.viewForFirstBaselineLayout.frame;
                            frameForAnimations.origin.y= self.view.frame.size.height;
                            toolsForDatePicker.frame= frameForAnimations;
                            
                            frameForAnimations= datePicker.viewForFirstBaselineLayout.frame;
                            frameForAnimations.origin.y= self.view.frame.size.height+ 36;
                            datePicker.frame= frameForAnimations;
                            
                        }   completion:nil];
                    }
                }
            }
        }

}

-(void)onDateCanceled{//canceling of choosing date and hides views
    for(UIView *view in self.view.subviews){
        if([view class]== [UIDatePicker class]){
            UIDatePicker *datePicker= (UIDatePicker*)view;
//            if(self.doneWasPressed){
//                NSDate *dateOfPicker= datePicker.date;
//                //            NSDate *myDate = datePicker.date;
//                NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//                [dateFormat setDateFormat:@"dd.MM.yyyy"];
//                NSString *prettyDate = [dateFormat stringFromDate:dateOfPicker];
//                for (UIView *viewButton in self.view.subviews) {
//                    if([viewButton class]== [UIButton class]){
//                        UIButton *button= (UIButton*)viewButton;
//                        [button setTitle:prettyDate forState:UIControlStateNormal];
//                        button.enabled= YES;
//                        break;
//                    }
//                }
//            }else
            for (UIView *viewButton in self.view.subviews) {
                if([viewButton class]== [UIButton class]){
                    UIButton *button= (UIButton*)viewButton;
                    button.enabled= YES;
                }
            }
            self.doneWasPressed= 0;
            //hiding views
            for (id searcher in self.view.subviews) {
                if([searcher class] == [UIToolbar class]){
                    UIToolbar *toolsForDatePicker= (UIToolbar*) searcher;
                    
                    [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
                        CGRect frameForAnimations= toolsForDatePicker.viewForFirstBaselineLayout.frame;
                        frameForAnimations.origin.y= self.view.frame.size.height;
                        toolsForDatePicker.frame= frameForAnimations;
                        
                        frameForAnimations= datePicker.viewForFirstBaselineLayout.frame;
                        frameForAnimations.origin.y= self.view.frame.size.height+ 36;
                        datePicker.frame= frameForAnimations;
                        
                    }   completion:nil];
                }
            }
        }
    }

}

-(void)onTextFieldEditingEnded{
    for (id search in self.view.subviews) {
        if([search class]== [UITextField class]){
            UITextField *myTextField= (UITextField*)search;
            
            [myTextField resignFirstResponder];
            NSLog(@"resignFirstResponder");
            break;
        }
    }
}

-(void)keyboardWillShow:(NSNotification*)notification{
    CGRect keyboardRect= [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    float duration= [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    __block __weak SUNMakingPartyVC *weakSelf= self;
    [UIView animateWithDuration:duration animations:^(void){
        CGRect viewFrame = weakSelf.view.frame;
        viewFrame.origin.y-= keyboardRect.size.height;
        weakSelf.view.frame= viewFrame;
    }];
}

-(void)keyboardWillHide:(NSNotification*)notification{
    float duration = [[[notification userInfo]  objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    __block __weak SUNMakingPartyVC *weakSelf= self;
    [UIView animateWithDuration:duration animations:^(void){
        CGRect viewFrame = weakSelf.view.frame;
        viewFrame.origin.y= 0;
        weakSelf.view.frame= viewFrame;
    }];
}

-(void)onTopSlide:(UIControlEvents *)event{
    int second=0;
    int valueBotSlider= 0;
    UISlider *sliderBot;
    UILabel *labelBot;
    for (id search in self.view.subviews) {
        if([search class] == [UISlider class]){
            if(second==1){
                sliderBot= (UISlider*)search;
                //достать второй имджВью лейбл
                int fourth= 0;
                for (id search in self.view.subviews) {
                    if(([search class] == [UIImageView class])){
                        if(fourth == 1){
                            UIImageView *sliderLabelView= (UIImageView*) search;
                            for(id searchingLabel in sliderLabelView.subviews)
                                if([searchingLabel class]== [UILabel class]){
                                    labelBot= searchingLabel;

                                }
                        }
                        fourth++;
                    }
                }
                break;
            }
            
            second++;
        }
    }
    
    second= 0;
    
    for (id search in self.view.subviews) {
        if([search class] == [UISlider class]){
            UISlider *slider= (UISlider*)search;
            second++;
            //достать  первый UIImageView
            int fourth= 0;
            if(second==1)
            for (id search in self.view.subviews) {
                if(([search class] == [UIImageView class])){
                    if(fourth == 0){
                        UIImageView *sliderLabelView= (UIImageView*) search;
                        for(id searchingLabel in sliderLabelView.subviews)
                            if([searchingLabel class]== [UILabel class]){
                                //
                                UILabel *sliderLabel= searchingLabel;
                                
                                int value= (int)(sliderBot.value*1439);
                                int hours= 0;
                                for( hours; value>=60 ; hours++){
                                    value-= 60;
                                }
                                int minutes= (int)(value);
                                if(slider.value*1439>= (sliderBot.value*1439-30)){
                                    sliderBot.value= ((float)(slider.value*1439+30))/1439;
                                    labelBot.text=[[NSMutableString alloc] initWithFormat:@"%02i-%02i",hours, minutes];
//                                    sliderBot.value= 1.f;
                                }
                                
                                
                                value= (int)(slider.value*1439);
                                hours= 0;
                                for( hours; value>=60 ; hours++){
                                    value-= 60;
                                }
                                minutes= (int)(value);
                                NSMutableString *valueFormatStr= [[NSMutableString alloc] init];
                                [valueFormatStr appendFormat:@"%02i-%02i",hours, minutes];
                                [sliderLabel setText:valueFormatStr];
                                
//                                break;
                                
                            }
                    }
                    fourth++;
                    break;
                }
            }
//            break;
        }
//        break;
    }
}

-(void)onBotSlide:(UIControlEvents*)event{
    int second= 0;
    UISlider *slider;
    UILabel *sliderLabel;
    for (id search in self.view.subviews) {
        if([search class] == [UISlider class]){
            slider= (UISlider*)search;
            second++;
            //достать  первый UIImageView
            int fourth= 0;
            if(second==1)
                for (id search in self.view.subviews) {
                    if(([search class] == [UIImageView class])){
                        if(fourth == 0){
                            UIImageView *sliderLabelView= (UIImageView*) search;
                            for(id searchingLabel in sliderLabelView.subviews)
                                if([searchingLabel class]== [UILabel class]){
                                    //
                                    sliderLabel= (UILabel*)searchingLabel;
                                                                    }
                        }
                        fourth++;
                        break;
                    }
                }
            break;
        }

    }
    
    second=0;
    
    for (id search in self.view.subviews) {
        if([search class] == [UISlider class]){
            if(second==1){
                UISlider *sliderBot= (UISlider*)search;
                //достать второй имджВью лейбл
                int fourth= 0;
                for (id search in self.view.subviews) {
                    if(([search class] == [UIImageView class])){
                        if(fourth == 1){
                            UIImageView *sliderLabelView= (UIImageView*) search;
                            for(id searchingLabel in sliderLabelView.subviews)
                                if([searchingLabel class]== [UILabel class]){
                                    UILabel *labelBot= (UILabel*)searchingLabel;
                                    int value= (int)(slider.value*1439);
                                    int hours= 0;
                                    for( hours; value>=60 ; hours++){
                                        value-= 60;
                                    }
                                    int minutes= (int)(value);
                                    if(slider.value*1439>= (sliderBot.value*1439-30)){
                                        slider.value= ((float)(sliderBot.value*1439-30))/1439;
                                        sliderLabel.text=[[NSMutableString alloc] initWithFormat:@"%02i-%02i",hours, minutes];
                                        //                                    sliderBot.value= 1.f;
                                    }
                                    
                                    
                                    value= (int)(sliderBot.value*1439);
                                    hours= 0;
                                    for( hours; value>=60 ; hours++){
                                        value-= 60;
                                    }
                                    minutes= (int)(value);
                                    labelBot.text= [[NSMutableString alloc]
                                                                      initWithFormat:@"%02i-%02i",hours, minutes];

                                    
                                }
                        }
                        fourth++;
                    }
                }
                break;
            }
            
            second++;
        }
        
    }

}



#pragma mark- Working with PartyMakerView
-(void)makeParty{
    
    SUNMakingPartyVC *partyMakerVC =[SUNMakingPartyVC new];
    partyMakerVC.view = [[UIView alloc] initWithFrame:self.view.frame];
    [partyMakerVC.navigationItem setHidesBackButton:YES];
    
    [partyMakerVC addLine];
    [partyMakerVC addRound:@"CHOOSE DAY"];
    [partyMakerVC addDateButton];
    
    [partyMakerVC addRound:@"PARTY NAME"];
    [partyMakerVC addTextField];
    
    [partyMakerVC addRound:@"START"];
    [partyMakerVC addTopSlider];
    
    [partyMakerVC addRound:@"END"];
    [partyMakerVC addBotSlider];
    
    [partyMakerVC addRound:@"LOGO"];
    [partyMakerVC addScrollViewWithPageControl];
    
    [partyMakerVC addRound:@"DESCRIPTION"];
    [partyMakerVC addTextView];
    
    [partyMakerVC addRound:@"FINAL"];
    [partyMakerVC addSaveButton];
    [partyMakerVC addCancelButton];
    
    [partyMakerVC addHidenViews];
    
    [self.navigationController pushViewController:partyMakerVC animated:YES];
}


@end
