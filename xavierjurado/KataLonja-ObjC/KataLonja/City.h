//
//  City.h
//  KataLonja
//
//  Created by Xavier Jurado on 04/05/11.
//

#import <Foundation/Foundation.h>


@interface City : NSObject 
{
    
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger priceVieirasPerKilo;
@property (nonatomic, assign) NSInteger pricePulpoPerKilo;
@property (nonatomic, assign) NSInteger priceCentolloPerKilo;
@property (nonatomic, assign) NSInteger distanceFromOrigin;

+ (City *) cityWithData:(NSDictionary *)data;

@end
