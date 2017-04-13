//// Ehlers Cyber Cycle indicator - coded by dn
//// From Cybernetic Analysis for Stocks and Futures

[LegacyColorValue = true];

// book contains error in Cycle-line - I revised it to function correctly.
Inputs: Price2((H+L)/2), alpha2(.07);
Vars: smooth2(0), Cycle2(0);
Smooth2 = (Price2 + 2*Price2[1] + 2*Price2[2] + Price2[3])/6;
Cycle2=(1-0.5*alpha2)*(1-0.5*alpha2)*(Smooth2-2*Smooth2[1]+Smooth2[2])+2*(1-alpha2)*Cycle2[1]-(1-alpha2)*( 1-alpha2)*Cycle2[2];
//=Line with error from Cybernetics {Cycle2=(1-0.5*alpha2)*(1-0.5*alpha2)*(Smooth2-2*Cycle2[1] - (1-alpha2)*(1-alpha2)*Cycle2[2];}
If currentbar < 7 then Cycle2 = (Price2 - 2*Price2[1] +Price2[2])/4;
Plot1 (Cycle2,"Cycle2",blue); Plot2(Cycle2[1],"Trigger",green);

//displays same as above
{Inputs: Price((H+L)/2), alpha(.07);
Vars: Smooth(0), Cycle(0);
Smooth = (Price + 2*Price[1] + 2*Price[2] + Price[3])/6;
Cycle = (1 - .5*alpha)*(1 - .5*alpha)*(Smooth - 2*Smooth[1] + Smooth[2]) + 2*(1 - alpha)*Cycle[1] - (1 - alpha)*(1 - alpha)*Cycle[2];
If currentbar < 7 then Cycle = (Price - 2*Price[1] + Price[2]) / 4;
// Plot21(Cycle,"Cycle",yellow); Plot22(Cycle[1],"Trigger",red);
}
{Cyber Cycle Oscillator = Registers similar to above but not identical
compiled by mmillar, July 2004 - uses TS _Oscillators function - not as efficient as direct code
Price - price input such as (H+L)/2 or Close
Length - used by the Cyber Cycle calculation, John Ehlers uses alpha but I have replaced it with the more intuitive Length, where alpha=2/(Length+1)
Inputs: Priceb((H+L)/2), Length2(14);
Vars: oResult1(0), oResult2(0);
value1=_Oscillators(1, Priceb, Length2, 0, 1, 0, 1, oResult1, oResult2);
// Plot11(oResult1, "Cyber"); Plot12(oResult2, "Trigger");
}