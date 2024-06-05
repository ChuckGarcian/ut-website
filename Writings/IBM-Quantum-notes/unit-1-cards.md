---
title: "Unit 1 - Study Cards"
return-url: 'dir.html'
return-text: '← Return'
---


## What is probabilistic state? 
'Probabilistic state' is a vehicle for reasoning about the state of a system in the presence of uncertainty.

## What is 'ket'
Ket is a basis vector that describes a state. Said another way, it is 1 in the entry corresponding to $a$ and 0 for all other entries, denoted by $|a\rangle$.

$$
\Sigma = (ON, OFF) \implies 
|ON\rangle = 
\begin{pmatrix}
  1 \\
  0
\end{pmatrix},
|OFF\rangle =
\begin{pmatrix}
  0 \\
  1
\end{pmatrix}
$$

## What are Classical Operations
Consider a function $f$ defined as follows:

$$f: \Sigma \rightarrow \Sigma $$

This function $f$ is known as a **classical operation**. It transforms any classical state $a \in \Sigma$ into another state $f(a)$, where $f(a) \in \Sigma$.

## What is a way we represent classical operations?
Let $f$ be a function and $a \in \Sigma$ where $\Sigma$ is a set of states. Then, the classical operation $f(a)$ can be expressed as a transformation on the basis vector $|a\rangle$.

Such a transformation a matrix-vector multiplication:

$$
M |a\rangle = |f(a) \rangle, \forall a \in \Sigma
$$
