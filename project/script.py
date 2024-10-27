import subprocess
import pandas as pd
import matplotlib.pyplot as plt
import os
import argparse

def run_gem5_simulation(program, policy, results):
    command = [
        "./build/X86/gem5.opt",
        "configs/deprecated/example/se.py",
        "-c", f"../binary/{program}",
        "--caches",
        "--l2cache",
        "--l2_size=4kB",
        "--mem-type=DDR4_2400_16x4",
        "--cacheline_size", "64",
        f"--l2_repl={policy}"
    ]

    try:
        subprocess.check_output(command, universal_newlines=True)

        performance = extract_performance_metric('m5out/stats.txt')

        if performance is not None:
            results.append((program, policy, performance))
    except subprocess.CalledProcessError as e:
        print(f"Error running {program} with policy {policy}: {e}")

def extract_performance_metric(stats_file):
    try:
        with open(stats_file, 'r') as f:
            for line in f:
                if 'l2.overallMissRate::cpu.data' in line:
                    return float(line.split()[1])
    except Exception as e:
        print(f"Error reading {stats_file}: {e}")
    return None

def run_simulations(programs, policies):
    results = []

    for program in programs:
        for policy in policies:
            run_gem5_simulation(program, policy, results)

    return results

def generate_results_csv_and_plots(results, filename, folder):
    dir_addr = folder + '/'
    if not os.path.exists( './' + dir_addr):
        os.makedirs(dir_addr)
    df = pd.DataFrame(results, columns=['Program', 'Policy', 'Performance'])
    df = df.dropna(subset=['Performance'])

    df.to_csv(filename, index=False)

    for program in df['Program'].unique():
        plt.figure(figsize=(8, 6))
        subset = df[df['Program'] == program]
        plt.bar(subset['Policy'], subset['Performance'])
        plt.xlabel('Policy')
        plt.ylabel('Performance')
        plt.title(f'Performance of {program} with different policies')
        plt.savefig(dir_addr + f'{program}_performance.png')
        
        min_performance = subset['Performance'].min()
        adjusted_performance = subset['Performance'] - min_performance    
        
        plt.figure(figsize=(8, 6))
        subset = df[df['Program'] == program]
        plt.bar(subset['Policy'], adjusted_performance)
        plt.xlabel('Policy')
        plt.ylabel('Adjusted Performance')
        plt.title(f'Performance of {program} with different policies')
        plt.savefig(dir_addr + f'{program}_adjusted_performance.png')
        
        
    df = pd.DataFrame(results, columns=['Program', 'Policy', 'Performance'])
    df = df.dropna(subset=['Performance'])

    plt.figure(figsize=(8, 6))

    for policy in df['Policy'].unique():
        policy_subset = df[df['Policy'] == policy]
        plt.plot(policy_subset['Program'], policy_subset['Performance'], label=policy, marker='o')

    plt.xlabel('Test Program')
    plt.ylabel('Performance')
    plt.title('Performance with different policies')
    plt.legend()
    plt.savefig(dir_addr + 'analyse_performance.png')
    plt.close()

def main():
    parser = argparse.ArgumentParser(description="Run gem5 simulations with different programs and policies")
    parser.add_argument('--programs', nargs='+', required=True, help="List of programs to simulate")
    parser.add_argument('--policies', nargs='+', required=True, help="List of cache replacement policies")
    parser.add_argument('--output', type=str, default='simulation_results.csv', help="Output CSV filename")
    parser.add_argument('--folder', type=str, default='outputs', help="Output folder")

    args = parser.parse_args()

    results = run_simulations(args.programs, args.policies)
    print(results)
    generate_results_csv_and_plots(results, args.output, args.folder)

if __name__ == "__main__":
    main()