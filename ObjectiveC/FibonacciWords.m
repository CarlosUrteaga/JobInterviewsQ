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

int intCharlenght;
NSMutableArray *mArray;
NSString* FibonacciWord(int number);


int main (int argc, const char * argv[]){

	if (argc ==3){
		NSString *strNumber = [NSString stringWithUTF8String:argv[1]];
		NSString *strPatron = [NSString stringWithUTF8String:argv[2]];
		mArray = [[NSMutableArray alloc]init];

		[mArray addObject: @"0"];
		[mArray addObject: @"1"];
		intCharlenght = 2;

		int intFibonaci;
		if ([strNumber intValue] != 0)
		{
			intFibonaci = [strNumber intValue];
			//printf("%i\n", [strNumber intValue]);
			if (intFibonaci<40)
			{	
				NSString * strFibonnacci = [[NSString alloc] initWithString:FibonacciWord(intFibonaci)];

				
				
				if ([strPatron length] < 100000 && [strFibonnacci length]>= [strPatron length])
				{
						//NSLog(@"Fibonacci: %@",strFibonnacci);

					//printf("%s", [strFibonnacci UTF8String]);
					//NSString *firstSection = [strFibonnacci substringWithRange:NSMakeRange(0,[strFibonnacci length]/4)];
					//NSString *secondSection = [strFibonnacci substringWithRange:NSMakeRange([strFibonnacci length]/4,[strFibonnacci length]/2)];
					//printf("%s", [strFibonnacci UTF8String]);
					//printf("%s", [secondSection UTF8String]);
				
					const char *c = [strFibonnacci UTF8String];

					for (int i = 0; i < [strFibonnacci length]/5; ++i)
					{
						printf("%c", c[i]);

					}
					for (int i = [strFibonnacci length]/5; i < [strFibonnacci length]/5; ++i)
					{
						printf("%c", c[i]);

					}
					for (int i = [strFibonnacci length]*2/5; i < [strFibonnacci length]/5; ++i)
					{
						printf("%c", c[i]);

					}
					for (int i = [strFibonnacci length]*3/5; i < [strFibonnacci length]/5; ++i)
					{
						printf("%c", c[i]);

					}
					for (int i = [strFibonnacci length]*4/5; i < [strFibonnacci length]/5; ++i)
					{
						printf("%c", c[i]);

					}
					printf("\n");
					//Exception
					NSError *error = NULL;
					//Regular expression
					NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:strPatron options:NSRegularExpressionCaseInsensitive error:&error];
					//Evaluation.
					NSUInteger numberOfMatches = [regex numberOfMatchesInString:strFibonnacci options:0 range:NSMakeRange(0, [strFibonnacci length])];
					NSLog(@"Patrones repetidos: %lu",numberOfMatches);
				}else{
					NSLog(@"Error: Fibonacci Word is less than p");
				}
				
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
			return [NSString stringWithFormat: @"%@", [mArray objectAtIndex:0]];
		if (number ==1)
		{
			return [NSString stringWithFormat: @"%@", [mArray objectAtIndex:1]];
		}
		else
		if (number<[mArray count] )
		{
			return [NSString stringWithFormat: @"%@", [mArray objectAtIndex:number]];	
		}else{

			NSString * strFibonnacci = [NSString stringWithFormat: @"%@%@", FibonacciWord(number -1 ), FibonacciWord(number -2)];
			
			[mArray insertObject: strFibonnacci atIndex: number];
			strFibonnacci =nil;
			[strFibonnacci dealloc];
			return [NSString stringWithFormat: @"%@", [mArray objectAtIndex:number]];	
		}
		

	}
