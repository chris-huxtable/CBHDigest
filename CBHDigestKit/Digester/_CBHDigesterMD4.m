//  _CBHDigesterMD4.m
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

#import "_CBHDigesterMD4.h"

@import CommonCrypto.CommonDigest;


NS_ASSUME_NONNULL_BEGIN

@interface _CBHDigesterMD4 ()
{
	CC_MD4_CTX _context;
}
@end

NS_ASSUME_NONNULL_END


@implementation _CBHDigesterMD4

#pragma mark - Initializers

- (instancetype)init
{
	if ( (self = [super initWithAlgorithm:CBHDigestAlgorithm_MD4]) )
	{
		CC_MD4_Init(&_context);
	}

	return self;
}


#pragma mark - Operations

- (void)updateWithBytes:(uint8_t *)bytes ofLength:(NSUInteger)length
{
	NSAssert(!_isFinished, @"Digester is already finished!");
	CC_MD4_Update(&_context, bytes, (CC_LONG)length);
}

- (NSData *)finish
{
	NSAssert(!_isFinished, @"Digester is already finished!");
	_isFinished = YES;

	unsigned char hash[CC_MD4_DIGEST_LENGTH];
	CC_MD4_Final(hash, &_context);

	return [NSData dataWithBytes:hash length:CC_MD4_DIGEST_LENGTH];
}

@end
