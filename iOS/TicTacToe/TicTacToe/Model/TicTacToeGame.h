//
//  TicTacToeGame.h
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GamePiece.h"

@interface TicTacToeGame : NSObject

typedef enum{
    PLAYING = 0,
    ENDED_WITH_WINNER = 1,
    ENDED_WITH_TIE = 2
} GameStates;

typedef NSUInteger GameState;


@property (nonatomic,readonly) NSString *winner;


-(GameState)makeMoveAtIndex:(NSUInteger)index;
-(GamePiece *)getPieceAtIndex:(NSUInteger)index;





@end
