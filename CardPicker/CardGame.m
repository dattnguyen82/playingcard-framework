//
//  CardGame.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "CardGame.h"
#import "Player.h"

@implementation CardGame

@synthesize players = _players;
@synthesize cardDeck = _cardDeck;

- (NSMutableArray*) players
{
    if (_players == nil)
    {
        _players = [[NSMutableArray alloc] init];
    }
    
    return _players;
}

- (void) addPlayer:(Player*) player
{
    if (player)
    {
        [self.players addObject:player];
    }
}

- (Deck*) cardDeck
{
    if (_cardDeck == nil)
    {
        _cardDeck = [[Deck alloc] init];
    }
    
    return _cardDeck;
}

@end
