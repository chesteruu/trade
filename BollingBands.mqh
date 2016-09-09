#ifndef BOLLINGBANDS_MQH
#define BOLLINGBANDS_MQH

class BollingBands
{
public:
    BollingBands();

    void isStable(const double &upperBand,
                  const double &lowerBand);

private:

    int movingAverage;
    double stableThreshold;
    double diffBuffer[movingAverage];
    double diffPercentage[movingAverage];
    double diffPercentagePow[movingAverage];

};

#endif // BOLLINGBANDS_MQH
