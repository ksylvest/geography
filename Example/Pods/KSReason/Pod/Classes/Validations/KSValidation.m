//
//  KSValidation.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidation.h"
#import "KSValidator.h"
#import "KSValidate.h"

#import "KSValidationFormat.h"
#import "KSValidationLength.h"
#import "KSValidationInclusion.h"
#import "KSValidationExclusion.h"
#import "KSValidationPresence.h"
#import "KSValidationAbsence.h"

@interface KSValidation ()

@property (nonatomic, strong) NSString *kind;
@property (nonatomic, strong) id options;
@property (nonatomic, assign) BOOL valid;

@end

@implementation KSValidation

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Lifecycle

- (id)initWithOptions:(id)options
{
    self = [super init];
    if (self) self.options = options;
    return self;
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Factories

+ (instancetype)kind:(NSString *)kind options:(id)options
{
    if ([kind isEqualToString:KSValidate.length]) return [[KSValidationLength alloc] initWithOptions:options];
    if ([kind isEqualToString:KSValidate.format]) return [[KSValidationFormat alloc] initWithOptions:options];
    if ([kind isEqualToString:KSValidate.absence]) return [[KSValidationAbsence alloc] initWithOptions:options];
    if ([kind isEqualToString:KSValidate.presence]) return [[KSValidationPresence alloc] initWithOptions:options];
    if ([kind isEqualToString:KSValidate.inclusion]) return [[KSValidationInclusion alloc] initWithOptions:options];
    if ([kind isEqualToString:KSValidate.exclusion]) return [[KSValidationExclusion alloc] initWithOptions:options];
    return [[KSValidation alloc] initWithOptions:options];
}

////////////////////////////////////////////////////////////////////////////////

#pragma mark - Execution

- (void)validate:(id)attribute callback:(void (^)(NSString *message))callback
{
}

@end

