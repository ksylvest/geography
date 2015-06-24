//
//  KSParsable.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-17.
//
//

#import <Foundation/Foundation.h>

/**
 Archivable is a protocol that exposes `parse:` and `parameterize`. The serilization is up to the implementor.
 */
@protocol KSParsable <NSObject>

/**
 Parse takes parameters (typically an array or dictionary) and serializes them to an object.
 @param parameters A set of parameters (typically an array or dictionary).
 */
- (void)parse:(id)parameters;

/**
 Parameterize serializes an object to parameters (typically an array or dictionary).
 @return A parameterized version (typically an array or dictionary).
 */
- (id)parameterize;

@end
