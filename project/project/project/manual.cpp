/*

Principal Components:

1: Sampled Cache:
    N(= 32) sample sets: N different history for cache
    each sample set:
        an M(= 16)-way cache
        for each cache we store 8 * M (= 128) last cache accesses as history

    We can see the sampled cache as a N sub-caches and total N * M (= 512) sets
    Sample cache adderssing:
        Set index: 5 bit for sample set index concatenated with [3:0] bits of block address tag
        Cache line tag: [13:4] of the block address tag

    Each Sampled Cache entry maps block addresses to their last access timestamp and their last PC signature.
    (Each entry includes a valid bit, a 10-bit block address hash, an 11-bit PC signature, and an 8-bit timestamp indicating the time of last access)

    Current timestamp: 8-bit running counter for each sampled LLC set and is incremented on every cache access

    The Sampled Cache is managed using an LRU replacement policy

    For each cache access we search Sampled Cache:
        hit -> we train RDP (of last PC signitare which we have stored) with the difference of current timestamp and cache line last timestamp(reuse distance),
                update timestamp and PC signiture of that line
        miss -> the evicted line is the least used line, we train RDP with this line and timestamp difference(reuse distance) of infinity(INF_RD = 127),
                insert new cache line
    (if current timestamp < cache line timestamp: we add 1 << TIMESTAMP_BITS to current timestamp before computing the difference)

2: Reuse Distance Predictor(RDP):
    A direct-mapped array indexed by the PC signature \
    Stores the predicted reuse distance for the blocks corresponding to this signature

    The PC signature is a hash of the 11 least significant bits of the program counter with a bit indicating whether the cache access was a hit or a miss

    Each entry in the RDP is a 7-bit saturating counter representing the number of set accesses before a cache line is predicted to be reused.

    At first, all counters are initialized to 0
    for each RDP training update, we add or subtract min(1, diff/16), in which diff is absolute difference between the previous entry and the new reuse distance


3: ETR counters: (one for each LLC cache line)
    Each cache line has an 8-bit counter for Estimated Time Remaining(ETR)
    Last Level Cache (LLC = L3) is responsible for updating counters for each line

    On insertion and promotion, ETR is initialized with corresponding value in RDP

    on every cache access, we want to decrease a value from all counters(aging):
        any reuse distance greater than MAX_RD=104 (including INF_RD) won't age, and doesn't have a chance to be cached
    for saving more space we store 5-bit counter for each line, and associate a 3-bit counter to the whole set
        upon every set access, we increment the set counter. once it resets to 0, all ETRs in the set would decrement.


*/
