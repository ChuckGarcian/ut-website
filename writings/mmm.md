---
title: "Matrix Notes"
subtitle: "Notes the fundamentals of the GOTO Algorithm"
date: "01-30-2024"
author: "Chuck Garcia"
author-url: "https://github.com/chuckgarcian"
return-url: '..'
return-text: '← Return home'
header-includes:
  - \usepackage{algorithm2e}
---

In matrix multiplication, there are many ways one might go about implementing an algorithm. At the algorithm abstraction level, any given implementation may not significantly increase or change the computational complexity. However, at the level of hardware, how one orchestrates a matrix multiplication algorithm can significantly alter the runtime, as algorithm implementation strongly corresponds to the amount of hardware utilization.

We can consider the time it takes to carry out matrix multiplication as a function of the total number of operations and the corresponding latency. More specifically, we can imagine the performance time $T$ as a function of $v$, the number of computational operations, $m$, the number of memory operations, and the latency to carry out a memory operation $\delta$: $T(v, m, \delta) = v + m \times \delta$. With this (overly) simplified model of net-performance, it becomes clear that we can optimize runtime via any of the three variables:    

>  - $v$: Optimize the core computations in hardware  
>  - $m$: Decrease the number of memory operations   
>  - $\delta$: Decrease memory access latency.   
We will focus on the last two.    

## How Changing MR and NR effect performance? - Optimizing $m$   
Recall that the micro-kernel is:

\begin{algorithm}
\caption{Micro-Kernel}
\end{algorithm}   

    1. func micro-kernel(B and C)
    2. for p in range (NR)
    3.  Load Column of A → reg2
    4.  Load Row of B  → reg3 
    5.  C += A(0,p) × B(p, 0)

> **Aside:** Note that that line 5 is the mathamatical expression for what should happen. The actual implemenation expands that into FMA - axpy statements

\newpage

While gemm is represented by:  
\begin{algorithm}
\caption{GEMM}
\end{algorithm}   
    1. func gemm(A,B, C)
    1. for i in range (m) // striding by MR every iteration 
    2.  for j in range (n) // Striding by NR every iteration
    3.    Load matrix C → reg1
    4.    → Call micro-kernel
    5.    Store Matrix C → memory.

### MR, NR and Data Movement Amortization - Purpose of blocking :
Strictly speaking, in the context of theoretical peak performance, the loads and stores in **MK** represent extraneous memory operations. Ideally, we would only have to load the entirety of matrices $A$, $B$, and $C$ once, and then perform the computation entirely within the processor. However, in practice, we are subjected to the constraints of both memory bandwidth and register file size and consequently have to partition the matrix operands.

Consider the following loads and stores:      

> - With every iteration of the innermost loop of **GEMM**, a portion of $C$, 
say $C_{ij}$, is loaded into the registers.   

> > - We use it as much as we can before the next iteration, and thereafter the 
partition $C_{i,j}$ is not used again.  

> - In the micro-kernel, column A is used as much as it can be until we can no 
longer use it.     

> - In **MK** line 5, the implementation expands this with consecutive FMA 
operations, one for each scalar element of B and column of A.   

> - In **MK**, we load in a column of A and it stays in the registers until 
line 5 is complete.    

> **Note:** Although note that the total number of elements loaded remains 
constant, it is simply the case that we are bringing more into the registers at 
one time and performing more operations.   

In all of these cases, increasing the block sizes of MR and NR affects the resulting performance, by way of doing more float operations per load.    

------------- 
To understand this more intuitively, we can imagine that by increasing MR and NR, the number of iterations in the main GEMM loop:

    1. for i in range(m) // striding by MR every iteration 
    2.   for j in range(n) // striding by NR every iteration 

decreases in relation to MR and NR. Thus, the total number of loads and stores decreases, but the total number of computations remains the same. This is what we refer to as 'amortizing the data movement cost'.

> **aside:** In a GEMM operation, assuming that matrix data initially exists within memory - in other words, matrix operand data is not produced internally - then there is a minimum number of total memory accesses to carry out the GEMM operation. Such a lower bound is equal to $mn + nk + mk$, as there are $mn + nk + mk$ total data elements in memory.

**Summary:**
- The larger MR and NR are, the more computations can be performed per memory operation.
- The ratio of useful computation to data movement (memory operations like loads and stores) is related to how close to peak performance we are. In other words, the lower the ratio is, the closer to peak performance the system is.
- Hence, by increasing MR and NR, we can keep more of matrix C in the register and make the micro-kernel perform more useful computations.

### Cache Utilization - Using Cache to Reduce Memory Latency:
The algorithm **MK** and **GEMM** currently is able to utilize the register file by to reduce the number of memory operations which results in an increase in net performance, optimizing the $m$ term in our net-performance function $T$. However we still have yet taken into account the $\delta$ term.

In modern systems, memory access latency largely depends on the utilization of the cache hierarchy. Data elements situated in the upper echelons of the hierarchy have much better access latency compared to elements in the lower echelons. As a result, the simple **GEMM** algorithm from above performs much better when the original matrix operands are small enough to be contained entirely within the $L1$ cache (topmost cache). 

In other words, since these smaller matrix operands can fit in the cache, we can perform **GEMM** with a smaller cost of data movement. However, net performance starts to degrade as the matrix operand size gets too large to fit in the $L1$ cache. To combat this degradation, we need 'more degrees of freedom' to more effectively utilize the cache hierarchy. Said another way, we will partition the matrix in such a way that leverages the capacity of each cache level as much as possible while still retaining computation correctness.  

#### GEMM-V2 - A Simple New Version

Let $A$, $B$ and $C$ be matrices of size $m \times k$, $k \times n$ and $m \times n$ respectively. Then the product of A and B can be implemented using GEMM, by partitioning it into submatrices $m \times k$, $k \times n$ and $m \times n$ that fit into the L1 Cache.  

**GEMM-V2**

    1. func Gemm-v2 ():
    2.  for i in range(M, m_c):
    3.   for j in range (n, n_c):
    4.    for p in range ():
    5.     Load Cij → L1 Cache 
    6.     Load Aip → L1 Cache
    7.     Load Bpj → L1 Cache
    8.     → Call Gemm

> **aside:** Note on line 4 that in practice, there is no instruction to load a data element into cache. This operation is typically handled by the cache controller on behalf of the program. We can generally assume that the load is occurring.  
