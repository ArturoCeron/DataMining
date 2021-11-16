# Discrete Distributions


## Binomial Distribution

<div align= "justify">
The binomial distribution is a very important discrete distribution that arises in many biostatistical applications. It was obtained by Jakob Bernoulli (1654-1705) and published in his posthumous work Ars Conjectandi in 1713.

This distribution appears naturally when performing independent repetitions of an experiment that has a binary response, generally classified as "success" or "failure"; this experiment is called the Bernoulli experiment. Examples of a binary response can be smoking (yes / no), whether or not a hospitalized patient develops an infection, or whether or not an item in a batch is defective. The discrete variable that counts the number of successes in n independent trials of that experiment, each with the same probability of “success” equal to p, follows a binomial distribution of parameters n and p, which is denoted by (Bi (n, p )). This model is applied to finite populations from which elements are taken at random with replacement, and also to conceptually infinite populations, such as the parts produced by a machine, as long as the production process is stable (the proportion of defective parts is remains constant in the long term) and without memory (the result of each piece does not depend on the previous ones).
</div>
<p align="center">
  <img src="https://github.com/ArturoCeron/DataMining/blob/Unit_2/Unit_2/Investigation/Investigation%202/images/dd1.PNG" />
</p>

## Geometric Distribution

<div align= "justify">
Suppose that an experiment or test is carried out repeatedly, that the repetitions are independent, and that one is interested in the occurrence or not of an event referred to as "success", the probability of this event being p. The geometric distribution allows to calculate the probability that a number k of repetitions will have to be carried out before obtaining a success for the first time; this probability decreases as k increases, so the probability mass function is always decreasing. Thus, it differs from the binomial distribution in that the number of repetitions is not predetermined, but is the random variable that is measured and, on the other hand, the set of possible values of the variable is unlimited.

To illustrate the use of this distribution, it is assumed that a certain drug operates successfully against the disease for which it was conceived in 80% of the cases to which it is applied; the random variable "unsuccessful attempts to apply the drug before the first success" follows a geometric distribution of parameter p = 0.8. Another example of a geometric variable is the number of children until the birth of the first girl.

The geometric distribution is used in the distribution of waiting times, so that if the trials are carried out at regular intervals of time, this random variable gives the elapsed time until the first success.

This distribution has the property called “lack of memory”, which implies that the probability of having to wait for a time t does not depend on the time that has already elapsed.
</div>

<p align="center">
  <img src="https://github.com/ArturoCeron/DataMining/blob/Unit_2/Unit_2/Investigation/Investigation%202/images/dd2.PNG" />
</p>

# Continuous distributions

## Normal distribution

<div align= "justify">
The normal distribution is undoubtedly the most important probability distribution in the calculus of probabilities and statistics. It was discovered, as an approximation of the binomial distribution, by Abraham De Moivre (1667-1754) and published in 1733 in his book The Doctrine of Chances; these results were extended by Pierre-Simon Laplace (1749-1827), who also made important contributions. In 1809, Carl Friedrich Gauss (1777-1855) published a book on the motion of celestial bodies where he assumed normal errors, for this reason this distribution is also known as the Gaussian distribution.

The importance of the normal distribution is fully consolidated as it is the limit distribution of numerous random, discrete and continuous variables, as demonstrated by the central limit theorems. The consequences of these theorems imply the almost universal presence of the normal distribution in all fields of empirical sciences: biology, medicine, psychology, physics, economics, etc. In

particular, many measures of continuous data in medicine and biology (height, blood pressure, etc.) approximate the normal distribution.

Along with the above, it is no less important the interest of the simplicity of its characteristics and that from it derive, among others, three distributions (chi-square, Student's t and Snedecor's F) that will be mentioned later, from key importance in the field of statistical hypothesis testing.

The normal distribution is fully defined by two parameters: the mean (μ) and the standard deviation or standard deviation (σ). Its density function is symmetric with respect to the mean and the standard deviation indicates the greater or lesser degree of opening of the curve, which, due to its appearance, is usually called a Gaussian bell. This distribution is denoted by N (μ, σ).

When the normal distribution has parameters μ = 0 and σ = 1, it is called the standard normal distribution. Any variable X that follows a normal distribution of parameters μ and σ can be transformed into another variable Y = (X-μ) / σ that follows a standard normal distribution; This process is called standardization, typing, or normalization.
</div>

<p align="center">
  <img src="https://github.com/ArturoCeron/DataMining/blob/Unit_2/Unit_2/Investigation/Investigation%202/images/dd3.PNG" />
</p>

## Uniform distribution

<div align= "justify">
The uniform distribution is useful to describe a random variable with constant probability over the interval (a, b) in which it is defined and is denoted by U (a, b). It is also known as a rectangular distribution due to the aspect of its density function.

An important peculiarity of this distribution is that the probability of an event depends exclusively on the width of the interval considered and not on its position in the field of variation of the variable.

Whatever the F distribution of a certain variable X, the transformed variable Y = F (X) follows a uniform distribution in the interval (0,1). This property is essential as it is the basis for the generation of random numbers of any distribution in simulation techniques, and is called the investment method.
</div>

<p align="center">
  <img src="https://github.com/ArturoCeron/DataMining/blob/Unit_2/Unit_2/Investigation/Investigation%202/images/dd4.PNG" />
</p>

# References

Ayuda de Distribuciones de probabilidad. (2014). https://www.sergas.es/Saude-publica/Documents/1899/Ayuda_Epidat_4_Distribuciones_de_probabilidad_Octubre2014.pdf
