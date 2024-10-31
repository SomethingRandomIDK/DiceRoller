#include <iostream>
#include <cctype>

int roll(std::string rollVal) {
    size_t dLoc {rollVal.find('d')};
    int diceNum;
    int diceSize;
    if (dLoc == std::string::npos) {
        return -1;
    } else if (dLoc == 0) {
        diceNum = 1;
    } else if (std::isdigit(rollVal[0])) {
        diceNum = std::stoi(rollVal);
    } else {
        return -1;
    }

    if (dLoc + 1 == rollVal.size()) {
        diceSize = 6;
    } else if (std::isdigit(rollVal[dLoc + 1])) {
        diceSize = std::stoi(rollVal.substr(dLoc + 1));
    } else {
        return -1;
    }

    int i;
    int rollRes {0};

    for (i = 0; i < diceNum; i++) {
        rollRes += (rand() % diceSize) + 1;
    }

    return rollRes;
}

int main(int argc, char *argv[]) {
    int i;
    srand(time(0));

    for (i = 1; i < argc; i++) {
        std::string arg{argv[i]};
        std::cout << roll(arg) << std::endl;
    }

    return 0;
}

