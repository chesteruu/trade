#include "BollingBands.mqh"

BollingBands::BollingBands()
{
}

double BollingBands::getMeanPercentage()
{
    double result = 0.0;
    for(int i = 0; i < movingAverage; ++ i)
    {
        result += diffPercentage[i];
    }

    return result / movingAverage;
}

double BollingBands::getPowMeanPercentage()
{
    double result = 0.0;
    for(int i = 0; i < movingAverage; ++ i)
    {
        result += Math::pow(diffPercentage[i], 2);
    }

    return result / movingAverage;
}

void BollingBands::isStable(const double &upperBand,
                            const double &lowerBand)
{
    double diff = upperBand - lowerBand;

    for(int i = movingAverage; i >= 1; -- i)
    {
        diffBuffer[i - 1] = diffBuffer[i];
        diffPercentage[i - 1] = diffPercentage[i];
    }

    diffBuffer[i] = diff;
    diffPercentage[i] = (diffBuffer[i] - diffBuffer[i - 1]) / diffBuffer[i];

    double sdPercentage = Math::sqar(getPowMeanPercentage() - Math::sqar(getMeanPercentage()));


}
