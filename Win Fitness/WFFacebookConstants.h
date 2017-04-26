//
//  WFFacebookConstants.h
//  Win Fitness
//
//  Created by julien gimenez on 28/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

extern NSString * const kPathAuthToken;
extern NSString * const kFeedNews;
extern NSString * const kVersionAPI;
extern NSString * const kGetMethod;

extern NSString * const kKeyClientId;
extern NSString * const kValueClientId;

extern NSString * const kKeyClientSecret;
extern NSString * const kValueClientSecret;

extern NSString * const kKeyGrantType;
extern NSString * const kValueGrantType;

extern NSString * const kKeyLimit;
extern NSString * const kValueLimit;

extern NSString * const kKeyFields;
extern NSString * const kValueFieldsToken;
extern NSString * const kValueFieldsNews;

@interface WFFacebookConstants : NSObject

+ (NSDictionary *)authTokenParameters;
+ (NSDictionary *)newsParameters;

@end
