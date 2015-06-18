//
//  KSCallback.h
//  Pods
//
//  Created by Kevin Sylvestre on 2015-07-08.
//
//

#ifndef Pods_KSCallback_h
#define Pods_KSCallback_h

#define KSCallback(callback, ...) ({ if (callback) { callback(__VA_ARGS__); } })

#endif
