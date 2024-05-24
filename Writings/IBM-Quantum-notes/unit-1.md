---
title: "Unit 1 - Classical Systems"
date: "05/23/24"
return-url: 'dir.html'
return-text: '← Return'
---

# Notation

- $X$: denotes a system
- $\Sigma$: Denotes the set of classical states system $X$ can take on.# Classical State

# Classical Information

## Classical State

In CS terms, a state is simply a string that is tied to a unique setting of the information in a system. When considering a system $X$, there are instances where our knowledge [^knowledge] of $X$ insists a concrete belief about the system and therefore we can assert it's classical state.

### Classical State Example: Fan

We observe the fan to be spinning. The knowledge of it spinning lets us formulate the belief that it is in the 'ON' state.

However, we can imagine that if a box was placed over the fan, we no longer can extrapolate concrete information about the system. 

## Probabilistic State

In cases where our knowledge of $X$ is uncertain, it's state is best described probabilistically:
  
> "We represent our knowledge of the classical state of $X$ by assigning probabilities to each classical state." \
> \
> ― IBM Quantum Learning [^IBM]

To put it another way: 'Probabilistic state' is a vehicle for reasoning about the state of a system in the presence of uncertainty.

## Probabilistic State Example: Weather
Consider the weather system [^Naming]. Our knowledge tomorrows weather forecast is probabilistic and not certain [^Conceptualize].

Let $\Sigma$ be the different states for tomorrows forecast $X$. Our knowledge of the state of $X$ is described probabilistically: 

$$\left(
\begin{array}{c}
  \text{'sunny'} \\
  \text{'rainy'}
\end{array} 
\right) = 
\left(
\begin{array}{c}
  .6 \\
  .4 \\
\end{array}
\right)$$

The values represent our beliefs of tomorrows forecast. I.E. we belief tomorrows weather is sunny with probability .6 and rainy with probability .4.

## Measuring probabilistic states
The state of weather tomorrow is uncertain until we observe it. Once observed our knowledge is complete and we can be certain about the value of state. Observations that update our knowledge are referred to as 'measurements'.

> "Measurement (observation) changes our knowledge of the system, and therefore changes the probabilistic state that we associate with that system" [^IBM]. \

## Example - Coin

When flipping a coin, it's in a probabilistic state:
$$
\left(
\begin{array} {c}
 \text{'heads'} \\
 \text{'tails'}  
\end{array}
\right) = 
\left(
\begin{array} {c}
 .5 \\
 .5
\end{array}
\right)
$$

Were our knowledge is represented through the probabilities. However upon observation the probabilistic state changes.


## Classical Operations

To review, a classical system, $X$, is a medium that stores information. At any particular instance, the current information stored in $X$ corresponds to its current state $\sigma \in \Sigma$. 

The current value of the information stored in a system can be changed via operations that act upon the system. Such operations are referred to as *deterministic operations*.

We can think of deterministic operations as next state functions in finite state machines: On input of current state $\sigma \in \Sigma$, deterministic operation $f$ returns the next state.


<!-- SideNotes -->
[^Naming]:
  {-} Weather condition is the system $X$ and the type of weather, sunny rainy, are the states $\Sigma$

[^IBM]: 
  [IBM Quantum Learning](https://learning.quantum.ibm.com/course/basics-of-quantum-information/single-systems).

[^Conceptualize]:
  {-} One way to conceptualize: Tomorrow acts as our metaphorical box that hides concrete information from us -- it is not until we can observe the weather the next day we can update our belief to be 100 percent.

[^knowledge]:
  Knowledge is the understanding or information that an observer has about a system -- it is external to it. The knowledge of a system lets one talk about it's state -- it let's one formulate a belief about the system.
