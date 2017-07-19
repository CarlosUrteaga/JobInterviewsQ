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
//Recursive function
bool gameOfSigns (NSMutableArray * m, NSString * d);

//function to get the Start position

void getS (NSMutableArray * m, NSString* strS, int* x);
int main (int argc, const char * argv[])
{
	NSMutableArray *myArray =[[NSMutableArray alloc] init];
	unsigned ConsecutiveEnterCount = 0;
	char buffer[1024];
	NSMutableString *tmp;
	bool boolInput = false;
	for (;;) {
		if (fgets(buffer, sizeof(buffer), stdin) == NULL) {
			break;  // handle error or EOF
		}
		if (buffer[0] == '\n') {
			ConsecutiveEnterCount++;
	    	if (ConsecutiveEnterCount >= 2 /* or 1, not clear on OP intent */) {
			break;
			}
		}
		else 
			ConsecutiveEnterCount = 0;
		if (buffer[0] !='\n')
		{

		  		//MAPA
			tmp = [NSMutableString stringWithFormat:@"%s", buffer];
			NSArray *items = [tmp componentsSeparatedByString:@","];
			NSMutableArray *mutable = [NSMutableArray arrayWithArray:items];
			for (id obj in items)
			{
				tmp = [NSMutableString stringWithFormat:@"%@", obj];
				[tmp replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"m:" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"d:" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"\"" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"]" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"[" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				[tmp replaceOccurrencesOfString:@"\n" withString:@"" options:0 range:NSMakeRange(0, tmp.length)];
				if ([tmp length]!=0)
				{
					[myArray addObject: tmp];
				}
			}

		}

	}
	NSString *strTemp;
	int intMapaSize;
	//check the same lenght
	strTemp = [myArray objectAtIndex:0];
	intMapaSize = [strTemp length];
	strTemp= [myArray lastObject];
	[myArray removeLastObject];

	if ([myArray count] == intMapaSize)
	{
		if (gameOfSigns(myArray,strTemp))
		{
			printf("true\n");
		}
		else{
			printf("false\n");
		}
	}else{
		printf("No es igual\n");
	}
		return 0;
	
}

bool gameOfSigns (NSMutableArray * m, NSString * d){

		int intPos[2];
		getS(m, @"S",intPos);
		if ([d isEqual: @"R"])
		{
			if (intPos[0]<[m count]-1)
			{
				if ([@"F" isEqual: [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)]]){
					return true;
				}
				else{ 
					NSMutableString *strTmp;
					/*
					If the direction are direct, just chance this if, 
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"-"])
					{
						d = [[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)];
					}
					*/
					//for clock and counterclock solution
					if ([[[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)] isEqual: @"L"])
					{
						// Solution for direct instruction
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"U";

					}
					if ([[[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)] isEqual: @"R"])
					{
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"D";
					}
					strTmp = [[NSMutableString alloc]initWithString:[[m objectAtIndex: intPos[1]] stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];

					NSString *strTmp2 = [strTmp stringByReplacingCharactersInRange: NSMakeRange(intPos[0]+1, 1) withString: @"S"];
					
					strTmp = [[NSMutableString alloc]initWithString:strTmp2];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					//NSLog(@"%@",m);
					return gameOfSigns(m,d);

				}
			}
			else
				return false;
			
		}else 
		if ([d isEqual: @"L"])
		{

			if (intPos[0]>0)
			{
				if ([@"F" isEqual: [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]-1, 1)]])
					return true;
				else{ 
					NSMutableString *strTmp;
					/*
					If the direction are direct, just chance this if, 
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"-"])
					{
						d = [[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)];
					}
					*/
					//for clock and counterclock solution
					if ([[[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]-1, 1)] isEqual: @"L"])
					{
						// Solution for direct instruction
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"D";

					}
					if ([[[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]-1, 1)] isEqual: @"R"])
					{
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"U";
					}
					strTmp = [[NSMutableString alloc]initWithString:[[m objectAtIndex: intPos[1]] stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];

					NSString *strTmp2 = [strTmp stringByReplacingCharactersInRange: NSMakeRange(intPos[0]-1, 1) withString: @"S"];
					
					strTmp = [[NSMutableString alloc]initWithString:strTmp2];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					//NSLog(@"%@",m);
					return gameOfSigns(m,d);
				}
			}
			else
				return false;
			
		}else
		if ([d isEqual: @"U"])
		{
			if (intPos[1]>0)
			{
				if ([@"F" isEqual: [[m objectAtIndex: intPos[1]-1] substringWithRange:NSMakeRange(intPos[0], 1)]])
					return true;
				else{ 
					NSMutableString *strTmp;
					/*
					If the direction are direct, just chance this if, 
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"-"])
					{
						d = [[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)];
					}
					*/
					//for clock and counterclock solution
					if ([[[m objectAtIndex: intPos[1]-1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"L"])
					{
						// Solution for direct instruction
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"L";

					}
					if ([[[m objectAtIndex: intPos[1]-1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"R"])
					{
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"R";
					}
					strTmp = [[NSMutableString alloc]initWithString:[[m objectAtIndex: intPos[1]] stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					//
					intPos[1]--;
					strTmp = [[NSMutableString alloc]initWithString:[m objectAtIndex: intPos[1]]];//stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];
					NSString *strTmp2 = [strTmp stringByReplacingCharactersInRange: NSMakeRange(intPos[0], 1) withString: @"S"];
					strTmp = [[NSMutableString alloc]initWithString:strTmp2];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					return gameOfSigns(m,d);
				}
			}
			else
				return false;
			
		}else
		if ([d isEqual: @"D"])
		{
			if (intPos[1]<[m count]-1)
			{
				if ([@"F" isEqual: [[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)]])
					return true;
				else{ 
					NSMutableString *strTmp;
					/*
					If the direction are direct, just chance this if, 
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"-"])
					{
						d = [[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)];
					}
					*/
					//for clock and counterclock solution
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"L"])
					{
						// Solution for direct instruction
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"R";

					}
					if ([[[m objectAtIndex: intPos[1]+1] substringWithRange:NSMakeRange(intPos[0], 1)] isEqual: @"R"])
					{
						//d = [[m objectAtIndex: intPos[1]] substringWithRange:NSMakeRange(intPos[0]+1, 1)];
						d = @"L";
					}
					strTmp = [[NSMutableString alloc]initWithString:[[m objectAtIndex: intPos[1]] stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					//
					intPos[1]++;
					strTmp = [[NSMutableString alloc]initWithString:[m objectAtIndex: intPos[1]]];//stringByReplacingCharactersInRange:NSMakeRange(intPos[0], 1) withString:@"-"]];
					NSString *strTmp2 = [strTmp stringByReplacingCharactersInRange: NSMakeRange(intPos[0], 1) withString: @"S"];
					strTmp = [[NSMutableString alloc]initWithString:strTmp2];
					[m removeObjectAtIndex: intPos[1]];
					[m insertObject:strTmp atIndex:intPos[1]];
					return gameOfSigns(m,d);
				}
			}
			else
				return false;
			
		}
		return	false;
} 


void  getS (NSMutableArray * m, NSString* strS, int* x){

	int length = [m count];
	int i=0;
	while( i<length){
		NSMutableString *tmp = [m objectAtIndex: i];
		//NSLog(@"%@",tmp);
		NSRange range =[tmp rangeOfString: strS options:NSCaseInsensitiveSearch];
		if (range.location < 1000) {
			x[0] = range.location;
			x[1] = i;
		}
		i++;
	}
}
