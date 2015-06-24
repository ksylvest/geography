//
//  KSCollection.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <KSReason/KSEnumerable.h>

#import "KSCollection.h"
#import "KSModel.h"

NSString * const KSCollectionModelsKey = @"models";

@interface KSCollection () <NSCoding>

@property (nonatomic, strong) NSArray *models;

@end

@implementation KSCollection

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Overridable

- (Class)kind
{
    return [KSModel class];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Helpers

- (BOOL)empty
{
    return !self.count;
}

- (NSUInteger)count
{
    return self.models.count;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Parsable

- (void)parse:(NSArray *)parameters
{
    self.models = [parameters KS_map:^NSObject <KSParsable> *(NSDictionary *params) {
        NSObject <KSParsable> *object = [[self kind] new];
        [object parse:params];
        
        return object;
    }];
}

- (NSArray *)parameterize
{
    return [self.models KS_map:^NSDictionary * (NSObject <KSParsable> *model) {
        return [model parameterize];
    }];
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
        self.models = [decoder decodeObjectForKey:KSCollectionModelsKey];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.models forKey:KSCollectionModelsKey];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Enumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])objects
                                    count:(NSUInteger)count
{
    return [self.models countByEnumeratingWithState:state objects:objects count:count];
}

@end
