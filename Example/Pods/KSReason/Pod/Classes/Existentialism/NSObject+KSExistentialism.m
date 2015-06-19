//
//  NSObject+KSExistentialism.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "NSObject+KSExistentialism.h"

@implementation NSObject (KSExistentialism)

- (BOOL)KS_exists
{
    return self && self != [NSNull null];
}

@end
