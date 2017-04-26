//
//  WFFaceBookFeedModel.h
//  Win Fitness
//
//  Created by julien gimenez on 28/02/2017.
//  Copyright © 2017 julien gimenez. All rights reserved.
//

#import "WFBaseModel.h"

@interface WFFacebookFeedModel : WFBaseModel

@property(nonatomic,strong) NSString *created_time;
@property(nonatomic,strong) NSString *_description;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSString *full_picture;
@property(nonatomic,strong) NSString *identifier;
@property(nonatomic,strong) NSString *type;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *status_type;
@property(nonatomic,strong) NSArray<NSString *>*actions;
@property(nonatomic,strong) NSDictionary *data;

@property(nonatomic,strong) UIImage * downloadedPicture;

@end
