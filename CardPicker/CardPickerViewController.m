//
//  CardPickerViewController.m
//  CardPicker
//
//  Created by Dat Nguyen on 7/2/14.
//  Copyright (c) 2014 ge.globalresearch. All rights reserved.
//

#import "CardPickerViewController.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardPickerViewController ()
@property (weak, nonatomic) IBOutlet UILabel *CardLabel;

@end

@implementation CardPickerViewController

Deck* playDeck;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    playDeck = [[PlayingCardDeck alloc] init];
}
- (IBAction)PressShuffleButton:(id)sender {
    [playDeck shuffle];
    [_CardLabel setText:@"♤♧♡♢"];
}

- (IBAction)PressDrawButton:(id)sender
{
    if (!playDeck)
        return;
    
    NSMutableArray *draw = [playDeck drawCards:1];
    
    if ([draw count] <= 0)
        return;
    
    PlayingCard* top = nil;
    top = (PlayingCard*) draw[0];
    [_CardLabel setText:[top contents]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
