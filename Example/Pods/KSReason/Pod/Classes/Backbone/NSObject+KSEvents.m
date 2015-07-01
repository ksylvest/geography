//
//  NSObject+KSEvents.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-30.
//
//

#import <objc/runtime.h>

#import <KSReason/KSEnumerable.h>

#import "NSObject+KSEvents.h"

@implementation NSObject (_KSEvents)

const void *kObserversKey = &kObserversKey;

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Observers

- (NSMutableDictionary *)ks_observers
{
    NSMutableDictionary *observers = objc_getAssociatedObject(self, &kObserversKey);
    if (!observers)
    {
        observers = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, kObserversKey, observers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return observers;
}

- (BOOL)ks_observing
{
    return !!objc_getAssociatedObject(self, &kObserversKey);
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Implementation

- (void)on:(NSString *)name callback:(void (^)(id object))callback
{
    if (!self.ks_observers[name]) self.ks_observers[name] = [NSMutableSet set];
    [self.ks_observers[name] addObject:callback];
}

- (void)off:(NSString *)name callback:(void (^)(id object))callback
{
    if (!self.ks_observers[name]) self.ks_observers[name] = [NSMutableSet set];
    [self.ks_observers[name] removeObject:callback];
}

- (void)trigger:(NSString *)name
{
    if (self.ks_observing && self.ks_observers[name])
    {
        for (void (^callback)(id) in self.ks_observers[name])
        {
            callback(self);
        }
    }
}

@end
