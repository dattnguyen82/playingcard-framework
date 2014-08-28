//
//  HiLoCardGame.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "CardGame.h"
#import "PlayingCard.h"
#import "HiLoPlayer.h"

enum {
    HiLoPlayerActionHi = 0,
    HiLoPlayerActionLo = 1,
    HiLoPlayerActionEqual = 2
};
typedef NSUInteger HiLoPlayerAction;

@interface HiLoCardGame : CardGame

@property (strong, nonatomic) PlayingCard* currentCard;
@property (readonly, strong, nonatomic) HiLoPlayer* currentPlayer;

- (void) setup:(NSString*)name deckCount:(NSUInteger)deckCount;
- (bool) playCard:(HiLoPlayerAction)action;
- (void) reset;

@end
