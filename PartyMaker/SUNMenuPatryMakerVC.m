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
#import "SUNPartyInfoVC.h"

@interface SUNMenuPatryMakerVC () <UITableViewDataSource , UITableViewDelegate>

//for table
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic) NSInteger indexOfSelectedCell;
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
    
//    Here comes connection of instance of VC and dataSource and delegate of my tableView by code
//    But i connected them in storyBoard by pressing right btnmouse and throwing it to my VC
  //  self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Подгружаются все файлы из таблицы а не один с измененным\добавленным контентом нужно изменить на подгрузку только одного, т.е. обращатся по индексу и не подгружать из файла
    SUNDataStore *dataFromLog = [[SUNDataStore alloc] init];

    self.dataArray = [dataFromLog readFromPlist];

    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSourse methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SUNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SUNTableViewCell reuseIdentifier] forIndexPath:indexPath];
    
    SUNSaver *savedParty = [NSKeyedUnarchiver unarchiveObjectWithData:self.dataArray[indexPath.row]];
    NSString *formatedDateWithTime = [NSDate formateToStringDate:savedParty.dateIsChosen startTime:savedParty.sliderTop endTime:savedParty.sliderBot];
    NSString *imageName = [[NSString alloc] initWithFormat:@"PartyLogo_Small_%li", (long)savedParty.currentPage.currentPage];
    [cell configureWithName:savedParty.partyName dateAndTimeOfParty:formatedDateWithTime logo:[UIImage imageNamed: imageName]];
    cell.selectedBackgroundView.backgroundColor = [[UIColor alloc] initWithRed:52/255.f green:56/255.f blue:66/255.f alpha:1.f];
    
    return cell;
}

#pragma mark - UITableViewDelegate methods
//- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    return indexPath;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    [self performSegueWithIdentifier:@"toPartyInfo" sender:self];
//    [self.navigationController pushViewController: animated:NO];
    //подгружать контект\изменять контект по последней измененной ячейке | для сохранения так же сделатьы
    
    //You won't have indexPath.row here cause it's will work's later then prepareForSegue method
//    self.indexOfSelectedCell = (long)indexPath.row;
    
    NSLog(@"On row %ld was touched", (long)indexPath.row);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - segues methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if( [segue.identifier isEqualToString:@"toPartyInfo"] ){
        
        SUNPartyInfoVC *partyInfoVC = segue.destinationViewController;
        
//        need to create instance of SUNSaver and then send it to instance of partyInfoVC
        
        //in dataArray stored instances of SUNSaver with has all property that i need cause it's model
        
        self.indexOfSelectedCell = [self.tableView indexPathForSelectedRow].row;
        
        SUNSaver *selectedParty = [NSKeyedUnarchiver unarchiveObjectWithData:self.dataArray[self.indexOfSelectedCell]];
        partyInfoVC.selectedParty = selectedParty;
        partyInfoVC.indexOfSelectedParty = self.indexOfSelectedCell;
        
        NSLog(@"going to party info %li", self.indexOfSelectedCell);
//        self.tableView.dataSource
        
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