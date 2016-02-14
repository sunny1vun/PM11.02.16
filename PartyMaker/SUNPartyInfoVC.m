//
//  SUNPartyInfoVC.m
//  PartyMaker
//
//  Created by 2 on 2/14/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNPartyInfoVC.h"
#import "SUNMakingPartyByxibVC.h"
//#import "SUNSaver.h"

@interface SUNPartyInfoVC ()

@end

@implementation SUNPartyInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if( [segue.identifier isEqualToString:@"toEditParty"] ){
        
        NSLog(@"going to edit party %@ %li", self.selectedParty.partyName, self.indexOfSelectedParty);
        
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
