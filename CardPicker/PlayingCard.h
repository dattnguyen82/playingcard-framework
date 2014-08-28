//
//  PlayingCard.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

enum {
    PlayingCardMatchType_NoMatch = 0,
    PlayingCardMatchType_RankMatch = 1,
    PlayingCardMatchType_SuitMatch = 2,
    PlayingCardMatchType_AllMatch = 3
};
typedef NSUInteger PlayingCardMatchType;

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*) validRankStrings;
+ (NSArray*) validSuits;
+ (NSUInteger) maxRank;

- (PlayingCardMatchType) match:(PlayingCard*) card;

@end
