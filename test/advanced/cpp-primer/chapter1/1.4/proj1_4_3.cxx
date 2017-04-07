/*
*      Filename: proj1_4_3.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-07 21:50:37
* Last Modified: 2017-04-07 21:50:37
**/

#include <iostream>
int main()
{
    std::cout << "Enter two numbers:" <<std::endl;
    int v1, v2;
    std::cin >> v1 >> v2; // read input

    // use smaller number as lower bound for summation
    int lower, upper;
    if(v1 <= v2)
    {
        lower = v1;
        upper = v2;
    }else
    {
        lower = v2;
        upper = v1;
    }
    
    int sum = 0;
    // sum values from lower up to and including upper
    for(int val = lower; val <= upper; ++val)
    {
        sum += val; // sum = sum +val
    }

    std::cout << "Sum of " << lower 
              << " to " << upper 
              << " inclusive is "
              << sum << std::endl;
    return 0;

}
