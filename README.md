# Computer Architecture Course - Homeworks and Project

This repository contains all the homework assignments and the final project for the Computer Architecture course. The work involves building various processor models in Quartus, exploring cache management techniques in Gem5, and understanding performance improvements in processor design. Each assignment builds upon the previous one, culminating in a project focused on cache optimization.

---

## 📁 Contents

1. **Homework 1 - 4**:  
   Developed a single-cycle MIPS processor using Quartus, constructed from basic gates and ICs. The processor supports memory access, jump instructions, and arithmetic calculations. 

2. **Homework 5**:  
   Transformed the single-cycle processor into a multi-cycle processor. This involved modifying the controller and making minor adjustments to the architecture from previous assignments.

3. **Homework 6 - 7**:  
   Upgraded the processor to a pipelined architecture to enhance efficiency. Addressing pipeline hazards was crucial in these assignments, and extensive effort went into handling various types of hazards correctly.

4. **Homework 8 - 10**:  
   Explored cache performance using the Gem5 simulator. Analyzed cache replacement policies, coding style, and other factors affecting cache hit rates and overall performance.

5. **Final Project - Belady's Cache Replacement Policy**:  
   - **Objective**: Implement Belady’s optimal cache replacement policy in Gem5.
   - **Structure Design**: Built a custom structure tailored to Gem5 for managing cache blocks.
   - **Implementation and Testing**: Implemented the design, ran tests with varied memory access patterns, and optimized the policy for realistic scenarios.
   - **Automation**: Created a Bash script to run benchmarks in parallel, efficiently collecting performance results across multiple simulations.

---

## 🔧 Tools and Technologies

- **Quartus**: Used for processor design and simulation in homeworks 1 through 7.
- **Gem5**: Employed in homeworks 8 to 10 and the final project to simulate and analyze cache performance.
- **Bash Scripting**: Developed scripts for automating benchmark simulations and collecting results.

---

## 📝 Usage and Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/CA-Homeworks-and-Project.git
   ```
2. Navigate to the corresponding homework or project folder for setup instructions and documentation specific to each assignment.

---

## 💡 Key Learnings

This series of assignments provided in-depth experience with processor design, hazard management in pipelined processors, and the impact of caching strategies on performance. The final project demonstrated the effectiveness of optimal cache replacement policies in real-world scenarios and provided practical insights into performance optimization.

---

Thank you for exploring this repository! Each homework and project is organized in its respective folder, with additional details and specific instructions.
