#include<iostream>
#include<bitset>

using namespace std;

int main()
{
    bitset<5> b(30);

    // b = 30; // also correct

    cout<<b<<endl;
    cout<<b.to_ulong()<<endl;
    cout<<b[1];
}