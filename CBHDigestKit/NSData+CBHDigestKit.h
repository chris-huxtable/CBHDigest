//
//  NSData+CBHDigestKit.h
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

@import Foundation.NSData;

#include "CBHDigestTypes.h"


NS_ASSUME_NONNULL_BEGIN


/** Adds digest methods to `NSData`.
 *
 * @author      Chris Huxtable <chris@huxtable.ca>
 * @version     1.0
 */
@interface NSData (CBHDigestKit)


#pragma mark - Secure Hash Algorithm 2

/**
 * @name Secure Hash Algorithm 2
 */

/** This method digests the data of the receiver using SHA224.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)sha224;

/** This method digests the data of the receiver using SHA256.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)sha256;

/** This method digests the data of the receiver using SHA384.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)sha384;

/** This method digests the data of the receiver using SHA512.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)sha512;


#pragma mark - Secure Hash Algorithm 1

/**
 * @name Secure Hash Algorithm 1
 */

/** This method digests the data of the receiver using SHA1.
 *
 * @warning		This algorithm is obsolete, is no longer considered secure, and should not be used.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)sha1;


#pragma mark - Message-Digest Algorithm

/**
 * @name Message-Digest Algorithm
 */

/** This method digests the data of the receiver using MD2.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 *
 * @warning		This algorithm is obsolete, is no longer considered secure, and should not be used.
 */
- (nullable NSData *)md2;

/** This method digests the data of the receiver using MD4.
 *
 * @warning		This algorithm is obsolete, is no longer considered secure, and should not be used.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)md4;

/** This method digests the data of the receiver using MD5.
 *
 * @warning		This algorithm is obsolete, is no longer considered secure, and should not be used.
 *
 * @return		A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)md5;


#pragma mark - Runtime Selected Algorithm

/**
 * @name Runtime Selected Algorithm
 */

/** This method digests the data of the receiver using the provided algorithm.
 *
 * @param algorithm		The algorithm to use.
 *
 * @return				A NSData object containing the raw digest or nil if the receiver is empty.
 */
- (nullable NSData *)digestUsingAlgorithm:(CBHDigestAlgorithm)algorithm;


@end

NS_ASSUME_NONNULL_END
