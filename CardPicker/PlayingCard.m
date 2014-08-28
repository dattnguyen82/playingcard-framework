//
//  PlayingCard.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;
@synthesize rank = _rank;

+ (NSArray*) validRankStrings
{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSArray*) validSuits
{
    return @[@"♤", @"♧",@"♡",@"♢"];
}

+ (NSUInteger) maxRank
{
    return [[PlayingCard validRankStrings] count];
}

- (NSString*) contents
{
    return [[PlayingCard validRankStrings][self.rank] stringByAppendingString:self.suit];
}

- (void) suit:(NSString *) suit
{    
    _suit = ([[PlayingCard validSuits] containsObject:suit] ) ? suit : @"?";
}

- (NSString*) suit
{
    return _suit;
}

- (void) rank:(NSUInteger) rank
{
    _rank = (rank > 0 || rank <= [PlayingCard maxRank]) ? rank : 0;
}

- (NSUInteger) rank
{
    return _rank;
}

- (PlayingCardMatchType) match:(PlayingCard*) card
{
    PlayingCardMatchType match = PlayingCardMatchType_NoMatch;
    
    if ([self.suit isEqualToString:card.suit] && self.rank == card.rank)
    {
        match = PlayingCardMatchType_AllMatch;
    }
    else if ([self.suit isEqualToString:card.suit] )
    {
       match = PlayingCardMatchType_SuitMatch;
    }
    else if (self.rank == card.rank )
    {
        match = PlayingCardMatchType_RankMatch;
    }
    
    return match;
}



@end
