---
title: "Cache Review"
date: "5-20-2024"
author: "Chuck Garcia"
return-url: 'dir.html'
return-text: '← Return'
---  

# Cache Review
**Outline:**

- Describe and explain the purpose of caches
- Briefly explain cache miss and cache hit
- Explain cache miss and the time penalty. What are the two components that cache miss penalty is dependent on?
- Explain the effects of cache on performance (performance equation)
- Explain and describe cache organization
- Identify and describe the different cache optimization techniques
- Describe coherence protocols

## Cache Functionality and Purpose

Cache memory is a small but fast type of system memory that is situated closely to the processor and inside the die. Caches are a solution to optimizing execution time by reducing the time it takes to fulfill a memory request.

## Cache Miss Types - 3 C's

There are three types of cache misses: Compulsory, conflict, and capacity.

### Compulsory Miss

A compulsory miss is a miss that occurs when trying to access data for the first time. It can be thought of as being part of the startup time for some algorithm or process.

### Conflict Miss

A conflict miss occurs when a block is needed which existed in the cache before, but was evicted in favor of another block that had to be mapped to the same slot.

### Capacity Miss

A capacity miss occurs when the cache has no capacity left. [^pandoc]
[^pandoc]:
  {-} [Note] The difference between conflict and compulsory is that a conflict miss may occur when the cache still may otherwise have capacity to retain data elements. It is the folly of the selected method of organization, not limited capacity.

## Cache Misses

The time required to service a cache miss is dependent upon the bandwidth and latency of the system.

- Latency is the total time it takes to bring the data from main memory. This time is dominated primarily by the distance RAM is from cache and by the sheer amount of time RAM takes to retrieve data from its banks.
- Bandwidth refers to the amount of work done per unit time. Bandwidth is dictated by bus size.

As a result of misses in cache, execution of instructions must be stalled until the data is made available.

## Average Memory Access Time (AMAT) Equation

Let `h` be the hit rate, `m` the miss rate, `t_m` be the time it takes to service a miss, and `t_h` be the time it takes to service a hit.

Intuitively, the average cost for moving data into the registers is the average number of times we have a hit multiplied by the time it takes to retrieve it from cache, plus the average number of misses multiplied by the time it takes to service the miss, plus the time it took to check if it was a hit.

Formulaically, this is:  
`AMAT = h * t_h + m * (t_m + t_h)`

But we know that `h = 1 - m`. So:  
`AMAT = (1 - m) * t_h + m * (t_m + t_h)`  
`AMAT = t_h - m * t_h + m * t_h + m * t_m`  
`AMAT = t_h - m * t_m`

# Cache Organization

## Where a Block is Found

When indexing into the cache for a single byte, the address identifies where in the cache to look for it.

- Cache is organized into fixed-sized byte segments called a *cache line* or *block*.
- To retrieve a byte from cache, we index into a cache line using the *block offset*.
- Block offset is identified by the lower bits of the address.
- Each cache line is identified via a tag which is the upper bits of the address.
- Cache lines are arranged into sets. These sets correspond to the middle bits of the address.

The number of bits used to identify which set leaves us with three different possible cases for cache organization: N-way set associative, direct mapped, and fully associative.

### Direct Mapped

In direct mapped caches, the number of bits used for the tag are zero, and the number of bits for the set is the upper and middle.
Pros:

- Causes cache lines to be directly mapped into the same position in cache.
Cons:
- Limited associativity exhibited by direct mapped caches can lead to cache conflict misses.

### Fully Associative

In fully associative caches, the set bits are none and the upper and middle bits are used only for the tag. The result of this is that cache lines can be placed anywhere in the cache.
Cons:

- Increased execution time since a linear search for the tag corresponding to the desired byte must be carried out.

### N-Way Set Associative

N-way set associative caches use a combination of direct mapping and fully associative mapping. The middle bits of the address determine the set, and the upper bits determine the tag. Each set can hold up to N cache lines, allowing for more flexibility in placement compared to direct mapped caches.

## How a block is found:
To find a block in cache, we first index into the correct set, and search for a tag mach.
<!-- [Alt text](/home/chuckg/Notes/comp-arch/cache-notes/address-and-cache-org-bits.png)
 -->
