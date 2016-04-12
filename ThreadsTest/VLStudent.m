//
//  VLStudent.m
//  ThreadsTest
//
//  Created by Viktor Lukashevich on 11.04.16.
//  Copyright © 2016 Viktar Lukashevich. All rights reserved.
//

#import "VLStudent.h"

@implementation VLStudent

+ (dispatch_queue_t)staticQueue {
    static dispatch_once_t onceToken;
    static dispatch_queue_t studentQueue = nil;
    dispatch_once(&onceToken, ^{
        studentQueue = dispatch_queue_create("com.viktarlukashevich.threadstest.queue", DISPATCH_QUEUE_CONCURRENT);
    });
    return studentQueue;
}

int range;
MagicBlock resultBlock = ^(int intToGuess, int range) {
        int i = arc4random()%(range+1);
        while(i != intToGuess){
            i = arc4random()%(range+1);
        }
        NSLog(@"Student guessed the number. Number is %d", i);
};


- (instancetype)initWithName:(NSString*)name{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}


- (void) numberGuessing:(int)intToGuess range:(int)range block:(MagicBlock)block{
    dispatch_async([VLStudent staticQueue], ^{
        resultBlock(intToGuess,range);
    });
   }

@end
