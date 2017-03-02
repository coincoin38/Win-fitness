//
//  WFFacebookConstants.m
//  Win Fitness
//
//  Created by julien gimenez on 28/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFFacebookConstants.h"

NSString * const kPathAuthToken = @"/oauth/access_token";
NSString * const kFeedNews = @"1207136935980128/feed";
NSString * const kVersionAPI = @"v2.8";
NSString * const kGetMethod = @"GET";

NSString * const kKeyClientId = @"client_id";
NSString * const kValueClientId = @"1188664067920799";

NSString * const kKeyClientSecret = @"client_secret";
NSString * const kValueClientSecret = @"aef4309801db979e175817353cc18427";

NSString * const kKeyGrantType = @"grant_type";
NSString * const kValueGrantType = @"client_credentials";

NSString * const kKeyLimit = @"limit";
NSString * const kValueLimit = @"10";

NSString * const kKeyFields = @"fields";
NSString * const kValueFieldsToken = @"access_token";
NSString * const kValueFieldsNews = @"full_picture,actions,description,message,created_time,type";

@implementation WFFacebookConstants

+ (NSDictionary *)authTokenParameters
{
    return @{kKeyClientId : kValueClientId,
             kKeyClientSecret : kValueClientSecret,
             kKeyGrantType : kValueGrantType,
             kKeyFields : kValueFieldsToken};
}

+ (NSDictionary *)newsParameters{
    return @{kKeyLimit : kValueLimit,
             kKeyFields : kValueFieldsNews};
}

@end
