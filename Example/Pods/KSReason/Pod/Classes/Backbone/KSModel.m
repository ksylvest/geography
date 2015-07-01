//
//  KSModel.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSModel.h"

#import "NSObject+KSEvents.h"

NSString * const KSModelID = @"id";
NSString * const KSModelAttributesKey = @"attributes";

@interface KSModel ()

@property (nonatomic, strong) NSDictionary *attributes;

@end

@implementation KSModel

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsable

- (void)parse:(NSDictionary *)attributes
{
    self.attributes = attributes;
    
    [self trigger:@"change"];
    for (NSString *attribute in attributes) [self trigger:[NSString stringWithFormat:@"change:%@", attribute]];
}

- (NSDictionary *)parameterize
{
    return self.attributes;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Identifiable

- (id)identifier
{
    return [self get:KSModelID];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (id)get:(NSString *)attribute
{
    return self.attributes[attribute];
}

- (void)set:(NSString *)attribute value:(NSString *)value
{
    self.attributes = [self.attributes ks_extend:@{ attribute: value }];

    [self trigger:@"change"];
    [self trigger:[NSString stringWithFormat:@"change:%@", attribute]];
}

- (void)unset:(NSString *)attribute
{
    self.attributes = [self.attributes ks_filter:^BOOL(NSString *key, id value) {
        return ![key isEqualToString:attribute];
    }];
    
    [self trigger:@"change"];
    [self trigger:[NSString stringWithFormat:@"change:%@", attribute]];
}

- (BOOL)has:(NSString *)attribute
{
    return self.attributes[attribute] && self.attributes[attribute] != [NSNull null];
}

- (void)clear
{
    self.attributes = [NSDictionary dictionary];
    
    [self trigger:@"change"];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Archivable

- (void)archive:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    [defaults setObject:data forKey:key];
    [defaults synchronize];
}

+ (instancetype)unarchive:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:key];
    if (!data) return nil;
    
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Coding

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if (self)
    {
        self.attributes = [decoder decodeObjectOfClass:[NSArray class] forKey:KSModelAttributesKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.attributes forKey:KSModelAttributesKey];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Copying

- (id)copyWithZone:(NSZone *)zone
{
    KSModel *copy = [[[self class] allocWithZone:zone] init];
    copy.attributes = [self.attributes copyWithZone:zone];

    return copy;
}

@end
