//
//  Deck.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card*) card;
- (void) combineDecks:(Deck*) deck;
- (void) shuffle;
- (NSMutableArray *) drawCards:(NSUInteger) count;
- (Card *) top;
- (NSUInteger) count;


@end
