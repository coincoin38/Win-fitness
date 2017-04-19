//
//  WFSessionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFSessionModel : NSObject

@property(nonatomic,strong) NSString *idSession;
@property(nonatomic,strong) NSString *idSport;
@property(nonatomic,strong) NSString *from;
@property(nonatomic,strong) NSString *duration;
@property(nonatomic,strong) NSString *attendance;
@property(nonatomic,strong) NSString *day;

@property(nonatomic,strong) NSString *titleSport;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
