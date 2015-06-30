//
//  NSArray+KSExistentialism.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "NSArray+KSExistentialism.h"
#import "NSObject+KSExistentialism.h"

@implementation NSArray (KSExistentialism)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Implementation

- (BOOL)ks_exists
{
    return [super ks_exists] && !!self.count;
}

@end
