//
//  TicTacToeGameVC.m
//  TicTacToe
//
//  Created by Yan Zverev on 3/10/16.
//  Copyright © 2016 Yan Zverev. All rights reserved.
//

#import "TicTacToeGameVC.h"

@interface TicTacToeGameVC()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *gameButtons;


@end

@implementation TicTacToeGameVC

- (IBAction)buttonPressed:(UIButton *)sender {
    
    NSLog(@"button index %lu",[self.gameButtons indexOfObject:sender]);
    
    
}



@end
