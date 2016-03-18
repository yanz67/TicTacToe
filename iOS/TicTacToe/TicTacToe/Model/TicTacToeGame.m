//
//  TicTacToeGame.m
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import "TicTacToeGame.h"


@interface TicTacToeGame()


@property (nonatomic, strong) NSMutableArray *gameArray;
@property (nonatomic,strong) NSString *currentPlayer;
@property (nonatomic) GameState gameState;
@property (nonatomic,readwrite) NSString *winner;

@end

@implementation TicTacToeGame

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initGame];
    }
    
    return self;
}



-(NSString *)winner
{
    if (!_winner){
        _winner = @"";
    }
    return _winner;
}

-(NSMutableArray *)gameArray
{
    if (!_gameArray){
        _gameArray = [[NSMutableArray alloc]initWithCapacity:9];
    }
    
    return _gameArray;
}

-(void)initGame
{
    self.currentPlayer = @"X";
    for(int i = 0;i < 9;i++){
        [self.gameArray addObject:[[GamePiece alloc]init]];
    }
    self.gameState = PLAYING;
}

-(GameState)makeMoveAtIndex:(NSUInteger)index
{
    GamePiece *gamePiece = index < [self.gameArray count]?self.gameArray[index]:nil;
    if (gamePiece) {
        gamePiece.contents = self.currentPlayer;
        gamePiece.played = true;
        if ([self didAnyoneWin]){
            self.gameState = ENDED_WITH_WINNER;
            return self.gameState;
        }else if ([self isGameOver]){
            self.gameState = ENDED_WITH_TIE;
            return self.gameState;
        }
        self.currentPlayer = [self.currentPlayer isEqualToString:@"X"]?@"O":@"X";
    }
    
    return self.gameState;
}
-(GamePiece *)getPieceAtIndex:(NSUInteger)index
{
    return index < [self.gameArray count]?self.gameArray[index]:nil;
}

-(BOOL)winnerWithSum:(NSInteger)sum
{
    
    if (sum == -3) {
        self.winner =  @"O";
        return true;
    }else if (sum == 3){
        self.winner = @"X";
        return true;
    }
    
    return false;
}

-(BOOL)isGameOver
{
    for (int i = 0;i < [self.gameArray count];i++){
        if ([self.gameArray[i] gamePieceValue] == 0) {
            return false;
        }
    }
    return true;
}
-(BOOL)didAnyoneWin
{
    NSInteger sum = 0;
    
    //check rows for winner
    for (int i = 0; i < 3;i++){
        sum = 0;
        for (int j = i*3; j < (i+1)*3;j++){
            sum += [self.gameArray[j] gamePieceValue];
        }
        if([self winnerWithSum:sum]) return true;
    }
    
    
    //check columns for winner
    for (int i = 0 ; i < 3; i++) {
        sum = 0;
        for (int j = i; j <= i+6;j+=3){
            sum += [self.gameArray[j] gamePieceValue];
        }
        if([self winnerWithSum:sum]) return true;
    }

    //check left to right diagonal for winner
    sum = 0;
    sum += [self.gameArray[0] gamePieceValue] + [self.gameArray[4] gamePieceValue] + [self.gameArray[8] gamePieceValue];
    if([self winnerWithSum:sum]) return true;
    
    //check right to left diagonal for winner
    sum = 0;
    sum += [self.gameArray[2] gamePieceValue] + [self.gameArray[4] gamePieceValue] + [self.gameArray[6] gamePieceValue];
    if([self winnerWithSum:sum]) return true;
    
    return false;
}


-(GameState) gameState
{
    return _gameState;
}



@end
