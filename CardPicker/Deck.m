//
//  Deck.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "Deck.h"
#import "Card.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray* cards;
@property (nonatomic) NSUInteger currentTop;
@end

@implementation Deck

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _currentTop = 0;
    }
    
    return self;
}

- (NSMutableArray*) cards
{
    if (_cards == nil)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void) addCard:(Card*) card
{
    [self.cards addObject:card];
}


- (void) combineDecks:(Deck*) deck
{
    [self.cards addObjectsFromArray:deck.cards];
}

- (void) shuffle
{
    self.currentTop = 0;
    unsigned size = [self count];
    
    for (int i = 0; i<size; i++)
    {
        unsigned index = arc4random() % size;
        Card* shuffledCard = self.cards[i];
        self.cards[i] = self.cards[index];
        self.cards[index] = shuffledCard;
    }
}

- (NSUInteger) count
{
    return  [self.cards count];
}

- (Card* ) top
{
    if (self.currentTop >= [self.cards count])
        return nil;
    
    Card* card = self.cards[self.currentTop];
    
    return card;
}

- (NSMutableArray* ) drawCards:(NSUInteger) count
{
    if (self.currentTop >= [self count])
        return nil;
    
    NSMutableArray* drawCards = [[NSMutableArray alloc] init];
    
    NSInteger cardsLeft = [self count] - self.currentTop;
    NSUInteger maxDraw = (cardsLeft - (NSInteger)count >= 0) ? count : cardsLeft;
    
    for (int i=0; i<maxDraw; i++)
    {
        Card* card = [self top];
        [drawCards addObject:card];
        self.currentTop++;
    }
    
    return drawCards;
}


@end
