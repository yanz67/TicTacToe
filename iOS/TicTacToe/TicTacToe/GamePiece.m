//
//  GamePiece.m
//  TicTacToe
//
//  Created by Yan Zverev on 3/16/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import "GamePiece.h"

@implementation GamePiece

@synthesize contents = _contents;

-(NSString *)contents
{
    if (!_contents) {
        _contents = @"";
    }
    return _contents;
}

-(void)setContents:(NSString *)contents
{
    if ([contents isEqualToString:@"X"] || [contents isEqualToString:@"O"]){
        _contents = contents;
    }
    
}

-(NSUInteger)gamePieceValue
{
    return [self.contents isEqualToString:@""]?0:[self.contents isEqualToString:@"X"]?1:-1;
}

@end
