//
//  BlackJackCardGame.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/9/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "Card.h"
#import "PlayingCardDeck.h"
#import "BlackJackCardGame.h"
#import "BlackJackPlayer.h"

@implementation BlackJackCardGame

@synthesize dealer = _dealer;
@synthesize currentPlayerIndex = _currentPlayerIndex;

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        BlackJackPlayer* player = [[BlackJackPlayer alloc] init];
        player.name = @"Dealer";
        [self addPlayer:player];
    }
    
    return self;
}

- (void) setup:(NSUInteger)deckCount
{
    self.cardDeck = [[PlayingCardDeck alloc] init];
    
    for (int i=0; i<deckCount-1; i++) //subtract 1 because we get a deck at init.
    {
        PlayingCardDeck* deck = [[PlayingCardDeck alloc] init];
        [self.cardDeck combineDecks:deck];
    }
    
    [self reset];
}

- (void) reset
{
    [self.cardDeck shuffle];
    
    self.currentPlayerIndex = ([self.players count] > 1) ? 1 : 0;
}

- (void) addNewPlayer:(NSString*) name
{
    BlackJackPlayer* newPlayer = [[BlackJackPlayer alloc] init];
    
    newPlayer.name = name;
    
    [self addPlayer:newPlayer];
    
    self.currentPlayerIndex = [self.players count] - 1;
}

- (void) dealHand
{
    //easy deal
    for (BlackJackPlayer* p in self.players)
    {
        NSMutableArray* cards = [self.cardDeck drawCards:2];
        p.cards = cards;
    }
}


- (void) playHand:(BlackJackPlayerAction) action
{
    BlackJackPlayer* currentPlayer = (BlackJackPlayer*) self.players[self.currentPlayerIndex];
    
    if (action == BlackJackPlayerActionHit)
    {
        NSMutableArray* cards = [self.cardDeck drawCards:1];
        [currentPlayer.cards addObjectsFromArray:cards];
    }
}

@end
