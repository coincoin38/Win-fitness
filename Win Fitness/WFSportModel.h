//
//  WFSportModel.h
//  Win Fitness
//
//  Created by julien gimenez on 14/04/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFSportModel : NSObject

@property(nonatomic) NSInteger idSport;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *description_id;
@property(nonatomic,strong) NSString *color;
@property(nonatomic,strong) NSString *image;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
