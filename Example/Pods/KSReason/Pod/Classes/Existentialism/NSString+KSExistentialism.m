//
//  NSString+KSExistentialism.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "NSString+KSExistentialism.h"
#import "NSObject+KSExistentialism.h"

@implementation NSString (KSExistentialism)

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Implementation

- (BOOL)ks_exists
{
    return [super ks_exists] && !!self.length;
}

@end
