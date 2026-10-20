`timescale 1ns/1ps
`celldefine
module PADDB (A, OEN, PAD, Y);
input  A ;
input  OEN ;
output Y ;
inout  PAD ;

   bufif0 (PAD, A, OEN);
   buf (Y, PAD);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48,
       tplz$OEN$PAD = 0.27:0.27:0.27,
       tphz$OEN$PAD = 0.21:0.21:0.21,
       tpzh$OEN$PAD = 0.48:0.48:0.48,
       tpzl$OEN$PAD = 0.45:0.45:0.45,
       tpllh$PAD$Y = 0.033:0.033:0.033,
       tphhl$PAD$Y = 0.08:0.08:0.08;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);
     (OEN *> PAD) = (0, 0, tplz$OEN$PAD, tpzh$OEN$PAD, tphz$OEN$PAD, tpzl$OEN$PAD);
     (PAD *> Y) = (tpllh$PAD$Y, tphhl$PAD$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module PADDI (PAD, Y);
input  PAD ;
output Y ;

   buf (Y, PAD);

   specify
     // delay parameters
     specparam
       tpllh$PAD$Y = 0.033:0.033:0.033,
       tphhl$PAD$Y = 0.08:0.08:0.08;

     // path delays
     (PAD *> Y) = (tpllh$PAD$Y, tphhl$PAD$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module PADDO (A, PAD);
input  A ;
output PAD ;

   buf (PAD, A);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module PADDOZ (A, OEN, PAD);
input  A ;
input  OEN ;
output PAD ;

   bufif0 (PAD, A, OEN);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48,
       tplz$OEN$PAD = 0.27:0.27:0.27,
       tphz$OEN$PAD = 0.21:0.21:0.21,
       tpzh$OEN$PAD = 0.48:0.48:0.48,
       tpzl$OEN$PAD = 0.44:0.44:0.44;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);
     (OEN *> PAD) = (0, 0, tplz$OEN$PAD, tpzh$OEN$PAD, tphz$OEN$PAD, tpzl$OEN$PAD);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module IORINGDB (A, OEN, PAD, Y);
input  A ;
input  OEN ;
output Y ;
inout  PAD ;

   bufif0 (PAD, A, OEN);
   buf (Y, PAD);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48,
       tplz$OEN$PAD = 0.27:0.27:0.27,
       tphz$OEN$PAD = 0.21:0.21:0.21,
       tpzh$OEN$PAD = 0.48:0.48:0.48,
       tpzl$OEN$PAD = 0.45:0.45:0.45,
       tpllh$PAD$Y = 0.033:0.033:0.033,
       tphhl$PAD$Y = 0.08:0.08:0.08;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);
     (OEN *> PAD) = (0, 0, tplz$OEN$PAD, tpzh$OEN$PAD, tphz$OEN$PAD, tpzl$OEN$PAD);
     (PAD *> Y) = (tpllh$PAD$Y, tphhl$PAD$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module IORINGDI (PAD, Y);
input  PAD ;
output Y ;

   buf (Y, PAD);

   specify
     // delay parameters
     specparam
       tpllh$PAD$Y = 0.033:0.033:0.033,
       tphhl$PAD$Y = 0.08:0.08:0.08;

     // path delays
     (PAD *> Y) = (tpllh$PAD$Y, tphhl$PAD$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module IORINGDO (A, PAD);
input  A ;
output PAD ;

   buf (PAD, A);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/1ps
`celldefine
module IORINGDOZ (A, OEN, PAD);
input  A ;
input  OEN ;
output PAD ;

   bufif0 (PAD, A, OEN);

   specify
     // delay parameters
     specparam
       tpllh$A$PAD = 0.49:0.49:0.49,
       tphhl$A$PAD = 0.48:0.48:0.48,
       tplz$OEN$PAD = 0.27:0.27:0.27,
       tphz$OEN$PAD = 0.21:0.21:0.21,
       tpzh$OEN$PAD = 0.48:0.48:0.48,
       tpzl$OEN$PAD = 0.44:0.44:0.44;

     // path delays
     (A *> PAD) = (tpllh$A$PAD, tphhl$A$PAD);
     (OEN *> PAD) = (0, 0, tplz$OEN$PAD, tpzh$OEN$PAD, tphz$OEN$PAD, tpzl$OEN$PAD);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2

