//
//  HiLoCardGameViewController.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/7/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "HiLoCardGameViewController.h"
#import "HiLoCardGame.h"
#import "HiLoPlayer.h"

@interface HiLoCardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *CardLabel;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *ChancesLabel;

@end

HiLoCardGame* hiLoGame;
HiLoPlayer* currentPlayer;

@implementation HiLoCardGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    hiLoGame = [[HiLoCardGame alloc] init];
    [hiLoGame setup:@"Test Player" deckCount:1];
    currentPlayer = hiLoGame.currentPlayer;
    [_NameLabel setText:currentPlayer.name];
    [self updateDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ButtonPressLo:(id)sender
{
    [self updateGame:HiLoPlayerActionLo];
}

- (IBAction)ButtonPressEqual:(id)sender
{
    [self updateGame:HiLoPlayerActionEqual];
}

- (IBAction)ButtonPressHi:(id)sender
{
    [self updateGame:HiLoPlayerActionHi];
}

- (void) updateGame:(HiLoPlayerAction) action
{
    [hiLoGame playCard:action];
    [self updateDisplay];
}

- (void)updateDisplay
{
    [_ScoreLabel setText: [NSString stringWithFormat:@"%i", currentPlayer.score]];
    [_ChancesLabel setText: [NSString stringWithFormat:@"%i", currentPlayer.chances]];
    [_CardLabel setText:[hiLoGame.currentCard contents]];
}

@end
