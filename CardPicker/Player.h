//
//  Player.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSUInteger score;
@property (nonatomic, strong) NSMutableArray* cards;
@property (nonatomic, strong) NSString* name;

@end
