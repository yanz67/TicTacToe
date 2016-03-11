//
//  TicTacToeGame.h
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToeGame : NSObject

@property(readonly,getter=isGameOver) BOOL gameOver;


-(void)makeMoveAtIndex:(NSUInteger)index;
-(NSInteger)getPieceStateAtIndex:(NSUInteger)index;





@end
