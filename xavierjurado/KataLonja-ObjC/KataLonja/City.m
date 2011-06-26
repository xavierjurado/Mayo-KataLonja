//
//  City.m
//  KataLonja
//
//  Created by Xavier Jurado on 04/05/11.
//

#import "City.h"


@implementation City

@synthesize name;
@synthesize priceVieirasPerKilo;
@synthesize pricePulpoPerKilo;
@synthesize priceCentolloPerKilo;
@synthesize distanceFromOrigin;

+ (City *) cityWithData:(NSDictionary *)data
{
   City *me = [[City alloc] init];
   
   me.name = [data objectForKey:@"cityName"];
   me.priceVieirasPerKilo = [[data objectForKey:@"priceVieirasPerKilo"] integerValue];
   me.pricePulpoPerKilo = [[data objectForKey:@"pricePulpoPerKilo"] integerValue];
   me.priceCentolloPerKilo = [[data objectForKey:@"priceCentolloPerKilo"] integerValue];
   me.distanceFromOrigin = [[data objectForKey:@"distanceFromOrigin"] integerValue];
   
   return [me autorelease];
}

- (void)dealloc 
{
   [name release];
   name = nil;
   
   [super dealloc];
}

@end
