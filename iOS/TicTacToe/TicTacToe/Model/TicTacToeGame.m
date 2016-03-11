//
//  TicTacToeGame.m
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import "TicTacToeGame.h"
@interface TicTacToeGame()

@property(readwrite,getter=isGameOver) BOOL gameOver;

@property(nonatomic, strong) NSMutableArray *gameArray;


@end

@implementation TicTacToeGame



-(NSMutableArray *)gameArray
{
    if (!_gameArray){
        _gameArray = [[NSMutableArray alloc]initWithCapacity:9];
    }
    
    return _gameArray;
}

-(void)initGame
{
    for(int i = 0;i < [self.gameArray count];i++){
        self.gameArray[i] = @0;
    }
}

-(void)makeMoveAtIndex:(NSUInteger)index
{
    
}
-(NSInteger)getPieceStateAtIndex:(NSUInteger)index
{
    return index < [self.gameArray count]?index:-1;
}

@end
