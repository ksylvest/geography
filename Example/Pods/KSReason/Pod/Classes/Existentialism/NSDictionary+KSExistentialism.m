//
//  NSDictionary+KSExistentialism.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "NSDictionary+KSExistentialism.h"
#import "NSObject+KSExistentialism.h"

@implementation NSDictionary (KSExistentialism)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Implementation

- (BOOL)KS_exists
{
    return [super KS_exists] && !!self.count;
}

@end
