//  NSData+Hexadecimal.h
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

@import Foundation.NSData;
@import Foundation.NSString;


NS_ASSUME_NONNULL_BEGIN

/** Adds Data to hex conversion to `NSData`
 *
 * @author      Chris Huxtable <chris@huxtable.ca>
 * @version     1.0
 */
@interface NSData (CBHHexadecimal)


#pragma mark - Factories

/** Converts hexadecimal encoded data into an NSData object.
 *
 * This implementation makes every effort to handle bad data by ignoring it.
 *
 * @warning If the string contains a `0x` prefix the resulting data will have an extra `00` prefixed to it as the `0` on `0x` will be considered `00`.
 *
 * @return  A `NSData` object representation of the hexadecimal string.
 */
+ (instancetype)dataWithHexString:(NSString *)string;


#pragma mark - Initializers

/** Converts hexadecimal encoded data into an NSData object.
 *
 * This implementation makes every effort to handle bad data by ignoring it.
 *
 * @warning If the string contains a `0x` prefix the resulting data will have an extra `00` prefixed to it as the `0` on `0x` will be considered `00`.
 *
 * @return  A `NSData` object representation of the hexadecimal string.
 */
- (instancetype)initWithHexString:(NSString *)string;


#pragma mark - Encoding

/** Coverts the receivers data into a hexadecimal representation.
 *
 * @warning If the receiver is empty an empty string is returned.
 *
 * @return  A String containing the hexadecimal representation.
 */
- (NSString *)encodeAsHexadecimal;

/** Coverts the receivers data into a capitalized hexadecimal representation.
 *
 * @warning If the receiver is empty an empty string is returned.
 *
 * @return  A String containing the hexadecimal representation.
 */
- (NSString *)encodeAsCapitalizedHexadecimal;

@end

NS_ASSUME_NONNULL_END
