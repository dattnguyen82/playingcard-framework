//
//  BlackJackCardGame.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/9/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "CardGame.h"
#import "BlackJackPlayer.h"

enum {
    BlackJackPlayerActionHit = 0,
    BlackJackPlayerActionStay = 1
};
typedef NSUInteger BlackJackPlayerAction;


@interface BlackJackCardGame : CardGame

@property (readonly, strong, nonatomic) BlackJackPlayer* dealer;
@property (nonatomic) NSUInteger currentPlayerIndex;

- (void) setup:(NSUInteger)deckCount;

- (void) reset;

- (void) addNewPlayer:(NSString*) name;

- (void) dealHand;

- (void) playHand:(BlackJackPlayerAction) action;

@end
