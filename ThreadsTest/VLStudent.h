//
//  VLStudent.h
//  ThreadsTest
//
//  Created by Viktor Lukashevich on 11.04.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^MagicBlock)(int, int);

@interface VLStudent : NSObject

@property (strong,nonatomic) NSString *name;

- (void) numberGuessing:(int)intToGuess range:(int)range block:(MagicBlock)block;
- (instancetype)initWithName:(NSString*)name;

@end
