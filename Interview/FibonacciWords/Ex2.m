/*//
//  Ex1.m
//  
//
//  Created by J. Carlos Urteaga Reyesvera on 14/07/17.
//
//

#import "Ex1.h"
@implementation Ex1
@end
*/


	#import <Foundation/Foundation.h>


NSString* FibonacciWord(int number);
int main (int argc, const char * argv[]){

	if (argc ==3){
		NSString *strNumber = [NSString stringWithUTF8String:argv[1]];
		NSString *strPatron = [NSString stringWithUTF8String:argv[2]];
		int intFibonaci;
		if ([strNumber intValue] != 0)
		{
			intFibonaci = [strNumber intValue];
			//printf("%i\n", [strNumber intValue]);
			if (intFibonaci<40)
			{
				NSLog(@"Fibonacci: %@",FibonacciWord(intFibonaci));
				NSString *string = FibonacciWord(intFibonaci);
				NSError *error = NULL;
				NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:strPatron options:NSRegularExpressionCaseInsensitive error:&error];
				NSUInteger numberOfMatches = [regex numberOfMatchesInString:string options:0 range:NSMakeRange(0, [string length])];
				NSLog(@"Patrones repetidos: %lu",numberOfMatches);
			}
		}
	}
	else{
		printf("Error, the program requiere two parameters. The first is the Fibonacci number, and the second is the pattern\n");
	}
	
	return 0;
}


NSString* FibonacciWord(int number){
		if(number ==0)
			return @"0";
		if (number ==1)
		{
			return @"1";
		}else
			return [NSString stringWithFormat: @"%@%@", FibonacciWord(number -1), FibonacciWord(number-2)];
			//[FibonacciWord(number -1) + FibonacciWord(number-2);
		

	}
