#ifndef __MEM_CACHE_TAGS_BMP_HH__
#define __MEM_CACHE_TAGS_BMP_HH__

#include "mem/cache/tags/base_set_assoc.hh"
#include "params/BMP.hh"

// additional includes
#include <lru.hh>
#include <bitset>
#include <math.h>

class BMP : public BaseSetAssoc
{
public:
    /** Convenience typedef. */
    typedef BMPParams Params;

    /**
     * Construct and initialize this tag store.
     */
    BMP(const Params *p);

    /**
     * Destructor
     */
    ~BMP() {}

    /**
     * Required functions for this subclass to implement
     */
    BlkType *accessBlock(Addr addr, bool is_secure, Cycles &lat, int context_src, , PacketPtr pkt);
    BlkType *findVictim(Addr addr, PacketPtr pkt) const;
    void insertBlock(PacketPtr pkt, BlkType *blk);
    void invalidate(BlkType *blk);

    // additional functions and variables
    std::bitset<7> counter; // running counter for current timestamp -> updates in each set access

    LRU *sampled_cache;
    std::bitset<7> RDP[1 << 12];

    std::bitset<5> ETR[numSets * assoc]; // signed numbers, with a bias of 16
    int ETR_bias = 16;

    std::bitset<3> set_counter[numSets];

    void age()
    {
        for (int i = 0; i < numSets; i++)
        {
            set_counter[i] = set_counter[i].to_ulong() + 1;
            if (set_counter[i].to_ulong() == 0)
            {
                for (int j = 0; j < assoc; j++)
                {
                    // update ETR (signed)
                    int prev_val = (int)(ETR[i * assoc + j].to_ulong()) - ETR_bias if (prev_val > 104 || prev_val < -104) continue;

                    ETR[i * assoc + j] = prev_val - 1 + ETR_bias;
                }
            }
        }
    }

    int get_block_index_in_set(BlkType *blk, int set_index)
    {
        for (int i = 0; i < assoc; i++)
        {
            if (sets[set_index].blks[i] == blk)
            {
                return i;
            }
        }
        return -1;
    }

    void access_train_data(unsigned int new_pc, Addr addr, std::bitset<1> hit)
    {
        // blk = sampled_cache->accessBlock(addr, ...);

        // unsigned int dist;
        // unsigned int prev_pc;

        // if (blk == NULL)    // miss
        // {
        //     dist = 127;
        //     BlkType *blk = sampled_cache->findVictim(addr);
        //     sampled_cache->insertBlock(..., blk);
        // }
        // else    //hit
        // {

        // }

        // update_RDP(std::bitset<11>(prev_pc), hit, dist);
    }

    void update_RDP(std::bitset<11> pc, std::bitset<1> hit, unsigned int dist)
    {
        unsigned int RDP_index = pc.to_ulong() << 1 + hit.to_ulong();

        // difference of previous reuse distance and the new one
        int diff = dist - (int)(RDP[RDP_index].to_ulong());
        int diff_sign = -1 if diff < 0 else 1;

        // update
        int update_value = diff_sign * min(diff * diff_sign / 16, 1) int new_value = update_value + RDP[RDP_index].to_ulong();

        if (new_value > 127)
            RDP[RDP_index] = 127;
        else if (new_value < 0)
            RDP[RDP_index] = 0;
        else
            RDP[RDP_index] = new_value;
    }
};

#endif // __MEM_CACHE_TAGS_BMP_HH__