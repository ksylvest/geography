//
//  KSEvents.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-06-30.
//
//

#import <Foundation/Foundation.h>

@protocol KSEvents <NSObject>

/**
 @param name The name.
 @param callback A block.
 */
- (void)on:(NSString *)name callback:(void (^)(id object))callback;

/**
 @param name The name.
 @param callback A block.
 */
- (void)off:(NSString *)name callback:(void (^)(id object))callback;

/**
 Triggers the callbacks associated with a given name.
 */
- (void)trigger:(NSString *)name;

@end
