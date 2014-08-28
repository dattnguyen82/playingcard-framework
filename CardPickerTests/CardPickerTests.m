//
//  CardPickerTests.m
//  CardPickerTests
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "CardGame.h"
#import "Player.h"
#import "HiLoCardGame.h"
#import "BlackJackCardGame.h"
#import "TexasHoldEmCardGame.h"

@interface CardPickerTests : XCTestCase

@end

@implementation CardPickerTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPlayingCardDeckValid
{
    int suitCount[4] = {0};
    int rankCount[14] = {0};
    
    Deck* playDeck = [[PlayingCardDeck alloc] init];
    
    XCTAssertTrue([playDeck count] == 52);
  
    NSMutableArray* drawCards = [playDeck drawCards:52];
    
    for (PlayingCard* card in drawCards)
    {
        if ([card.suit isEqualToString:@"♤"])
        {
            suitCount[0]++;
        }
        else if ([card.suit isEqualToString:@"♧"])
        {
            suitCount[1]++;
        }
        else if ([card.suit isEqualToString:@"♡"])
        {
            suitCount[2]++;
        }
        else if ([card.suit isEqualToString:@"♢"])
        {
            suitCount[3]++;
        }
        
        rankCount[card.rank]++;
    }
    
    
    for (int i=0; i<4; i++)
    {
        XCTAssertTrue(suitCount[i] == 13);
    }
    
    for (int i=1; i<14; i++)
    {
        XCTAssertTrue(rankCount[i] == 4);
    }
    
    XCTAssertTrue(rankCount[0] == 0);
    
}

- (void)testPlayingCardGame
{
    CardGame* game = [[CardGame alloc] init];
    
    Player* p1 = [[Player alloc] init];
    p1.name =@"Player 1";
    [game addPlayer:p1];
    
    Player* p2 = [[Player alloc] init];
    p2.name =@"Player 2";
    [game addPlayer:p2];
    
    Player* p3 = [[Player alloc] init];
    p3.name =@"Player 3";
    [game addPlayer:p3];
    
    Player* p4 = [[Player alloc] init];
    p4.name =@"Player 4";
    [game addPlayer:p4];
    
    NSMutableArray* players = game.players;
    
    XCTAssertTrue([players count] == 4);
    

    Player* pt1 = (Player*)players[0];
    XCTAssertTrue([pt1.name isEqualToString:@"Player 1"]);
    
    Player* pt2 = (Player*)players[1];
    XCTAssertTrue([pt2.name isEqualToString:@"Player 2"]);
    
    Player* pt3 = (Player*)players[2];
    XCTAssertTrue([pt3.name isEqualToString:@"Player 3"]);
    
    Player* pt4 = (Player*)players[3];
    XCTAssertTrue([pt4.name isEqualToString:@"Player 4"]);
}

- (void)testHiLoCardGame
{
    int decks = 4;
    HiLoCardGame* cardGame = [[HiLoCardGame alloc] init];
    
    [cardGame setup:@"Test Player" deckCount:decks];
    
    int count=0;
    
    while ([cardGame.cardDeck drawCards:1])
    {
        count++;
    }
    
    int target = 52 * decks;
    
   XCTAssertTrue(target = count);
}

- (void) testBlackJackGame
{
    BlackJackCardGame *cardGame = [[BlackJackCardGame alloc] init];
    
    [cardGame setup:1];
    
    [cardGame addNewPlayer:@"Player 1"];
    
    [cardGame addNewPlayer:@"Player 2"];
    
    [cardGame addNewPlayer:@"Player 3"];
    
    [cardGame addNewPlayer:@"Player 4"];
    
    [cardGame dealHand];
    
    [cardGame playHand:BlackJackPlayerActionHit];
    
    for (Player* p in cardGame.players)
    {
        NSLog(@"%@", p.name);
        for (PlayingCard* card in p.cards)
        {
            NSLog(@"%@", card.contents);
        }
    }
}

- (void) testTexasHoldCardGame
{
    TexasHoldEmCardGame* cardGame = [[TexasHoldEmCardGame alloc] init];
    
    [cardGame setup];
    
    [cardGame dealHand];
    
    for (Player* p in cardGame.players)
    {
        NSLog(@"%@", p.name);
        for (PlayingCard* card in p.cards)
        {
            NSLog(@"%@", card.contents);
        }
    }
}


@end
