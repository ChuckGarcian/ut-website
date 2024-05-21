---
title: "Floating Point Review"
date: "5-20-2024"
author: "Chuck Garcia"
return-url: 'dir.html'
return-text: '← Return'
---  

# Floating Point

## FP - Intro:  
a. Given a value fractional value: $d_md_{m-1}...d_0 . d_0...d_n$
b. We would like to be able to represent it in binary
c. Floating-Point representation is one way in which we can achieve this

## FP - Format:
a. Floating point numbers allow us to represent decimal values of the form:
   $V = (-1)^s \times M \times 10^e$
   - $V$ : value
   - $M$ : Fractional (significand) part of value (e.g 1.123)
   - $s$ : Sign 
   - $e$ : Exponent part

## FP - Bit Layout:

| s   | e² | e¹ | e⁰ | f³ | f² | f¹ | f⁰ |
|-----|----|----|----|----|----|----|---|

a. Single Precision:
   - 32 bit width: 
     - float in C
b. Double Precision:
   - 64 bit width
     - double in C

## Preliminary Remark:
a. Floating point is a representation that facilitates the encoding of 
   fractional decimal values that are in scientific notation form. 
   - e.g $23.12 \times 10^1$
b. All decimal values that are encoded, are encoded such that only 1 digit   
   left of the decimal point.

## FP - Encoding Cases:
a. The arrangement of bits in a bit representation, effect the way we treat 
   floating point:
   - 3 different Cases:
     1. Normalized:
        - If the exponent field is not all zeros and not all ones, then the 
          floating point is said to be **normalized**.
     2. Denormalized:
        - If the exponent field is all zeros, then the floating point value is 
          said to be denormal.
     3. Special:
        - If the exponent field is all 1's, then the floating point value is a 
          special value (e.g infinity, or NaN).
  
### 1. Normalized:
- Notice this means normalized fractional binary values (e.g 1.1010) can all 
  only ever start with a 1 or 0. †
  
- A floating point value is normalized when the binary value starts with 1.
  - If a value starts with a 0 (e.g 0.101) we can normalize a value by 
    shifting the binary point left by multiplying by $2^{-1}$.
  
- Since all values that are normalized must start with a one, we can simply 
  not store it in the bit field and make it implied.
  
- A FP is said to normalized, when value it encodes has a single leading 
  1 before the decimal point. 
  - Example: 
    - 1.110 - normalized
    - 11.110 - not normalized
†: unlike base-10 a fractional decimal value can take any value 0 through 9

### 2. Denormalized:
- When a floating point is denormal, there is no implied 1. 
- Allows us to represent the values closest to zero and zero itself.

# Multiplication 

## Basics (Assuming A and B are normalized values):
- (A × B):
  1. Multiply the significands including the implicit 1.
  2. Add the exponents.
  3. Normalize the product.
  4. Round to ensure the product fits the floating-point format.

## Example:
- Suppose A and B are floating point values with a significand of 'p' bits long.
- The significands of A and B are multiplied:
  - The final product will initially be 2p bits in width due to the multiplication.
  - To fit the floating-point format, the product must be truncated back to 'p' bits.

## Truncation in Multiplication:
1. **Adjustment**: Reduce the 2p-bit product to 'p' bits, deciding which bits 
                   to keep.
2. **Rounding**: Apply a rounding strategy (e.g., round to nearest, toward 
                 zero) to minimize truncation error.
3. **Overflow and Underflow**: Check and handle cases where the product is 
                               too large (overflow) or too small (underflow).
4. **Normalization**: Adjust the significand and exponent so the significand falls within the expected range.
5. **Sign Bit**: Determine the sign of the result using the XOR of the operands' sign bits.