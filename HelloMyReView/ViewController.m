//
//  ViewController.m
//  HelloMyReView
//
//  Created by LazyScream on 2016/8/3.
//  Copyright © 2016年 LINYUNSHIUAN. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/SKStoreProductViewController.h>

@interface ViewController () <SKStoreProductViewControllerDelegate>{
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//跳出按鈕
- (IBAction)goToAppStore:(id)sender {
    [self openAppStore];
}
//不跳出按鈕
- (IBAction)inAppOpen:(id)sender {
    [self openInApp];
}

//跳出App開啟商店
-(void)openAppStore{
    NSString *iTunesLink = @"itms://itunes.apple.com/us/app/apple-store/id1127368759?mt=8";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
}
//不跳出App開啟商店
-(void)openInApp{
    SKStoreProductViewController* spvc = [[SKStoreProductViewController alloc] init];
    [spvc loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier : @1127368759}
                    completionBlock:nil];
    spvc.delegate = self;
    [self presentViewController:spvc animated:YES completion:nil];
}
//按下取消按鈕時退回主頁面
-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
