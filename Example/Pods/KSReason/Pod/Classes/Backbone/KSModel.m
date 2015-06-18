//
//  KSModel.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSModel.h"

NSString * const KSCollectionParametersKey = @"parameters";

@interface KSModel () <NSCoding>

@property (nonatomic, strong) NSDictionary *parameters;

@end

@implementation KSModel

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsable

- (void)parse:(NSDictionary *)parameters
{
    self.parameters = parameters;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (id)get:(NSString *)attribute
{
    return self.parameters[attribute];
}

- (void)set:(NSString *)attribute value:(NSString *)value
{
    self.parameters = [self.parameters KS_extend:@{ attribute: value }];
}

- (BOOL)has:(NSString *)attribute
{
    return !!self.parameters[attribute];
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
        self.parameters = [decoder decodeObjectForKey:KSCollectionParametersKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.parameters forKey:KSCollectionParametersKey];
}

@end
