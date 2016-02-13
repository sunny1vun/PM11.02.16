//
//  SUNMenuPatryMakerVC.m
//  PartyMaker
//
//  Created by 2 on 2/13/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNMenuPatryMakerVC.h"
#import "SUNTableViewCell.h"
#import "SUNSaver.h"
#import "SUNDataStore.h"
#import "NSDate+Utility.h"

@interface SUNMenuPatryMakerVC () <UITableViewDataSource , UITableViewDelegate>

//for table
@property (nonatomic, strong) NSArray *dataArray;
//@property (nonatomic, strong) UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

//static NSString *CellIdentifier = @"Cell";

@implementation SUNMenuPatryMakerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //here need to fill my array with info from userDefaults or my plist myLogs.plist
//    self.dataArray = @[@"one" , @"two" , @"three" , @"four" , @"five"];
    SUNDataStore *dataFromLog = [[SUNDataStore alloc] init];
    
    self.dataArray = [dataFromLog readFromPlist];
    
    self.tableView.dataSource = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSourse methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
//    return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SUNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SUNTableViewCell reuseIdentifier] forIndexPath:indexPath];
    
    //here needs to fill cell by my info from array
//    NSArray *arrayOfParties = [[[SUNSaver alloc] init] encodeDataObject:self.dataArray[indexPath.row]];
    
    SUNSaver *savedParty = [NSKeyedUnarchiver unarchiveObjectWithData:self.dataArray[indexPath.row]];
    NSString *formatedDateWithTime = [NSDate formateToStringDate:savedParty.dateIsChosen startTime:savedParty.sliderTop endTime:savedParty.sliderBot];
    NSString *imageName = [[NSString alloc] initWithFormat:@"PartyLogo_Small_%li", (long)savedParty.currentPage.currentPage];
    [cell configureWithName:savedParty.partyName dateAndTimeOfParty:formatedDateWithTime logo:[UIImage imageNamed: imageName]];
    
    
//    [cell configureWithName:@"Custom Name of Party" dateAndTimeOfParty:@"Custom date and time" logo:[UIImage imageNamed:@"PartyLogo_Small_0" ]];
//    @property (nonatomic, strong) NSString *partyName;
//    @property (nonatomic, strong) NSString *dateIsChosen;
//    @property (nonatomic, strong) UISlider *sliderTop;
//    @property (nonatomic, strong) UISlider *sliderBot;
//    @property (nonatomic, strong) NSString *descriptionOfParty;
//    @property (nonatomic, strong) UIPageControl * currentPage;
//    //запилить уникальный айди для каждой сохраняемой пати
//    @property (nonatomic) int uniqueID;
    
//    cell configureWithName:savedParty.partyName dateAndTimeOfParty:[NSString stringWithFormat:@"",] logo:<#(UIImage *)#>
    
    return cell;
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
