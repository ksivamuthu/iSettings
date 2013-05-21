//
//  ViewController.m
//  iSettings
//
//  Created by Siva on 5/21/13.
//  Copyright (c) 2013 Vatsalya. All rights reserved.
//

#import "ViewController.h"
#import "UserDefaultsManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)viewWillActive:(id)sender{
    NSNumber *fontsize = [[UserDefaultsManager sharedManager] labelFontSize];
    self.fontsizeLabel.font = [UIFont systemFontOfSize:[fontsize floatValue]];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    BOOL enabled = [[UserDefaultsManager sharedManager] rotationEnabled];
    if(enabled){
        return YES;
    }else{
        return UIInterfaceOrientationIsPortrait(interfaceOrientation);
    }
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSInteger)supportedInterfaceOrientations{
    BOOL enabled = [[UserDefaultsManager sharedManager] rotationEnabled];
    return enabled ?UIInterfaceOrientationMaskAll: UIInterfaceOrientationMaskPortrait;
}

@end
