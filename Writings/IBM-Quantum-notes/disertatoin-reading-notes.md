---
title: 'Tomesh Dissertation Notes'
---

# Why build QC's?
Indeed, the quantum computational model can be simulated by a classical machine. Hence, any quantum algorithm that we create to run on a quantum computer can also be run on a classical machine by simulating the quantum computer. In other words, quantum computing does not offer the ability to compute problems that are otherwise uncomputable for the classical machine.

Why is it then that we are striving for QC's?

Although it is true we could solve 'quantum problems' on a classical machine, this does not mean it can be done efficiently.

## The problem in efficiently simulating a quantum machine.
A quantum computer relies on qubits to perform computation. Unlike a classical machine where a bit is explicitly in either a 1 or 0 state, a qubit can be in a 'superposition' of two classical states. The degree of 'superposition' is referred to as the amplitude. In a quantum computer, these amplitudes are encoded within the qubits themselves. However, a classical machine would have to store this information separately. As a result, simulating a quantum machine on a classical machine is an exponential time process, compared to what would otherwise be linear time.

## Crux
The core idea is quantum computers able to solve problems that lay unsolvable for the classical machine, but they can be more efficient about solving them.

# The Quantum Resource Gap
The Quantum Resource Gap (QRG) refers to the disparity between the practical application of quantum computers and the amount of resources required to achieve this. By resources, we mean stable qubits, etc.

# Accelerating the timeline to quantum advantage
Given a certain application or problem, too close the QRG ideally we make cross cutting 


## Motivation
Modern Quantum computers are prone to errors and probabilistic. At the surface this seems like it means there is no point to developing algorithms that will yield quantum advantage.

# Two Takeaways
1. We can start working on figuring out the hw/sf stack for quantum computers now.
2. We can get closer to quantum advantage for specific applications, despite the faults in the actual hardware, by employing optimizations across the hw/sf stack. In the context of the paper, benchmarks can help us achieve this.
