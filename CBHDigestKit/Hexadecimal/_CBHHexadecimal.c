//  _CBHHexadecimal.c
//  CBHDigestKit
//
//  Created by Christian Huxtable, January 2020.
//  Copyright (c) 2020, Christian Huxtable <chris@huxtable.ca>
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

#include "_CBHHexadecimal.h"

#include <string.h>
#include <stdbool.h>


bool _CBHData_isHex(const char inChar);
const char *_CBHData_nextHex(const char *cursorPtr, const char *startPtr);
uint8_t _CBHData_convertHexCharPtr(const char a, const char b);


size_t CBHData_fromHexString(const char *input, size_t inputLength, uint8_t *output, size_t outputLength)
{
	size_t outBytes = 0;

	/// Move cursors to the end of the input and output.
	const char *in_cursor = input + (inputLength - 1);
	uint8_t *out_cursor = output + outputLength;

	while ( in_cursor >= input )
	{
		/// Find second character
		in_cursor = _CBHData_nextHex(in_cursor, input);
		if ( in_cursor == NULL ) { break; }

		/// Remember second character
		const char b = *in_cursor;
		--in_cursor;

		/// Find first character
		in_cursor = _CBHData_nextHex(in_cursor, input);

		/// Remember first character or set to 0 if at end.
		char a = '0';
		if ( in_cursor != NULL )
		{
			a = *in_cursor;
			--in_cursor;
		}

		/// Check if there is space left in the buffer.
		if ( out_cursor < output ) { return 0; }

		/// Add space for new value
		--out_cursor;
		++outBytes;

		/// Convert characters to byte
		*out_cursor = _CBHData_convertHexCharPtr(a, b);
	}

	/// Move data to beginning of output buffer.
	memmove(output, out_cursor, outBytes);
	return outBytes;
}

bool _CBHData_isHex(const char inChar)
{
	return (( ('0' <= inChar) && (inChar <= '9') ) || ( ('a' <= inChar) && (inChar <= 'f') ) || ( ('A' <= inChar) && (inChar <= 'F') ));
}

const char *_CBHData_nextHex(const char *cursorPtr, const char *startPtr)
{
	while ( cursorPtr > startPtr && !_CBHData_isHex(*cursorPtr) ) { --cursorPtr; }
	if ( cursorPtr < startPtr || !_CBHData_isHex(*cursorPtr) ) { return NULL; }

	return cursorPtr;
}

uint8_t _CBHData_convertHexCharPtr(const char a, const char b)
{
	const char tmp[3] = {a, b, '\0'};
	return (uint8_t)strtol(tmp, NULL, 16);
}
