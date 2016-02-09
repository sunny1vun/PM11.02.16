//
//  ViewController.m
//  PartyMaker
//
//  Created by 2 on 2/3/16.
//  Copyright © 2016 TonyStar. All rights reserved.
//

#import "SUNViewController.h"
#import "SUNMakingPartyVC.h"

@interface SUNViewController ()

@end

@implementation SUNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    SUNMakingPartyVC *root =[SUNMakingPartyVC new];
    root.view = [[UIView alloc] initWithFrame:self.view.frame];

    [root.view setBackgroundColor: [[UIColor alloc] initWithRed:46/255.f green:49/255.f blue:56/255.f alpha:1.f]];
    
    UIBarButtonItem *rightRoot = [[UIBarButtonItem alloc] initWithTitle: @"+" style:UIBarButtonItemStylePlain target:root action:@selector(makeParty)];
    
    [rightRoot setTintColor:[UIColor whiteColor]];
    root.navigationItem.rightBarButtonItem = rightRoot;
    
    root.title= @"PARTY MAKER";
    
    UINavigationController *myNavigator = [[UINavigationController alloc] initWithRootViewController:root];
    [myNavigator.navigationBar setBarStyle:UIBarStyleBlack];
    NSLog(@"%@", myNavigator.viewControllers);
    [myNavigator.navigationBar setBarTintColor:[UIColor colorWithRed:68/255.f green:73/255.f blue:83/255.f alpha:1]];
    [myNavigator.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [self presentViewController:myNavigator animated:NO completion:nil];
//    self presentViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#> completion:<#^(void)completion#>
    

}

@end
