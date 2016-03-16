//
//  GamePiece.h
//  TicTacToe
//
//  Created by Yan Zverev on 3/16/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePiece : NSObject

@property (nonatomic, strong) NSString *contents;
@property (nonatomic,getter=isPlayed) BOOL played;

-(NSUInteger)gamePieceValue;

@end
