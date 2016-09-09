#ifndef BOLLINGBANDS_MQH
#define BOLLINGBANDS_MQH

class BollingBands
{
public:
    BollingBands();

    enum BBState
    {
        STABLE,
        UPBREAKOUT,
        DOWNBREAKOUT,
        UNKNOWNBREAKOUT
    };


private:

    int movingAverage;
    double stableThreshold;
    double diffBuffer[movingAverage];
    double diffPercentage[movingAverage];
    double diffPercentagePow[movingAverage];

    double getPowMeanPercentage();
    double getMeanPercentage();

    bool isStable(const double &upperBand,
                  const double &lowerBand);

    BBState state;
};

#endif // BOLLINGBANDS_MQH
