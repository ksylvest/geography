//
//  KSRegions.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSRegions.h"
#import "KSRegion.h"

@implementation KSRegions

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overrides

- (Class)kind
{
    return [KSRegion class];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Accessors

+ (instancetype)all
{
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSString *file = [bundle pathForResource:@"KSGeography.bundle/KSGeography" ofType:@"plist"];
    NSArray *geography = [[NSArray alloc] initWithContentsOfFile:file];
    
    NSArray *parameters = [geography ks_reduce:^NSArray *(NSMutableArray *array, NSDictionary *parameters) {
        [array addObjectsFromArray:parameters[@"regions"]];
        return array;
    } memo:[NSMutableArray array]];
    
    KSRegions *collection = [self new];
    [collection parse:parameters];
    
    return collection;

}

- (KSRegion *)named:(NSString *)name
{
    return [self.models ks_find:^BOOL(KSRegion *region) {
        return [region.name isEqualToString:name];
    }];
}

- (KSRegion *)coded:(NSString *)code
{
    return [self.models ks_find:^BOOL(KSRegion *region) {
        return [region.code isEqualToString:code];
    }];
}

@end
