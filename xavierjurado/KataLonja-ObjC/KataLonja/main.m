//
//  main.m
//  KataLonja
//
//  Created by Xavier Jurado on 04/05/11.
//

#import <Foundation/Foundation.h>
#import "City.h"

NSInteger CargoBenefit (City *city);
NSInteger DeprecateCost (City *city, NSInteger cargoBenefit);
NSInteger MobilityCost (City *city);


int main (int argc, const char * argv[])
{
   NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
   
   // 1 - Load static city information
   NSString *filePath;
   NSArray *cityInfo;
   NSMutableSet *cities;

   filePath = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
   cityInfo = [NSArray arrayWithContentsOfFile:filePath];
   cities   = [NSMutableSet setWithCapacity:[cityInfo count]];
   for (NSDictionary *data in cityInfo)
   {
      [cities addObject:[City cityWithData:data]];
   }
   
   // 2 - Compute costs
   
   City *bestCity;
   NSInteger bestTotal = 0;
   
   for (City *city in cities)
   {
      NSInteger benefits = CargoBenefit(city);
      NSInteger costs = MobilityCost(city) + DeprecateCost(city, benefits);
      
      NSInteger total =  benefits + costs;
      NSLog(@"[%@]: %lu €", city.name, total);
      
      if (total > bestTotal)
      {
         bestTotal = total;
         bestCity = city;
      }
   }
   
   NSLog(@"> Best option: %@", bestCity.name);
   
   
   [pool drain];
   return 0;
}


// Cost / Benefit functions

#define KilosVieiras    50
#define KilosPulpo      100
#define KilosCentollo   50

NSInteger CargoBenefit (City *city)
{
   return   KilosVieiras*city.priceVieirasPerKilo + 
            KilosPulpo*city.pricePulpoPerKilo + 
            KilosCentollo*city.priceCentolloPerKilo;
}

NSInteger MobilityCost (City *city)
{
   return -5 + -2*city.distanceFromOrigin;
}

NSInteger DeprecateCost (City *city, NSInteger cargoBenefit)
{
   return (-0.01*cargoBenefit) * city.distanceFromOrigin/100;
}
