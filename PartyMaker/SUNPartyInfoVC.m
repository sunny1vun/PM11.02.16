//
//  SUNPartyInfoVC.m
//  PartyMaker
//
//  Created by 2 on 2/14/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNPartyInfoVC.h"
#import "SUNMakingPartyByxibVC.h"
#import "SUNDataStore.h"
#import <UIKit/UIKit.h>
//#import "SUNSaver.h"

@interface SUNPartyInfoVC ()

//info about party
@property (weak, nonatomic) IBOutlet UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UILabel *nameParty;
@property (weak, nonatomic) IBOutlet UILabel *descriptionParty;
@property (weak, nonatomic) IBOutlet UILabel *dateParty;
@property (weak, nonatomic) IBOutlet UILabel *timeStartParty;
@property (weak, nonatomic) IBOutlet UILabel *timeEndParty;
@property (weak, nonatomic) IBOutlet UIView *logoContainerView;

//for actions with window
@property (weak, nonatomic) IBOutlet UIButton *deleteParty;
@property (weak, nonatomic) IBOutlet UIButton *addPhotoParty;
@property (weak, nonatomic) IBOutlet UIButton *editParty;


@end

@implementation SUNPartyInfoVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.dateParty setText:self.selectedParty.dateIsChosen];
    [self.nameParty setText:self.selectedParty.partyName];
    [self.timeStartParty setText:[[SUNMakingPartyByxibVC alloc] textFromValueOfSlider: self.selectedParty.sliderTop]];
    [self.timeEndParty setText:[[SUNMakingPartyByxibVC alloc] textFromValueOfSlider: self.selectedParty.sliderBot]];
    [self.descriptionParty setText:self.selectedParty.descriptionOfParty];
    [self.logoView setImage: [UIImage imageNamed:[NSString stringWithFormat:@"PartyLogo_Small_%ld", (long)self.selectedParty.currentPage.currentPage]]];
    
//    self.logoContainerView.layer.cornerRadius = 5.f;
    self.addPhotoParty.layer.cornerRadius =
    self.editParty.layer.cornerRadius =
    self.deleteParty.layer.cornerRadius = 5.f;
    [self.navigationItem.backBarButtonItem setTintColor:[[UIColor alloc] initWithRed:21/255.f green:22/255.f blue:26/255.f alpha:1.f]];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationItem.backBarButtonItem setTintColor:[[UIColor alloc] initWithRed:21/255.f green:22/255.f blue:26/255.f alpha:1.f]];
    
}

#pragma mark - delete party

- (IBAction)deleteParty:(id)sender {
    
    self.deleteParty.enabled = NO;
    NSMutableArray *parties = [SUNDataStore readFromPlist];
    [parties removeObjectAtIndex:self.indexOfSelectedParty];
    NSLog(@"data of party was deleted from parties");
    [SUNDataStore saveToPlist:parties];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if( [segue.identifier isEqualToString:@"toEditParty"] ){
        
        NSLog(@"going to edit party %@ %li", self.selectedParty.partyName, (long)self.indexOfSelectedParty);
        
        SUNMakingPartyByxibVC *editParty = segue.destinationViewController;
        
        editParty.partyToChange = self.selectedParty;
        editParty.indexOfPartyToChange = self.indexOfSelectedParty;
        
        
    }
    
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
