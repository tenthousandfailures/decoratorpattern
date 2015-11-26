package starbuzz;

   `include "Beverage.sv"
   `include "DarkRoast.sv"
   `include "HouseBlend.sv"
   `include "Espresso.sv"
   `include "Decaf.sv"
   `include "CondimentDecorator.sv"
   `include "Whip.sv"
   `include "Mocha.sv"
   `include "Milk.sv"
   `include "Soy.sv"
   `include "StarbuzzCoffee.sv"

endpackage


module top;

   import starbuzz::*;


   Beverage beverage;
   Beverage beverage2;
   Beverage beverage3;

   DarkRoast darkroast;
   Espresso espresso;
   HouseBlend houseblend;

   Mocha mocha;
   Whip whip;
   Soy soy;

   string str;

   initial begin
      espresso  = new;
		  beverage  = new espresso;
      str.realtoa(beverage.cost());
		  $display({beverage.getDescription(), " $", str});

      darkroast  = new;
		  beverage2  = new darkroast;
      // NOTE BIG DIFFERENCE IN CODE HERE
		  mocha      = new(beverage2);
      beverage2  = new mocha;

      mocha      = new(beverage2);
		  beverage2  = new mocha;

		  whip       = new(beverage2);
      beverage2  = new whip;
      str.realtoa(beverage2.cost());
		  $display({beverage2.getDescription(), " $", str});


      houseblend  = new;
		  beverage3   = new houseblend;
      // $display({"P1", beverage3.getDescription()});

      soy         = new(beverage3);
      beverage3   = new soy;
      // $display({"P2", beverage3.getDescription()});

      mocha       = new(beverage3);
      beverage3   = new mocha;
      // $display({"P3", beverage3.getDescription()});

      whip        = new(beverage3);
		  beverage3   = whip;
      // $display({"P4", beverage3.getDescription()});

      str.realtoa(beverage3.cost());
		  $display({beverage3.getDescription(), " $", str});

      
      #1;
      $finish();
   end
   
endmodule // top
