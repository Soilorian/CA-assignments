#include "mem/cache/tags/BMP.hh"
#include "base/random.hh"
#include "debug/CacheRepl.hh"
#include "mem/cache/base.hh"

// additional includes
#include <lru.hh>
#include <bitset>
#include <math.h>

BMP::BMP(const Params *p)
    : BaseSetAssoc(p)
{
}

// what should be done upon block access
BaseSetAssoc::BlkType *
BMP::accessBlock(Addr addr, bool is_secure, Cycles &lat, int master_id, PacketPtr pkt) // PacketPtr pkt been added!
{
    // updates on each access
    BMP::counter = BMP::counter.to_ulong() + 1;
    BMP::age();

    // Accesses are based on parent class, no need to do anything special
    BlkType *blk = BaseSetAssoc::accessBlock(addr, is_secure, lat, master_id);

    Addr pc_addr = pkt->req->getPC();
    unsigned int pc = (unsigned int)(pc) % (1 << 11); // 11 least significant bits

    int set_index = extractSet(addr);
    int blk_index = BMP::get_block_index_in_set(blk, set_index);
    assert(blk_index >= 0);

    if (blk != NULL) // hit
    {
        // update sampled cache and RDP
        BMP::access_train_data(pc, addr, bitset<1> a(1));

        // reset corresponding ETR
        BMP::ETRs[set_index * assoc + blk_index] = int(BMP::RDP[pc << 1 + 1].to_ulong()) / 8 + BMP::ETR_bias;
    }

    return blk;
}

// what block should be evicted
BaseSetAssoc::BlkType *
BMP::findVictim(Addr addr, PacketPtr pkt) const // PacketPtr pkt been added!
{
    BlkType *blk = BaseSetAssoc::findVictim(addr);

    Addr pc_addr = pkt->req->getPC();
    unsigned int pc = (unsigned int)(pc) % (1 << 11); // 11 least significant bits

    BlkType *max_blk = blk;
    int max_counter = BMP::RDP[pc << 1 + 0].to_ulong() / 8;

    if (blk->isValid())
    {
        for (int i = 0; i < assoc; i++)
        {
            int block_ETR = (int)(BMP::ETR[extractSet(addr) * assoc + i].to_ulong()) - BMP::ETR_bias;
            if (abs(block_ETR) > max_counter)
            {
                max_counter = abs(block_ETR);
                max_blk = sets[extractSet(addr)].blk[i]
            }
        }
    }

    return max_blk;
}

// what should be done upon block insertion
void BMP::insertBlock(PacketPtr pkt, BlkType *blk)
{
    BaseSetAssoc::insertBlock(pkt, blk);

    Addr pc_addr = pkt->req->getPC();
    unsigned int pc = (unsigned int)(pc) % (1 << 11); // 11 least significant bits

    BMP::access_train_data(pc, pkt->getAddr(), bitset<1> a(0));

    int set_index = extractSet(pkt->getAddr()) int blk_index = BMP::get_block_index_in_set(blk, set_index);
    assert(blk_index >= 0);

    BMP::ETRs[set_index * assoc + blk_index] = int(BMP::RDP[pc << 1 + 0].to_ulong()) / 8 + BMP::ETR_bias;
}

// what should be done upon block eviction
void BMP::invalidate(BlkType *blk)
{
    BaseSetAssoc::invalidate(blk);
}

BMP *BMPParams::create()
{
    BMP::counter = 0;
    BMP::sampled_cache = new LRU();
    for (i = 0; i < 1 << 12; i++)
        BMP::RDP[i] = 0;

    for (i = 0; i < numSets; i++)
        set_counter[i] = 0;

    return new BMP(this);
}
