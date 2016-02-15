//
//  SUNMakingPartyByxibVC.m
//  PartyMaker
//
//  Created by 2 on 2/8/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNMakingPartyByxibVC.h"
#import "SUNUniversalView.h"
//#import "SUNSaver.h"
#import "SUNDataStore.h"

@interface SUNMakingPartyByxibVC () <UITextViewDelegate , UITextFieldDelegate , UIScrollViewDelegate , SUNUniversalViewDelegate>

//clickable
@property (nonatomic, weak) IBOutlet UIView* shiningDot;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *constraintShiningDot;
@property (nonatomic, weak) IBOutlet UIButton *buttonDateChoosing;
@property (nonatomic) NSString *dateIsChosen;
@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UISlider *sliderTop;
@property (nonatomic, weak) IBOutlet UISlider *sliderBot;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonCancel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *buttonSave;
@property (nonatomic) NSString *previousText;

//noneditable
@property (nonatomic, weak) IBOutlet UILabel *labelOfTopSlider;
@property (nonatomic, weak) IBOutlet UILabel *labelOfBottomSlider;

////nonclickable
@property (weak, nonatomic) IBOutlet UIView *line;
@property (nonatomic, weak) IBOutlet UIImageView *imageViewTopSlider;
@property (nonatomic, weak) IBOutlet UIImageView *imageViewBotSlider;
@property (nonatomic, weak) IBOutlet UIView *dot1;
@property (nonatomic, weak) IBOutlet UIView *dot2;
@property (nonatomic, weak) IBOutlet UIView *dot3;
@property (nonatomic, weak) IBOutlet UIView *dot4;
@property (nonatomic, weak) IBOutlet UIView *dot5;
@property (nonatomic, weak) IBOutlet UIView *dot6;
@property (weak, nonatomic) IBOutlet UIView *dot7;
@property (weak, nonatomic) IBOutlet UIButton *buttonLocation;

@property (nonatomic) UIDatePicker *pickerViewAndTools;
@property BOOL doneWasPressed;
@property BOOL partyWasEdited;

@end

@implementation SUNMakingPartyByxibVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    
    [self.view layoutIfNeeded];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName: [UIFont fontWithName:@"MyriadPro-Bold" size: 15] }];
    
    self.shiningDot.center = (CGPoint)(self.dot1.center);
    self.shiningDot.layer.cornerRadius = 6.5f;
    
    self.buttonDateChoosing.layer.cornerRadius =
    self.buttonLocation.layer.cornerRadius = 5.f;
    
    [self addAttributDotsAndLines];
    [self addAttributTextField];
    [self addAttributSliders];
    [self addAttributeScrollViewPageControl];
    [self addAttributeTextView];
    self.partyWasEdited = NO;
    
    if( self.partyToChange ){
        
//        NSLog(@"Here is some party to change %@ %li", self.partyToChange.partyName, self.indexOfPartyToChange);
        [self.navigationItem setTitle:@"EDITING PARTY"];
        
        [self.buttonDateChoosing setTitle:self.partyToChange.dateIsChosen forState:UIControlStateNormal];
        self.dateIsChosen = self.partyToChange.dateIsChosen;
        
        [self.textField setText:self.partyToChange.partyName];
        
        [self.sliderTop setValue:self.partyToChange.sliderTop.value];
        [self.labelOfTopSlider setText:[self textFromValueOfSlider:self.sliderTop]];
        
        [self.sliderBot setValue:self.partyToChange.sliderBot.value];
        [self.labelOfBottomSlider setText:[self textFromValueOfSlider:self.sliderBot]];
        
        [self.pageControl setCurrentPage:self.partyToChange.currentPage.currentPage];
        CGPoint contentOffset = (CGPoint){self.scrollView.frame.size.width * self.pageControl.currentPage, 0};
        [self.scrollView setContentOffset:contentOffset];
        
        [self.textView setText:self.partyToChange.descriptionOfParty];
        
        self.partyWasEdited = YES;
    }
    
    

}

-(void)viewDidAppear:(BOOL)animated{
    //добавил
    [super viewDidAppear:NO];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    [super viewWillDisappear:YES];
    
}

#pragma mark - shining dot

-(void)dotTo:(CGPoint)pointTo{
    
    [self.constraintShiningDot setConstant:(pointTo.y - 30)];

    [UIView animateWithDuration:0.2f animations:^(void){
        
        [self.view updateConstraints];
        
    }];
    
}

-(void)addAttributDotsAndLines{
    
    self.dot1.layer.cornerRadius =
    self.dot2.layer.cornerRadius =
    self.dot3.layer.cornerRadius =
    self.dot4.layer.cornerRadius =
    self.dot5.layer.cornerRadius =
    self.dot6.layer.cornerRadius =
    self.dot7.layer.cornerRadius = 5.f;

}

#pragma mark - button ChooseDate

- (IBAction)dateButtonWasClicked:(id)sender {
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SUNUniversalView class]) owner:nil options:nil];
    SUNUniversalView *pickerViewAndTools = nibContents[0];
    pickerViewAndTools.delegate = self;
    

    pickerViewAndTools.frame = (CGRect){0 , self.view.frame.size.height , self.view.frame.size.width , self.view.frame.size.height/2 + 66};
    
    [self.view addSubview:pickerViewAndTools];
    self.pickerViewAndTools = (UIDatePicker*)pickerViewAndTools;
    
    [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        CGRect frameForDatePicker = self.pickerViewAndTools.frame;
        frameForDatePicker.origin.y = self.view.frame.size.height/2 ; //+66 magic number
        self.pickerViewAndTools.frame = frameForDatePicker;
        
    }   completion:nil];
    
    self.buttonDateChoosing.enabled = NO;
    
    [self dotTo:self.dot1.center];
    
}



-(void)doneWasClicked:(SUNUniversalView *) datePickerView{
    //stores date to normalTitle of CHOOSE DATE button and hides views
    
    [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        CGRect frameForDatePicker = self.pickerViewAndTools.frame;
        frameForDatePicker.origin.y= self.view.frame.size.height;
        self.pickerViewAndTools.frame= frameForDatePicker;
        
    }   completion:^(BOOL finished){
        [datePickerView removeFromSuperview];

    }];
    
    self.buttonDateChoosing.enabled = YES;
    
    for(id view in self.pickerViewAndTools.subviews){
        if([view class]== [UIDatePicker class]){
            UIDatePicker *datePicker= (UIDatePicker*)view;
            
            NSDate *dateOfPicker= datePicker.date;
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"dd.MM.yyyy"];
            NSMutableString *prettyDate = [[NSMutableString alloc] init];
            [prettyDate appendString:[dateFormat stringFromDate:dateOfPicker]];
            
            [self.buttonDateChoosing setTitle:prettyDate forState:UIControlStateNormal];
            self.dateIsChosen= prettyDate;
            self.buttonDateChoosing.enabled= YES;
            self.doneWasPressed= 1;

        }
    }
    
}

-(void)cancelWasClicked:(SUNUniversalView *) datePickerView{
    
    [UIView animateWithDuration:0.3f delay:0.05f options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        CGRect frameForDatePicker = self.pickerViewAndTools.frame;
        frameForDatePicker.origin.y= self.view.frame.size.height;
        datePickerView.frame= frameForDatePicker;
        
    }   completion:^(BOOL finished){
        [datePickerView removeFromSuperview];

    }];
    
    self.buttonDateChoosing.enabled = YES;
    self.doneWasPressed= 0;
    
    

}

#pragma mark- textField

-(void)addAttributTextField{
    
    self.textField.layer.cornerRadius= 5.f;
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Your Party Name" attributes:@{ NSForegroundColorAttributeName : [[UIColor alloc] initWithRed:76/255.f green:82/255.f blue:92/255.f alpha:1.f] }];
    self.textField.attributedPlaceholder = str;
    self.textField.delegate = self;
    
}

-(IBAction)textFieldDidBeginEditing:(id)sender{
    
    [self dotTo:self.dot2.center];

}

-(BOOL)textFieldShouldReturn:(id)sender{
    
    [(UITextField*)sender resignFirstResponder];

    return YES;
}

#pragma mark- sliders

-(void)addAttributSliders{
    
    self.imageViewBotSlider.image = [UIImage imageWithCGImage:[[UIImage imageNamed:@"TimePopup"] CGImage] scale:1.f orientation:UIImageOrientationUpMirrored];
    
    self.labelOfTopSlider.text = [self textFromValueOfSlider:self.sliderTop];
    
    self.labelOfBottomSlider.text = [self textFromValueOfSlider:self.sliderBot];


    
}

-(IBAction)valueChangedTopSlider:(id)sender{
    
    [self dotTo:self.dot3.center];
    
    if( self.sliderTop.value > (self.sliderBot.value - 30) ){
        
        self.sliderBot.value = self.sliderTop.value + 30;
        
    }
    
    self.labelOfTopSlider.text = [self textFromValueOfSlider:self.sliderTop];
    
    self.labelOfBottomSlider.text = [self textFromValueOfSlider:self.sliderBot];

    
}

-(NSString *)textFromValueOfSlider:(UISlider*)slider{
    CGFloat value = slider.value;
    CGFloat hours = (int)value/60;
    CGFloat minutes = (value - hours * 60);
    
    return [[NSMutableString alloc] initWithFormat:@"%2d:%02d", (int)hours, (int)minutes];
}

-(IBAction)valueChangedBotSliders:(id)sender{
    
    [self dotTo:self.dot4.center];
    

    if( self.sliderTop.value >= self.sliderBot.value-30 ){
        
        self.sliderTop.value = self.sliderBot.value - 30;
        
    }
    
    self.labelOfTopSlider.text = [self textFromValueOfSlider:self.sliderTop];
    
    self.labelOfBottomSlider.text = [self textFromValueOfSlider:self.sliderBot];

}

#pragma mark - ScrollView;

-(void)addAttributeScrollViewPageControl{
    
    /*for(CGFloat i = 0; i < self.pageControl.numberOfPages; i++){
        
        CGFloat x= i*self.scrollView.frame.size.width;
        UIImageView* imageView= [[UIImageView alloc] initWithFrame:(CGRect){x + 64, 22, 64, 62}];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"PartyLogo_Small_%d", (int)i]];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:imageView];
        
    }
    
    self.scrollView.contentSize = (CGSize){self.scrollView.frame.size.width * 6, self.scrollView.frame.size.height};*/
    
    [self.pageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
    self.scrollView.layer.cornerRadius = 2.f;
    self.scrollView.delegate = self;
    
}

-(void)onPageChanged:(UIControlEvents*)event{
    
    [self dotTo:self.dot5.center];
    
    CGPoint contentOffset = (CGPoint){self.scrollView.frame.size.width * self.pageControl.currentPage, 0};
    [self.scrollView setContentOffset:contentOffset];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self dotTo:(CGPoint){self.shiningDot.center.x , self.dot5.center.y }];
    
    NSInteger currentPage = scrollView.contentOffset.x/scrollView.frame.size.width;
    [self.pageControl setCurrentPage:currentPage];
    
}

- (IBAction)onPageScrollTouch:(id)sender {
    
//    [self dotTo:(CGPoint){self.shiningDot.center.x, self.scrollView.center.y}];
    [self dotTo: self.dot5.center];
    
}

#pragma mark - TextView

-(void)addAttributeTextView{
    
    UIToolbar *toolsForTV= [[UIToolbar alloc] initWithFrame:(CGRect){0.f, self.view.frame.size.height, self.view.frame.size.width, 36}];
    
    [toolsForTV setBarTintColor:[[UIColor alloc] initWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1.f]];
    UIBarButtonItem *cancelButton= [[UIBarButtonItem alloc] initWithTitle: @"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onTextViewCanceled)];
    [cancelButton setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *doneButton= [[UIBarButtonItem alloc] initWithTitle: @"Done" style:UIBarButtonItemStyleDone target:self action:@selector(onTextViewDone)];
    [doneButton setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *flexaibleSpace= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [toolsForTV sizeToFit];
    
    [toolsForTV setItems:@[cancelButton, flexaibleSpace, doneButton]];

    self.textView.layer.cornerRadius = 2.f;
    self.textView.inputAccessoryView = toolsForTV;
    self.textView.delegate = self;
    
}

-(void)onTextViewCanceled{
    
    self.textView.text = self.previousText;
    [self.textView resignFirstResponder];
    
}

-(void)onTextViewDone{
    
    [self.textView resignFirstResponder];
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView*) textView{
    
    [self dotTo:(CGPoint){self.dot1.center.x , self.textView.center.y}];
    
    return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView*)textView{
    self.previousText = self.textView.text;
    
    return YES;
}

#pragma mark - location

- (IBAction)onLocationWasClicked:(id)sender {
    
    [self dotTo:(CGPoint){self.dot1.center.x , self.buttonLocation.center.y}];
    
}


#pragma mark - keyboard

-(void)keyboardWillShow:(NSNotification*)notification{
    
    if(self.textView.isFirstResponder){
        
        CGRect keyboardRect= [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
        float duration= [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue] + 300;
        
        __block __weak SUNMakingPartyByxibVC *weakSelf= self;
        [UIView animateWithDuration:duration animations:^(void){
            
            CGRect viewFrame = weakSelf.view.frame;
            viewFrame.origin.y -= keyboardRect.size.height - 64;
            weakSelf.view.frame= viewFrame;
            
        }];
        
    }else {
        return;
    }
    
}

-(void)keyboardWillHide:(NSNotification*)notification{
    
    float duration = [[[notification userInfo]  objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue] - 300;
    
    __block __weak SUNMakingPartyByxibVC *weakSelf= self;
    [UIView animateWithDuration:duration animations:^(void){
        
        CGRect viewFrame = weakSelf.view.frame;
        viewFrame.origin.y= 0+ 64;
        weakSelf.view.frame= viewFrame;
        
    }];
    
}

#pragma mark - save button

- (IBAction)onSaveClicked:(id)sender {
    NSMutableArray *parties = [[NSMutableArray alloc] init];
    
    if ( self.partyWasEdited ) {
        self.doneWasPressed = YES;
    }
    
    if (self.doneWasPressed != YES){
        
        __block UIAlertController *alert = [UIAlertController
                                            alertControllerWithTitle:@"Erorr!"
                                            message:@"You should choose date for your party"
                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:actionCancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if([self.textField.text isEqualToString:@""]){
        
        __block UIAlertController *alert = [UIAlertController
                                            alertControllerWithTitle:@"Erorr!"
                                            message:@"You should enter party name"
                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:actionCancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if([self.previousText isEqualToString:@""]){
        
        __block UIAlertController *alert = [UIAlertController
                                            alertControllerWithTitle:@"Erorr!"
                                            message:@"You should enter description of your party"
                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:actionCancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        SUNDataStore *party = [[SUNDataStore alloc]  initWithName:self.textField.text  date:self.dateIsChosen                                                sliderTop: self.sliderTop    sliderBot: self.sliderBot  description: self.textView.text    pageControl:self.pageControl];

        if ( self.partyWasEdited ) {
            parties = [SUNDataStore readFromPlist];
            //
            NSData *dataParty = [NSKeyedArchiver archivedDataWithRootObject:party];
            [parties removeObjectAtIndex:self.indexOfPartyToChange];
            [parties insertObject:dataParty atIndex:self.indexOfPartyToChange];
            NSLog(@"data of party was added to parties");
            
        }else{
            parties = [SUNDataStore readFromPlist];
            NSData *dataParty = [NSKeyedArchiver archivedDataWithRootObject:party];
            
            [parties addObject:dataParty];
        }
        
        [SUNDataStore saveToPlist:parties];

        [self.navigationController popToRootViewControllerAnimated:YES];

    }
    
}

#pragma mark - cancel button

- (IBAction)onCancelClicked:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
