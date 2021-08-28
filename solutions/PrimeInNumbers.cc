#include <string>
#include <cmath>
#include <vector>
#include <iostream>

using namespace std;


class PrimeInNumbers
{
public:
    static string factors(int lst);
};

int isqrt(int n) {
    return (int) sqrt((double) n);
}

string PrimeInNumbers::factors(int lst) {
    int f1 = isqrt(lst);
    vector<int> factors;

    for (int i = 2; i <= f1; i++) {
        while (lst % i == 0) {
            lst = lst / i;
            factors.push_back(i);
        }
    }

    if (lst > 1) {
        factors.push_back(lst);
    }

    int v = 0,
        c = 0;
    string result = "";
    
    for (int f : factors) {
        if (v == 0) {
            v = f;
            c++;
            continue;
        }
        if (v == f) {
            c++;
            continue;
        }
        if (c == 1) {
            result += "(" + to_string(v) + ")";
        } else if (c > 1) {
            result += "(" + to_string(v) + "**" + to_string(c) + ")";
        }
        c = 1;
        v = f;
    }

    if (v != 0 && c >= 1) {
        if (c == 1) {
            result += "(" + to_string(v) + ")";
        } else if (c > 1) {
            result += "(" + to_string(v) + "**" + to_string(c) + ")";
        }
    }

    return result;
}


int main() {
    int n;
    cout << "Input a number" << endl;
    cin >> n;
    cout << PrimeInNumbers::factors(n) << endl;

    return 0;
}

