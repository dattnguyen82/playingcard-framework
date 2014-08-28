//
//  HiLoCardGame.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "HiLoCardGame.h"
#import "PlayingCardDeck.h"
#import "HiLoPlayer.h"

@interface HiLoCardGame()
@property (nonatomic) NSUInteger currentChain;
@end

@implementation HiLoCardGame

@synthesize currentChain = _currentChain;
@synthesize currentCard = _currentCard;
@synthesize currentPlayer = _currentPlayer;

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        HiLoPlayer* player = [[HiLoPlayer alloc] init];
        [self addPlayer:player];
    }
    
    return self;
}

- (HiLoPlayer*) getPlayer
{
    return (HiLoPlayer*) self.players[0];
}

- (void) setup:(NSString*)name deckCount:(NSUInteger)deckCount
{
    self.cardDeck = [[PlayingCardDeck alloc] init];
    
    for (int i=0; i<deckCount-1; i++) //subtract 1 because we get a deck at init.
    {
        PlayingCardDeck* deck = [[PlayingCardDeck alloc] init];
        [self.cardDeck combineDecks:deck];
    }
    
    _currentPlayer = [self getPlayer];
    _currentPlayer.name = name;
    
    [self reset];
}

- (PlayingCard*) getTopCard
{
    NSMutableArray* cards = [self.cardDeck drawCards:1];
    
    if (cards)
    {
        return (PlayingCard*)cards[0];
    }
    
    return nil;
}

- (void) reset
{
    _currentPlayer.score = 0;
    _currentPlayer.chances = 3;
    
    self.currentChain = 1;
    [self.cardDeck shuffle];
    self.currentCard = [self getTopCard];
}

- (bool) playCard:(HiLoPlayerAction)action
{
    bool result = false;
    
    PlayingCard* card = [self getTopCard];
    
    if (action == HiLoPlayerActionHi)
    {
        result = (bool) ( card.rank > self.currentCard.rank );
    }
    else if (action == HiLoPlayerActionLo)
    {
        result = (bool) ( card.rank < self.currentCard.rank );
    }
    else
    {
        result = (bool) ( card.rank == self.currentCard.rank );
    }
    
    if (result)
    {
        _currentPlayer.score += self.currentChain;
        self.currentChain++;
    }
    else
    {
        self.currentChain = 1;
        _currentPlayer.chances--;
    }
    
    if (_currentPlayer.chances <= 0)
    {
        //Game over
    }
    
    self.currentCard = card;
    
    return result;
}

@end
