LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
LIBRARY IEEE;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;

package prim is

CONSTANT DefCombSpikeMsgOn : BOOLEAN := true;
CONSTANT DefCombSpikeXOn   : BOOLEAN := true;
CONSTANT DefSeqMsgOn       : BOOLEAN := true;
CONSTANT DefSeqXOn         : BOOLEAN := true;

CONSTANT DefDummyDelay    : VitalDelayType := 1.00 ns;
CONSTANT DefDummySetup    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyHold     : VitalDelayType := 1.00 ns;
CONSTANT DefDummyWidth    : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRecovery : VitalDelayType := 1.00 ns;
CONSTANT DefDummyRemoval  : VitalDelayType := 1.00 ns;
CONSTANT DefDummyIpd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIsd      : VitalDelayType := 0.00 ns;
CONSTANT DefDummyIcd      : VitalDelayType := 0.00 ns;

CONSTANT udp_dff : VitalStateTableType (1 TO 21, 1 TO 7) := (
--    NOTIFIER   D      CLK     RN       S      Q(t)   Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '/',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '/',    '0',    '-',    '-',    '1'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '\',   '-',    '-',    '-',    'S'  ),
     (  '-',    '*',    'B',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'B',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    'X',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    'B',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    'X',    '*',    '0',    '0',    '0'  ),
     (  '-',    'B',    'r',    '-',    '-',    '-',    'X'  ),
     (  '-',    '/',    'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    'f',    '-',    '-',    '-',    'X'  ),
     (  '-',    '\',   'X',    '0',    '-',    '-',    'X'  ),
     (  '-',    'B',    'X',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ));

CONSTANT udp_tlat : VitalStateTableType (1 TO 20, 1 TO 7) := (
--      NOT      D       G       R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '-',    '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '1',    '1',    '0',    '-',    '-',    '1'  ),
     (  '-',    '0',    '1',    '-',    '0',    '-',    '0'  ),
     (  '-',    '1',    '*',    '0',    '-',    '1',    '1'  ),
     (  '-',    '0',    '*',    '-',    '0',    '0',    '0'  ),
     (  '-',    '*',    '0',    '-',    '-',    '-',    'S'  ),
     (  '-',    '-',    '0',    '0',    '*',    '1',    '1'  ),
     (  '-',    '1',    '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '-',    '0',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '1',    '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '-',    '-',    '*',    '-',    'X'  ),
     (  '-',    'B',    'r',    '0',    '0',    '-',    'X'  ),
     (  '-',    'B',    'X',    '0',    '0',    '-',    'S'  ),
     (  '-',    '-',    'S',    '-',    '-',    '-',    'S'  ) );

CONSTANT udp_rslat : VitalStateTableType (1 TO 12, 1 TO 5) := (
--      NOT      R       S      Q(t)  Q(t+1)
     (  'X',    '-',    '-',    '-',    'X'  ),
     (  '-',    '-',    '1',    '-',    '1'  ),
     (  '-',    '1',    '0',    '-',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '-',    '-',    '-',    'S'  ),
     (  '-',    '0',    '*',    '1',    '1'  ),
     (  '-',    '*',    '0',    '0',    '0'  ),
     (  '-',    '-',    '0',    '0',    '0'  ),
     (  '-',    '0',    '-',    '1',    '1'  ),
     (  '-',    '*',    '-',    '-',    'X'  ),
     (  '-',    '-',    '*',    '-',    'X'  ) );


end prim;

package body prim is

end prim;
LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADDB is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OEN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_PAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39839 ns, 1.49437 ns);
             tpd_OEN_PAD : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.765176 ns, 1.33656 ns, 0.554259 ns, 1.42903 ns);
             tpd_PAD_Y : VitalDelayType01 := (0.088699 ns, 0.324281 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OEN : in std_ulogic := 'U' ;
         Y : out std_ulogic ;
         PAD : inout std_ulogic);

   attribute VITAL_LEVEL0 of PADDB : entity is TRUE;
end PADDB;

architecture behavioral of PADDB is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OEN_ipd : std_ulogic := 'X';
   SIGNAL PAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OEN_ipd, OEN, tipd_OEN );
   VitalWireDelay( PAD_ipd, PAD, tipd_PAD );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OEN_ipd, PAD_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUFIF0(A_ipd, OEN_ipd);

          Y_zd := VitalBUF(PAD_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_PAD),
                             TRUE),
                      1 => ( OEN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OEN_PAD),
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( PAD_ipd'LAST_EVENT,
                             tpd_PAD_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADDI is
   generic (
             tipd_PAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_PAD_Y : VitalDelayType01 := (0.0886494 ns, 0.323938 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         PAD : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of PADDI : entity is TRUE;
end PADDI;

architecture behavioral of PADDI is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL PAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( PAD_ipd, PAD, tipd_PAD );
END BLOCK;

VITALBehavior : PROCESS (PAD_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(PAD_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( PAD_ipd'LAST_EVENT,
                             tpd_PAD_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADDO is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39797 ns, 1.49086 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         PAD : out std_ulogic);

   attribute VITAL_LEVEL0 of PADDO : entity is TRUE;
end PADDO;

architecture behavioral of PADDO is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_PAD,
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity PADDOZ is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OEN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39798 ns, 1.49086 ns);
             tpd_OEN_PAD : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.765215 ns, 1.33668 ns, 0.554187 ns, 1.42538 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OEN : in std_ulogic := 'U' ;
         PAD : out std_ulogic);

   attribute VITAL_LEVEL0 of PADDOZ : entity is TRUE;
end PADDOZ;

architecture behavioral of PADDOZ is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OEN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OEN_ipd, OEN, tipd_OEN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OEN_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUFIF0(A_ipd, OEN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_PAD),
                             TRUE),
                      1 => ( OEN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OEN_PAD),
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity IORINGDB is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OEN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_PAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39839 ns, 1.49438 ns);
             tpd_OEN_PAD : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.765176 ns, 1.33656 ns, 0.554245 ns, 1.42903 ns);
             tpd_PAD_Y : VitalDelayType01 := (0.088699 ns, 0.324281 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OEN : in std_ulogic := 'U' ;
         Y : out std_ulogic ;
         PAD : inout std_ulogic);

   attribute VITAL_LEVEL0 of IORINGDB : entity is TRUE;
end IORINGDB;

architecture behavioral of IORINGDB is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OEN_ipd : std_ulogic := 'X';
   SIGNAL PAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OEN_ipd, OEN, tipd_OEN );
   VitalWireDelay( PAD_ipd, PAD, tipd_PAD );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OEN_ipd, PAD_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUFIF0(A_ipd, OEN_ipd);

          Y_zd := VitalBUF(PAD_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_PAD),
                             TRUE),
                      1 => ( OEN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OEN_PAD),
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );

          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( PAD_ipd'LAST_EVENT,
                             tpd_PAD_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity IORINGDI is
   generic (
             tipd_PAD : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_PAD_Y : VitalDelayType01 := (0.0886745 ns, 0.323938 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         PAD : in std_ulogic := 'U' ;
         Y : out std_ulogic);

   attribute VITAL_LEVEL0 of IORINGDI : entity is TRUE;
end IORINGDI;

architecture behavioral of IORINGDI is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL PAD_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( PAD_ipd, PAD, tipd_PAD );
END BLOCK;

VITALBehavior : PROCESS (PAD_ipd)


      -- functionality section variables
      VARIABLE Y_zd : std_ulogic;

      -- path delay section variables
      VARIABLE Y_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          Y_zd := VitalBUF(PAD_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => Y,
               OutSignalName => "Y",
               OutTemp => Y_zd,
               Paths => (
                      0 => ( PAD_ipd'LAST_EVENT,
                             tpd_PAD_Y,
                             TRUE)),
               GlitchData => Y_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity IORINGDO is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39797 ns, 1.49086 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         PAD : out std_ulogic);

   attribute VITAL_LEVEL0 of IORINGDO : entity is TRUE;
end IORINGDO;

architecture behavioral of IORINGDO is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
END BLOCK;

VITALBehavior : PROCESS (A_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUF(A_ipd);


          -- Path delay section
          VitalPathDelay01(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             tpd_A_PAD,
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


LIBRARY IEEE;
USE IEEE.Std_logic_1164.all;
USE IEEE.VITAL_Timing.all;
USE IEEE.VITAL_Primitives.all;
USE work.prim.all;

entity IORINGDOZ is
   generic (
             tipd_A : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tipd_OEN : VitalDelayType01 := (DefDummyIpd, DefDummyIpd);
             tpd_A_PAD : VitalDelayType01 := (1.39798 ns, 1.49064 ns);
             tpd_OEN_PAD : VitalDelayType01Z := (VitalZeroDelay, VitalZeroDelay, 0.765215 ns, 1.33668 ns, 0.554191 ns, 1.42539 ns);

             XOn            : BOOLEAN := DefCombSpikeXOn;
             MsgOn          : BOOLEAN := DefCombSpikeMsgOn;
             instancePath   : STRING  := "*" );

   port (
         A : in std_ulogic := 'U' ;
         OEN : in std_ulogic := 'U' ;
         PAD : out std_ulogic);

   attribute VITAL_LEVEL0 of IORINGDOZ : entity is TRUE;
end IORINGDOZ;

architecture behavioral of IORINGDOZ is
   attribute VITAL_LEVEL1 of behavioral : architecture is TRUE;

   SIGNAL A_ipd : std_ulogic := 'X';
   SIGNAL OEN_ipd : std_ulogic := 'X';

begin

--Input Path Delays
WIREDELAY : BLOCK
BEGIN
   VitalWireDelay( A_ipd, A, tipd_A );
   VitalWireDelay( OEN_ipd, OEN, tipd_OEN );
END BLOCK;

VITALBehavior : PROCESS (A_ipd, OEN_ipd)


      -- functionality section variables
      VARIABLE PAD_zd : std_ulogic;

      -- path delay section variables
      VARIABLE PAD_GlitchData : VitalGlitchDataType;

      BEGIN
          -- Functionality section
          PAD_zd := VitalBUFIF0(A_ipd, OEN_ipd);


          -- Path delay section
          VitalPathDelay01Z(
               OutSignal     => PAD,
               OutSignalName => "PAD",
               OutTemp => PAD_zd,
               Paths => (
                      0 => ( A_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_A_PAD),
                             TRUE),
                      1 => ( OEN_ipd'LAST_EVENT,
                             VitalExtendToFillDelay(tpd_OEN_PAD),
                             TRUE)),
               GlitchData => PAD_GlitchData,
               Mode  => OnEvent,
               XOn            => XOn,
               MsgOn          => MsgOn,
               MsgSeverity    => WARNING );


END PROCESS;

end behavioral;


