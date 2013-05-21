//
//  UserDefaultsManager.h
//  iSettings
//
//  Created by Siva on 5/21/13.
//  Copyright (c) 2013 Vatsalya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsManager : NSObject

+(id)sharedManager;

@property (assign, nonatomic) BOOL rotationEnabled;
@property (strong, nonatomic) NSNumber *labelFontSize;

@end