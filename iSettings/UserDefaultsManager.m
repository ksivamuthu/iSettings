//
//  UserDefaultsManager.m
//  iSettings
//
//  Created by Siva on 5/21/13.
//  Copyright (c) 2013 Vatsalya. All rights reserved.
//

#import "UserDefaultsManager.h"

#define dRotationEnabled @"enablerotation"
#define dFontSize @"fontsize"


@implementation UserDefaultsManager

@synthesize rotationEnabled = _rotationEnabled;
@synthesize labelFontSize = _labelFontSize;

+(id)sharedManager{
    static UserDefaultsManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

-(BOOL)rotationEnabled{
    return[[NSUserDefaults standardUserDefaults] boolForKey:dRotationEnabled];
}

-(void)setRotationEnabled:(BOOL)rotationEnabled{
    [[NSUserDefaults standardUserDefaults] setBool:rotationEnabled forKey:dRotationEnabled];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSNumber *)labelFontSize{
    NSString *fontSize =  [[NSUserDefaults standardUserDefaults] stringForKey:dFontSize];
    return [NSNumber numberWithInt:[fontSize intValue]];
}

-(void)setLabelFontSize:(NSNumber *)labelFontSize {
    [[NSUserDefaults standardUserDefaults] setObject:labelFontSize forKey:dFontSize];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
