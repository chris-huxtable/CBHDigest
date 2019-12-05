//  CBHDigester.m
//  CBHDigestKit
//
//  Created by Christian Huxtable, April 2019.
//  Copyright (c) 2019, Christian Huxtable <chris@huxtable.ca>
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

#import "CBHDigester.h"

#import "_CBHDigesterSHA224.h"
#import "_CBHDigesterSHA256.h"
#import "_CBHDigesterSHA384.h"
#import "_CBHDigesterSHA512.h"

#import "_CBHDigesterSHA1.h"

#import "_CBHDigesterMD2.h"
#import "_CBHDigesterMD4.h"
#import "_CBHDigesterMD5.h"

#define CBH_MUST_SUBCLASS @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)] userInfo:nil];


@interface CBHDigester ()
{
	CBHDigestAlgorithm _algorithm;
}
@end


@implementation CBHDigester


#pragma mark - Factories

+ (NSData *)digestString:(NSString *)string usingEncoding:(NSStringEncoding)encoding andAlgorithm:(CBHDigestAlgorithm)algorithm
{
	return [self digestData:[string dataUsingEncoding:encoding] usingAlgorithm:algorithm];
}

+ (NSData *)digestData:(NSData *)data usingAlgorithm:(CBHDigestAlgorithm)algorithm
{
	CBHDigester *digester = [self digesterUsingAlgorithm:algorithm];
	[digester update:data];
	return [digester finish];
}

+ (NSData *)digestStream:(NSInputStream *)stream usingAlgorithm:(CBHDigestAlgorithm)algorithm
{
	return [self digestStream:stream usingAlgorithm:algorithm withBufferSize:4096];
}

+ (NSData *)digestStream:(NSInputStream *)stream usingAlgorithm:(CBHDigestAlgorithm)algorithm withBufferSize:(NSUInteger)bufferSize
{
	[stream open];

	CBHDigester *digester = [self digesterUsingAlgorithm:algorithm];
	void *buffer = malloc(bufferSize);

	NSInteger length;
	while ( (length = [stream read:buffer maxLength:bufferSize]) > 0 )
	{
		[digester updateWithBytes:buffer ofLength:(NSUInteger)length];
	}

	[stream close];

	free(buffer);
	buffer = nil;

	if ( length < 0 ) { return nil; }
	return [digester finish];
}


#pragma mark - Cluster Factory

+ (instancetype)sha224
{
	return [[_CBHDigesterSHA224 alloc] init];
}

+ (instancetype)sha256
{
	return [[_CBHDigesterSHA256 alloc] init];
}

+ (instancetype)sha384
{
	return [[_CBHDigesterSHA384 alloc] init];
}

+ (instancetype)sha512
{
	return [[_CBHDigesterSHA512 alloc] init];
}

+ (instancetype)sha1
{
	return [[_CBHDigesterSHA1 alloc] init];
}

+ (instancetype)md2
{
	return [[_CBHDigesterMD2 alloc] init];
}

+ (instancetype)md4
{
	return [[_CBHDigesterMD4 alloc] init];
}

+ (instancetype)md5
{
	return [[_CBHDigesterMD5 alloc] init];
}


+ (instancetype)digesterUsingAlgorithm:(CBHDigestAlgorithm)algorithm
{
	if ( algorithm == CBHDigestAlgorithm_SHA256 ) { return [CBHDigester sha256]; }
	if ( algorithm == CBHDigestAlgorithm_SHA384 ) { return [CBHDigester sha384]; }
	if ( algorithm == CBHDigestAlgorithm_SHA512 ) { return [CBHDigester sha512]; }
	if ( algorithm == CBHDigestAlgorithm_SHA224 ) { return [CBHDigester sha224]; }

	if ( algorithm == CBHDigestAlgorithm_SHA1 ) { return [CBHDigester sha1]; }

	if ( algorithm == CBHDigestAlgorithm_MD5 ) { return [CBHDigester md5]; }
	if ( algorithm == CBHDigestAlgorithm_MD4 ) { return [CBHDigester md4]; }
	if ( algorithm == CBHDigestAlgorithm_MD2 ) { return [CBHDigester md2]; }

	@throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Unknown algorithm specified." userInfo:nil];
}


#pragma mark - Initializers

- (instancetype)initWithAlgorithm:(CBHDigestAlgorithm)algorithm
{
	if ( (self = [super init]) )
	{
		_algorithm = algorithm;
		_isFinished = NO;
	}

	return self;
}


#pragma mark - Operations

- (void)update:(NSData *)data
{
	NSAssert(!_isFinished, @"Digester is already finished!");
	[self updateWithBytes:[data bytes] ofLength:[data length]];
}

- (void)updateWithBytes:(const void *)bytes ofLength:(NSUInteger)length
{
	CBH_MUST_SUBCLASS;
}

- (NSData *)finish
{
	CBH_MUST_SUBCLASS;
}


#pragma mark - Properties

@synthesize algorithm = _algorithm;
@synthesize isFinished = _isFinished;

@end
