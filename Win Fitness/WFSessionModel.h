//
//  WFSessionModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WFSportModel;

@interface WFSessionModel : NSObject

@property(nonatomic) BOOL attendance;

@property(nonatomic) NSInteger idSport;
@property(nonatomic,strong) NSString *from;
@property(nonatomic,strong) NSString *duration;
@property(nonatomic,strong) NSString *day;

@property(nonatomic,strong) WFSportModel *sport;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
