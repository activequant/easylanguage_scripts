///// EHLERS INSTANTANEOUS TREND INDICATOR /////
Inputs: Price ((H+L)/2), alpha(.07);

Vars: Smooth(0),
iTrend(0),
Trigger(0);

iTrend = (alpha- alpha*alpha/4)*price
+ .5* alpha * alpha * Price[1] -
(alpha - .75 * alpha*alpha) * Price[2] + 2
*(1 - alpha) * iTrend[1] -(1 - alpha)
*(1-alpha)*iTrend[2];
If currentBar < 7 then iTrend = Price + 2*price[1]
+ Price[2]/4;

Trigger = 2*iTrend - iTrend[2];

plot1 (iTrend,"iTrend",blue);
plot2 (Trigger, "Trig",green);