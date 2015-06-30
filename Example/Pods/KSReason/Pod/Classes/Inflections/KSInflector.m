//
//  KSInflector.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-12.
//
//

#import "KSInflector.h"

#import "NSString+KSRegex.h"

@interface KSInflector ()

@property (nonatomic, strong) NSMutableArray *rules;
@property (nonatomic, strong) NSMutableArray *pluralizations;
@property (nonatomic, strong) NSMutableArray *singularizations;

@end

@implementation KSInflector

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Factories

+ (instancetype)shared
{
    static KSInflector *inflector;
    static dispatch_once_t token;
    dispatch_once(&token, ^{ inflector = [KSInflector common]; });
    return inflector;
}

+ (instancetype)common
{
    NSArray *rules = @[@{ @"": @"" }];
    NSArray *pluralizations =   @[@{ @"o$": @"oes" }, @{ @"y$": @"ies" }, @{ @"$": @"s" }];
    NSArray *singularizations = @[@{ @"oes$": @"o" }, @{ @"ies$": @"y" }, @{ @"s$": @"" }];
    return [[self alloc] initWithRules:rules pluralizations:pluralizations singularizations:singularizations];
}

+ (void)config:(void (^)(KSInflector *inflector))callback
{
    callback(self.shared);
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (id)initWithRules:(NSArray *)rules pluralizations:(NSArray *)pluralizations singularizations:(NSArray *)singularizations
{
    self = [super init];
    
    if (self)
    {
        self.rules = [NSMutableArray arrayWithArray:rules];
        self.pluralizations = [NSMutableArray arrayWithArray:pluralizations];
        self.singularizations = [NSMutableArray arrayWithArray:singularizations];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Properties

- (NSMutableArray *)pluralizations
{
    if (!_pluralizations) _pluralizations = [NSMutableArray array];
    return _pluralizations;
}

- (NSMutableArray *)singularizations
{
    if (!_singularizations) _singularizations = [NSMutableArray array];
    return _singularizations;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Configuration

- (void)irregular:(NSString *)rule replacement:(NSString *)replacement
{
    [self.rules insertObject:@{ rule: replacement } atIndex:0];
}

- (void)plural:(NSString *)rule replacement:(NSString *)replacement
{
    [self.pluralizations insertObject:@{ rule: replacement } atIndex:0];
}

- (void)singular:(NSString *)rule replacement:(NSString *)replacement
{
    [self.singularizations insertObject:@{ rule: replacement } atIndex:0];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Operations

- (NSString *)pluralize:(NSString *)string
{
    for (NSDictionary *pair in self.rules)
    {
        for (NSString *alpha in pair)
        {
            NSString *omega = pair[alpha];
            if ([string ks_matches:alpha]) return omega;
            if ([string ks_matches:omega]) return alpha;
        }
    }
    
    for (NSDictionary *pair in self.pluralizations)
    {
        for (NSString *rule in pair)
        {
            NSString *replacement = pair[rule];
            if ([string ks_matches:rule]) return [string ks_replace:rule with:replacement];
        }
    }
    
    return string;
}

- (NSString *)singularize:(NSString *)string
{
    for (NSDictionary *pair in self.rules)
    {
        for (NSString *alpha in pair)
        {
            NSString *omega = pair[alpha];
            if ([string ks_matches:alpha]) return omega;
            if ([string ks_matches:omega]) return alpha;
        }
    }
    
    for (NSDictionary *pair in self.singularizations)
    {
        for (NSString *rule in pair)
        {
            NSString *replacement = pair[rule];
            if ([string ks_matches:rule]) return [string ks_replace:rule with:replacement];
        }
    }
    
    return string;
}

@end
