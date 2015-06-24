//
//  KSValidator.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import <KSReason/KSEnumerable.h>
#import <KSReason/KSExistentialism.h>
#import <KSReason/KSFormatting.h>

NSString * const KSValidatorLength = @"length";
NSString * const KSValidatorFormat = @"format";
NSString * const KSValidatorInclusion = @"inclusion";
NSString * const KSValidatorExclusion = @"exclusion";
NSString * const KSValidatorPresence = @"presence";
NSString * const KSValidatorAbsence = @"absence";

NSString * const KSValidatorIs = @"is";
NSString * const KSValidatorMinimum = @"minimum";
NSString * const KSValidatorMaximum = @"maximum";
NSString * const KSValidatorWith = @"with";
NSString * const KSValidatorIn = @"in";


#import "KSValidator.h"
#import "KSValidation.h"

@interface KSValidator ()

@property (nonatomic, strong) NSDictionary *validations;
@property (nonatomic, strong) NSDictionary *errors;

@end

@implementation KSValidator

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Factories

+ (instancetype)validator:(NSDictionary *)validations
{
    return [[self alloc] initWithValidations:validations];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Validations

+ (BOOL)length:(NSString *)string is:(NSUInteger)length
{
    return string.length == length;
}

+ (BOOL)length:(NSString *)string minimum:(NSUInteger)minimum
{
    return string.length >= minimum;
}

+ (BOOL)length:(NSString *)string maximum:(NSUInteger)maximum
{
    return string.length <= maximum;
}

+ (BOOL)format:(NSString *)string with:(id)regex
{
   return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex] evaluateWithObject:string];
}

+ (BOOL)inclusion:(NSObject *)object collection:(NSObject *)collection
{
    return [collection conformsToProtocol:@protocol(KSIterable)] &&
    [((NSObject <KSIterable> *)collection) KS_any:^BOOL(id object) { return [object isEqual:object]; }];
}

+ (BOOL)exclusion:(NSObject *)object collection:(NSObject *)collection
{
    return ![self inclusion:object collection:collection];
}

+ (BOOL)presence:(NSObject *)object
{
    return object.KS_exists;
}

+ (BOOL)absence:(NSObject *)object
{
    return ![self presence:object];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (id)initWithValidations:(NSDictionary *)validations
{
    self = [super init];
    
    if (self)
    {
        self.validations = [validations KS_map:^NSDictionary *(id attribute, NSDictionary *settings) {
            return [settings KS_map:^id(id kind, NSDictionary *options) {
                return [KSValidation kind:kind options:options];
            }];
        }];
    }
    
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (void)validate:(NSDictionary *)attributes
{
    self.errors = [attributes KS_map:^id(id key, id attribute) {
        return [self.validations[key] KS_reduce:^id(NSMutableArray *memo, id kind, KSValidation *validation) {
            [validation validate:attribute callback:^(NSString *message) { [memo addObject:message]; }];
            return memo;
        } memo:[NSMutableArray array]];
    }];
}

- (NSString *)humanize
{
    NSArray *errors = [self.errors KS_reduce:^id(NSMutableArray *memo, id key, NSArray *errors) {
        return [memo arrayByAddingObjectsFromArray:[errors KS_map:^id(NSString *message) {
            return [NSString stringWithFormat:@"%@ %@", NSLocalizedString(key, NULL), message];
        }]];
    } memo:[NSArray array]];
    
    return [KSHumanizer sentence:errors];
}


@end
