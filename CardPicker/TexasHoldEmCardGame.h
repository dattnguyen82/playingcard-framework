//
//  TexasHoldEm.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/9/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "CardGame.h"
#import "Player.h"

@interface TexasHoldEmCardGame : CardGame

@property (readonly, strong, nonatomic) Player* house;

- (void) setup;

- (void) reset;

- (void) addNewPlayer:(NSString*) name;

- (void) dealHand;

@end
