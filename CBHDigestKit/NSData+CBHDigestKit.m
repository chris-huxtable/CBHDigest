//
//  NSData+CBHDigestKit.m
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
//

#import "NSData+CBHDigestKit.h"

#import "CBHDigester.h"

@implementation NSData (CBHDigestKit)


#pragma mark - Secure Hash Algorithm 2

- (NSData *)sha224
{
	CBHDigester *digester = [CBHDigester sha224];
	[digester update:self];
	return [digester finish];
}

- (NSData *)sha256
{
	CBHDigester *digester = [CBHDigester sha256];
	[digester update:self];
	return [digester finish];
}

- (NSData *)sha384
{
	CBHDigester *digester = [CBHDigester sha384];
	[digester update:self];
	return [digester finish];
}

- (NSData *)sha512
{
	CBHDigester *digester = [CBHDigester sha512];
	[digester update:self];
	return [digester finish];
}


#pragma mark - Secure Hash Algorithm 1

- (NSData *)sha1
{
	CBHDigester *digester = [CBHDigester sha1];
	[digester update:self];
	return [digester finish];
}


#pragma mark - Message-Digest Algorithm

- (NSData *)md2
{
	CBHDigester *digester = [CBHDigester md2];
	[digester update:self];
	return [digester finish];
}

- (NSData *)md4
{
	CBHDigester *digester = [CBHDigester md4];
	[digester update:self];
	return [digester finish];
}

- (NSData *)md5
{
	CBHDigester *digester = [CBHDigester md5];
	[digester update:self];
	return [digester finish];
}


#pragma mark - Runtime Selected Algorithm

- (NSData *)digestUsingAlgorithm:(CBHDigestAlgorithm)algorithm
{
	CBHDigester *digester = [CBHDigester digesterUsingAlgorithm:algorithm];
	[digester update:self];
	return [digester finish];
}

@end
