//
//  TexasHoldEm.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/9/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "TexasHoldEmCardGame.h"
#import "PlayingCardDeck.h"

@implementation TexasHoldEmCardGame

@synthesize house = _house;

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        Player* player = [[Player alloc] init];
        player.name = @"House";
        [self addPlayer:player];
    }
    
    return self;
}

- (void) setup
{
    self.cardDeck = [[PlayingCardDeck alloc] init];
    [self reset];
}

- (void) reset
{
    [self.cardDeck shuffle];
}

- (void) addNewPlayer:(NSString*) name
{
    Player* newPlayer = [[Player alloc] init];
    
    newPlayer.name = name;
    
    [self addPlayer:newPlayer];

}

- (void) dealHand
{
    Player* house = self.players[0];
    
    house.cards = [self.cardDeck drawCards:5];
}

@end
