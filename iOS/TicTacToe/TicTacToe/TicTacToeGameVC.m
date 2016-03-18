//
//  TicTacToeGameVC.m
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import "TicTacToeGameVC.h"
#import "GamePiece.h"
#import "TicTacToeGame.h"
#import <AWSCore/AWSCore.h>
#import <AWSCognito/AWSCognito.h>


@interface TicTacToeGameVC()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *gameButtons;
@property (nonatomic, strong) TicTacToeGame *game;

@end

@implementation TicTacToeGameVC


-(TicTacToeGame *)game
{
    if (!_game) {
        _game = [[TicTacToeGame alloc]init];
    }
    return _game;
}

-(void)newGame
{
    self.game = nil;
    [self updateUI];
}

-(void)viewDidLoad
{
    AWSCognitoCredentialsProvider  *credentialsPovider =  [AWSServiceManager defaultServiceManager].defaultServiceConfiguration.credentialsProvider;

    // Retrieve your Amazon Cognito ID.
   
   [[credentialsPovider getIdentityId] continueWithBlock:^id _Nullable(AWSTask * _Nonnull task) {
       if (task.error) {
           NSLog(@"Error getting ID");
       }else{
           NSLog(@"ID: %@",task.result);
       }
       return nil;
   }];
    
    
    
    [self updateUI];
}
-(void)updateUI
{
    for (UIButton *button in self.gameButtons){
        GamePiece *gamePiece = [self.game getPieceAtIndex:[self.gameButtons indexOfObject:button]];
        button.enabled = !gamePiece.isPlayed;
        [button setTitle:gamePiece.contents forState:UIControlStateNormal | UIControlStateDisabled];
    }
}

-(void)endGameWithGameState:(GameState)gameState
{
    UIAlertController *endGameAlert = nil;
    if (gameState == ENDED_WITH_TIE) {
        endGameAlert = [UIAlertController alertControllerWithTitle:@"Game Is Over" message:@"It's a TIE" preferredStyle:UIAlertControllerStyleAlert];
    }else if(gameState == ENDED_WITH_WINNER){
            endGameAlert = [UIAlertController alertControllerWithTitle:@"Game Is Over" message:[NSString stringWithFormat:@"The winner is %@",self.game.winner] preferredStyle:UIAlertControllerStyleAlert];
    }
    
    UIAlertAction *newGameAction = [UIAlertAction actionWithTitle:@"New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self newGame];
        [endGameAlert dismissViewControllerAnimated:YES completion:nil];
    }];
    [endGameAlert addAction:newGameAction];
    [self presentViewController:endGameAlert animated:YES completion:nil];
    
}

- (IBAction)buttonPressed:(UIButton *)sender {
    
    GameState gameState = [self.game makeMoveAtIndex:[self.gameButtons indexOfObject:sender]];
    [self updateUI];
    if (gameState == ENDED_WITH_WINNER || gameState == ENDED_WITH_TIE) {
        [self endGameWithGameState:gameState];
    }
}


@end
