{ Based on PJK_Stress function
Copyright 2013, P.J.Kaufman. All rights reserved. }
inputs: 
	Period( 60 ),
	OBLevel( 90 ),
	OSLevel( 10 ),
	NormalLevel( 50 ) ;
variables: 
	Stoch1( 0 ), 
	Stoch2( 0 ), 
	Diff( 0 ), 
	Range1( 0 ), 
	Range2( 0 ), 
	StressValue( 0 ) ;

StressValue = 50 ;
Stoch1 = 50 ;
Stoch2 = 50 ;

{ raw stochastics for price1 and price2 }
Range1 = Highest( High, Period ) 
	- Lowest( Low, Period ) ;
Range2 = Highest( High of Data2, Period) 
	- Lowest( Low of Data2, Period ) ;

if Range1 <> 0 and Range2 <> 0 then 
	begin
	Stoch1 = ( Close 
		- Lowest( Low, Period ) ) / Range1 ;
	Stoch2 = ( Close of Data2 
		- Lowest( Low of Data2, Period ) ) / Range2 ;
	
	{ difference in stochastics }
	Diff = Stoch1 - Stoch2;
	{ stress indicator }
	Range1 = Highest( Diff, Period ) 
		- Lowest( Diff, Period ) ;
	if Range1 <> 0 then 
		StressValue = 100 * ( Diff 
			- Lowest( Diff, Period ) ) / Range1 ;
	end ;

Plot1( StressValue, "Stress" ) ;
Plot2( Stoch1 * 100, "D1 Stoch" ) ;
Plot3( Stoch2 * 100, "D2 Stoch" ) ;
Plot4( OBLevel, "OverBought" ) ;
Plot5( OSLevel, "OverSold" ) ;
Plot6( NormalLevel, "Normal" ) ;