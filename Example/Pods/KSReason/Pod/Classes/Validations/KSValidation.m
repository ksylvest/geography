//
//  KSValidation.m
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-19.
//
//

#import "KSValidation.h"

NSString * const KSValidationEmail = @"\\A([^\\s]+)@([^\\s]+).([^\\s]+)\\Z";
NSString * const KSValidationPhone = @"\\A[0-9\\s\\(\\)\\+\\-]+\\Z";
NSString * const KSValidationURL = @"\\Ahttps?:\\\\\\s+\\Z";
NSString * const KSValidationSSN = @"\\A\\d{3}[\\s\\-]?\\d{2}[\\s\\-]?\\d{4}\\Z";
NSString * const KSValidationSIN = @"\\A\\d{3}[\\s\\-]?\\d{3}[\\s\\-]?\\d{3}\\Z";
