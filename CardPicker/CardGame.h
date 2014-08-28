//
//  CardGame.h
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Deck.h"

@interface CardGame : NSObject

@property (readonly, nonatomic, strong) NSMutableArray* players;

@property (strong, nonatomic) Deck* cardDeck;

- (void) addPlayer:(Player*) player;

@end
