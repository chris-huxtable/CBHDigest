//  NSData+CBHHexadecimal.h
//  CBHDigestKit
//
//  Created by Christian Huxtable, July 2013.
//  Copyright (c) 2013, Christian Huxtable <chris@huxtable.ca>
//
//  Permission to use, copy, modify, and/or distribute this software for any
//  purpose with or without fee is hereby granted, provided that the above
//  copyright notice and this permission notice appear in all copies.
//
//  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
//  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
//  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
//  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
//  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
//  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
//  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#import "NSData+CBHHexadecimal.h"

@import Foundation.NSScanner;
@import Foundation.NSCharacterSet;

#import "_CBHHexadecimal.h"


@implementation NSData (CBHHexadecimal)

#pragma mark - Factories

+ (instancetype)dataWithHexString:(NSString *)string
{
	return [[NSData alloc] initWithHexString:string];
}


#pragma mark - Initializers

- (instancetype)initWithHexString:(NSString *)string
{
	NSUInteger inputLength = [string length];

	/// Return early if string is empty
	if ( inputLength == 0 ) { return ( self = [[NSData alloc] init] ); }

	/// Convert to c string
	const char *input = [[string dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES] bytes];

	/// Prepare Buffer
	size_t bufferSize = (inputLength / 2) + 1;
	uint8_t *buffer = (uint8_t *)malloc(bufferSize);

	/// Process Hex
	size_t outBytes = CBHData_fromHexString(input, inputLength, buffer, bufferSize);

	/// Convert to NSData and cleanup. Copy to minimize memory use.
	self = [[NSData alloc] initWithBytes:buffer length:outBytes];
	free(buffer);

	return self;
}


#pragma mark - Encoding

- (NSString *)encodeAsHexadecimal
{
	const uint8_t *buffer = (const uint8_t *)[self bytes];
	if ( buffer == nil ) { return @""; }

	NSUInteger length = [self length];
	NSMutableString *hexString = [NSMutableString stringWithCapacity:length + length];

	for (NSUInteger i = 0; i < length; ++i)
	{
		[hexString appendFormat:@"%02x", (unsigned int)buffer[i]];
	}

	return [hexString copy];
}

- (NSString *)encodeAsCapitalizedHexadecimal
{
	const uint8_t *buffer = (const uint8_t *)[self bytes];
	if ( buffer == nil ) { return @""; }

	NSUInteger length = [self length];
	NSMutableString *hexString = [NSMutableString stringWithCapacity:length + length];

	for (NSUInteger i = 0; i < length; ++i)
	{
		[hexString appendFormat:@"%02X", (unsigned int)buffer[i]];
	}

	return hexString;
}

@end
