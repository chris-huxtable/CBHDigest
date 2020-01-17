//  CBHDigestTypes.h
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

@import Foundation.NSString;


NS_ASSUME_NONNULL_BEGIN

typedef NSString* CBHDigestAlgorithm;

extern CBHDigestAlgorithm const CBHDigestAlgorithm_SHA224;
extern CBHDigestAlgorithm const CBHDigestAlgorithm_SHA256;
extern CBHDigestAlgorithm const CBHDigestAlgorithm_SHA384;
extern CBHDigestAlgorithm const CBHDigestAlgorithm_SHA512;

extern CBHDigestAlgorithm const CBHDigestAlgorithm_SHA1;

extern CBHDigestAlgorithm const CBHDigestAlgorithm_MD2;
extern CBHDigestAlgorithm const CBHDigestAlgorithm_MD4;
extern CBHDigestAlgorithm const CBHDigestAlgorithm_MD5;

NS_ASSUME_NONNULL_END
