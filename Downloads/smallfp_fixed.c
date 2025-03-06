/* This is the only file you will be editing.
 * - Copyright of Starter Code: Prof. Kevin Andrea, George Mason University.  All Rights Reserved
 * - Copyright of Student Code: You!  
 * - Restrictions on Student Code: Do not post your code on any public site (eg. Github).
 * -- Feel free to post your code on a PRIVATE Github and give interviewers access to it.
 * -- You are liable for the protection of your code from others.
 * - ASCII Art Adapted from Regular Calculator by Jeremy J. Olson
 * -- Original File: https://www.asciiart.eu/electronics/calculators
 * - Date: Jan 2025
 */

/* CS367 Project 2, Fall Semester, 2025
 * Fill in your Name, GNumber, and Section Number in the following comment fields
 * Name:
 * GNumber:
 * Section Number: CS367-00_             (Replace the _ with your section number)
 */

/* _____________________
  |  _________________  |
  | |     MUAN    3.25| |
  | |_________________| |
  |  ___ ___ ___   ___  |
  | | 7 | 8 | 9 | | + | |
  | |___|___|___| |___| |
  | | 4 | 5 | 6 | | - | |
  | |___|___|___| |___| |
  | | 1 | 2 | 3 | | x | |
  | |___|___|___| |___| |
  | | . | 0 | = | | V | |
  | |___|___|___| |___| |
  |_____________________|
 */

#include <stdio.h>
#include <stdlib.h>
#include "common_structs.h"
#include "common_definitions.h"
#include "common_functions.h"
#include "smallfp.h"

#define SIGN_BIT 10
#define EXP_MASK 0x3C0  // 4 bits (1111 0000 0000)
#define FRAC_MASK 0x3F   // 6 bits (0000 0011 1111)
#define MAX_EXP 15
#define BIAS 7
// Feel free to add many Helper Functions, Consts, and Definitions!

// ----------Public API Functions (write these!)-------------------

/* toSmallFP - Converts a Number Struct (whole and fraction parts) into a SmallFP Value
 *  - number is managed by MUAN, DO NOT FREE number.
 *    - You may change the contents of number, but do not free it.
 *  - Follow the project documentation for this function.
 * Return the SmallFP Value or any legal SmallFP NaN representation if number is NULL.
 */
// Helper function to pack S, exp, frac into smallfp_s
smallfp_s packSmallFP(int sign, int exp, int frac) {
  return (sign << SIGN_BIT) | ((exp & 0xF) << 6) | (frac & FRAC_MASK);
}
// 1. toSmallFP - Converts Number_s to smallfp_s
smallfp_s toSmallFP(Number_s *number) {
  if (!number) return packSmallFP(0, MAX_EXP, 1); // NaN

  if (number->is_nan) return packSmallFP(0, MAX_EXP, 1); // NaN
  if (number->is_infinity) return packSmallFP(number->is_negative, MAX_EXP, 0); // +/- Infinity

  if (number->whole == 0 && number->fraction == 0) {
      return packSmallFP(number->is_negative, 0, 0); // Zero
  }

  int sign = number->is_negative;
  int whole = number->whole;
  int fraction = number->fraction;

  int exp = BIAS; // Exponent starts at bias

  // Normalize: Shift left to make whole part fit the form 1.x
  while (whole > 1) {
      fraction >>= 1;
      if (whole & 1) fraction |= 0x8000;
      whole >>= 1;
      exp++;
  }

  // Adjust the mantissa
  int frac = (fraction >> 10) & FRAC_MASK; // Get top 6 bits

  if (exp >= MAX_EXP) return packSmallFP(sign, MAX_EXP, 0); // Overflow to Infinity

  if (exp <= 0) return packSmallFP(sign, 0, 0); // Underflow to Zero

  return packSmallFP(sign, exp, frac);
}


/* toNumber - Converts a SmallFP Value into a Number Struct (whole and fraction parts)
 *  - number is managed by MUAN, DO NOT FREE or re-Allocate number.
 *    - It is already allocated.  Do not call malloc/calloc for number.
 *  - Follow the project documentation for this function.
 *  If the conversion is successful, return 0. 
 *  - If number is NULL, return -1.
 */
// 2. toNumber - Converts smallfp_s to Number_s
int toNumber(Number_s *number, smallfp_s value) {
  if (!number) return -1;

  number->is_negative = (value >> SIGN_BIT) & 1;
  int exp = (value >> 6) & 0xF;
  int frac = value & FRAC_MASK;

  if (exp == MAX_EXP) {
      if (frac == 0) {
          number->is_infinity = 1;
          number->is_nan = 0;
      
  return 0;
} else {
          number->is_nan = 1;
      }
      return 0;
  }

  if (exp == 0) {
      number->whole = 0;
      number->fraction = 0;
      return 0; // Zero
  }

  exp -= BIAS;

  number->whole = 1 << exp;
  number->fraction = frac << 10;

  return 0;
}


/* mulSmallFP - Performs an operation on two SmallFP values
 *  - Follow the project documentation for this function.
 * Return the resulting smallfp_s value
 */
// 3. mulSmallFP - Multiplies two smallfp_s values
smallfp_s mulSmallFP(smallfp_s val1, smallfp_s val2) {
  int sign1 = (val1 >> SIGN_BIT) & 1;
  int exp1 = (val1 >> 6) & 0xF;
  int frac1 = (val1 & FRAC_MASK) | 0x40;

  int sign2 = (val2 >> SIGN_BIT) & 1;
  int exp2 = (val2 >> 6) & 0xF;
  int frac2 = (val2 & FRAC_MASK) | 0x40;

  if (exp1 == MAX_EXP || exp2 == MAX_EXP) return packSmallFP(sign1 ^ sign2, MAX_EXP, 0);

  int sign = sign1 ^ sign2;
  int exp = exp1 + exp2 - BIAS;

  int product = frac1 * frac2;
  if (product & 0x8000) {
      product >>= 1;
      exp++;
  }

  if (exp >= MAX_EXP) return packSmallFP(sign, MAX_EXP, 0);
  if (exp <= 0) return packSmallFP(sign, 0, 0);

  return packSmallFP(sign, exp, (product >> 10) & FRAC_MASK);
}

/* addSmallFP - Performs an operation on two SmallFP values
 *  - Follow the project documentation for this function.
 * Return the resulting smallfp_s value
 */
// 4. addSmallFP - Adds two smallfp_s values
smallfp_s addSmallFP(smallfp_s val1, smallfp_s val2) {
  int sign1 = (val1 >> SIGN_BIT) & 1;
  int exp1 = (val1 >> 6) & 0xF;
  int frac1 = (val1 & FRAC_MASK) | 0x40;

  int sign2 = (val2 >> SIGN_BIT) & 1;
  int exp2 = (val2 >> 6) & 0xF;
  int frac2 = (val2 & FRAC_MASK) | 0x40;

  if (exp1 < exp2) {
      frac1 >>= (exp2 - exp1);
      exp1 = exp2;
  } else {
      frac2 >>= (exp1 - exp2);
  }

  int result_frac = (sign1 == sign2) ? (frac1 + frac2) : (frac1 - frac2);
  if (result_frac & 0x80) {
      result_frac >>= 1;
      exp1++;
  }

  if (exp1 >= MAX_EXP) return packSmallFP(sign1, MAX_EXP, 0);

  return packSmallFP(sign1, exp1, result_frac & FRAC_MASK);
}

/* opSmallFP - Performs an operation on two SmallFP values
 *  - Follow the project documentation for this function.
 * Return the resulting smallfp_s value
 */
// 5. subSmallFP - Subtracts two smallfp_s values
smallfp_s subSmallFP(smallfp_s val1, smallfp_s val2) {
  return addSmallFP(val1, negSmallFP(val2));
}

/* negSmallFP - Negates a SmallFP Value.
 *  - Follow the project documentation for this function.
 * Return the resulting SmallFP Value
 */
// 6. negSmallFP - Negates a smallfp_s value
smallfp_s negSmallFP(smallfp_s value) {
  return value ^ (1 << SIGN_BIT);
}
