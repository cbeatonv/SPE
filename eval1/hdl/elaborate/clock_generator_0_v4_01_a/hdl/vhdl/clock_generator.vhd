------------------------------------------------------------------------------
-- Z:/eval1/hdl/elaborate/clock_generator_0_v4_01_a/hdl/vhdl/clock_generator.vhd
------------------------------------------------------------------------------

-- ClkGen Wrapper HDL file generated by ClkGen's TCL generator 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.numeric_std.all;

library Unisim;
use Unisim.vcomponents.all;

library clock_generator_v4_01_a;
use clock_generator_v4_01_a.all;


entity clock_generator is
  generic (
    C_FAMILY           : string   := "spartan3e" ;
    C_DEVICE           : string   := "3s1600e";
    C_PACKAGE          : string   := "fg320";
    C_SPEEDGRADE       : string   := "-4";
    C_CLK_GEN          : string   := "PASSED"
  );
  port (
    -- clock generation
    CLKIN                         : in  std_logic;
    CLKOUT0                       : out std_logic;
    CLKOUT1                       : out std_logic;
    CLKOUT2                       : out std_logic;
    CLKOUT3                       : out std_logic;
    CLKOUT4                       : out std_logic;
    CLKOUT5                       : out std_logic;
    CLKOUT6                       : out std_logic;
    CLKOUT7                       : out std_logic;
    CLKOUT8                       : out std_logic;
    CLKOUT9                       : out std_logic;
    CLKOUT10                      : out std_logic;
    CLKOUT11                      : out std_logic;
    CLKOUT12                      : out std_logic;
    CLKOUT13                      : out std_logic;
    CLKOUT14                      : out std_logic;
    CLKOUT15                      : out std_logic;
    -- external feedback 
    CLKFBIN                       : in  std_logic;
    CLKFBOUT                      : out std_logic;
    -- variable phase shift
    PSCLK                         : in  std_logic;
    PSEN                          : in  std_logic;
    PSINCDEC                      : in  std_logic;
    PSDONE                        : out std_logic;
    -- reset
    RST                           : in  std_logic;
    LOCKED                        : out std_logic
  );
end clock_generator;


architecture STRUCTURE of clock_generator is


  ----------------------------------------------------------------------------
  -- Components ( copy from entity, exact the same in low level parameters )
  ----------------------------------------------------------------------------

  component dcm_module is
    generic (
      C_DFS_FREQUENCY_MODE    : string  := "LOW";
      C_DLL_FREQUENCY_MODE    : string  := "LOW";
      C_DUTY_CYCLE_CORRECTION : boolean := true;
      C_CLKIN_DIVIDE_BY_2     : boolean := false;
      C_CLK_FEEDBACK          : string  := "1X";
      C_CLKOUT_PHASE_SHIFT    : string  := "NONE";
      C_DSS_MODE              : string  := "NONE";
      C_STARTUP_WAIT          : boolean := false;
      C_PHASE_SHIFT           : integer := 0;
      C_CLKFX_MULTIPLY        : integer := 4;
      C_CLKFX_DIVIDE          : integer := 1;
      C_CLKDV_DIVIDE          : real    := 2.0;
      C_CLKIN_PERIOD          : real    := 41.6666666;
      C_DESKEW_ADJUST         : string  := "SYSTEM_SYNCHRONOUS";
      C_CLKIN_BUF             : boolean := false;
      C_CLKFB_BUF             : boolean := false;
      C_CLK0_BUF              : boolean := false;
      C_CLK90_BUF             : boolean := false;
      C_CLK180_BUF            : boolean := false;
      C_CLK270_BUF            : boolean := false;
      C_CLKDV_BUF             : boolean := false;
      C_CLK2X_BUF             : boolean := false;
      C_CLK2X180_BUF          : boolean := false;
      C_CLKFX_BUF             : boolean := false;
      C_CLKFX180_BUF          : boolean := false;
      C_EXT_RESET_HIGH        : integer := 1;
      C_FAMILY                : string  := "spartan6"
      );
    port (
      RST      : in  std_logic;
      CLKIN    : in  std_logic;
      CLKFB    : in  std_logic;
      PSEN     : in  std_logic;
      PSINCDEC : in  std_logic;
      PSCLK    : in  std_logic;
      DSSEN    : in  std_logic;
      CLK0     : out std_logic;
      CLK90    : out std_logic;
      CLK180   : out std_logic;
      CLK270   : out std_logic;
      CLKDV    : out std_logic;
      CLK2X    : out std_logic;
      CLK2X180 : out std_logic;
      CLKFX    : out std_logic;
      CLKFX180 : out std_logic;
      STATUS   : out std_logic_vector(7 downto 0);
      LOCKED   : out std_logic;
      PSDONE   : out std_logic
      );
  end component;


  ----------------------------------------------------------------------------
  -- Functions
  ----------------------------------------------------------------------------

  -- Note : The string functions are put here to remove dependency to other pcore level libraries

  function UpperCase_Char(char : character) return character is
  begin
    -- If char is not an upper case letter then return char
    if char < 'a' or char > 'z' then
      return char;
    end if;
    -- Otherwise map char to its corresponding lower case character and
    -- return that
    case char is
      when 'a'    => return 'A'; when 'b' => return 'B'; when 'c' => return 'C'; when 'd' => return 'D';
      when 'e'    => return 'E'; when 'f' => return 'F'; when 'g' => return 'G'; when 'h' => return 'H';
      when 'i'    => return 'I'; when 'j' => return 'J'; when 'k' => return 'K'; when 'l' => return 'L';
      when 'm'    => return 'M'; when 'n' => return 'N'; when 'o' => return 'O'; when 'p' => return 'P';
      when 'q'    => return 'Q'; when 'r' => return 'R'; when 's' => return 'S'; when 't' => return 'T';
      when 'u'    => return 'U'; when 'v' => return 'V'; when 'w' => return 'W'; when 'x' => return 'X';
      when 'y'    => return 'Y'; when 'z' => return 'Z';
      when others => return char;
    end case;
  end UpperCase_Char;

  function UpperCase_String (s : string) return string is
    variable res               : string(s'range);
  begin  -- function LoweerCase_String
    for I in s'range loop
      res(I) := UpperCase_Char(s(I));
    end loop;  -- I
    return res;
  end function UpperCase_String;

  -- Returns true if case insensitive string comparison determines that
  -- str1 and str2 are equal
  function equalString( str1, str2 : string ) return boolean is
    constant len1                  : integer := str1'length;
    constant len2                  : integer := str2'length;
    variable equal                 : boolean := true;
  begin
    if not (len1 = len2) then
      equal := false;
    else
      for i in str1'range loop
        if not (UpperCase_Char(str1(i)) = UpperCase_Char(str2(i))) then
          equal := false;
        end if;
      end loop;
    end if;

    return equal;
  end equalString;


  ----------------------------------------------------------------------------
  -- Signals
  ----------------------------------------------------------------------------

  -- signals: gnd

  signal net_gnd0  : std_logic;
  signal net_gnd1  : std_logic_vector(0 to 0);
  signal net_gnd16 : std_logic_vector(0 to 15);

  -- signals: vdd

  signal net_vdd0  : std_logic;


  -- signals : DCM0 wrapper
 
  signal   SIG_DCM0_RST              : std_logic;
  signal   SIG_DCM0_CLKIN            : std_logic;
  signal   SIG_DCM0_CLKFB            : std_logic;
  signal   SIG_DCM0_PSEN             : std_logic;
  signal   SIG_DCM0_PSINCDEC         : std_logic;
  signal   SIG_DCM0_PSCLK            : std_logic;
  signal   SIG_DCM0_DSSEN            : std_logic;
  signal   SIG_DCM0_CLK0             : std_logic;
  signal   SIG_DCM0_CLK90            : std_logic;
  signal   SIG_DCM0_CLK180           : std_logic;
  signal   SIG_DCM0_CLK270           : std_logic;
  signal   SIG_DCM0_CLKDV            : std_logic;
  signal   SIG_DCM0_CLKDV180         : std_logic;
  signal   SIG_DCM0_CLK2X            : std_logic;
  signal   SIG_DCM0_CLK2X180         : std_logic;
  signal   SIG_DCM0_CLKFX            : std_logic;
  signal   SIG_DCM0_CLKFX180         : std_logic;
  signal   SIG_DCM0_STATUS           : std_logic;
  signal   SIG_DCM0_LOCKED           : std_logic;
  signal   SIG_DCM0_PSDONE           : std_logic;

  signal   SIG_DCM0_CLK0_BUF         : std_logic;
  signal   SIG_DCM0_CLK90_BUF        : std_logic;
  signal   SIG_DCM0_CLK180_BUF       : std_logic;
  signal   SIG_DCM0_CLK270_BUF       : std_logic;
  signal   SIG_DCM0_CLKDV_BUF        : std_logic;
  signal   SIG_DCM0_CLKDV180_BUF     : std_logic;
  signal   SIG_DCM0_CLK2X_BUF        : std_logic;
  signal   SIG_DCM0_CLK2X180_BUF     : std_logic;
  signal   SIG_DCM0_CLKFX_BUF        : std_logic;
  signal   SIG_DCM0_CLKFX180_BUF     : std_logic;


  -- signals : DCM1 wrapper
 
  signal   SIG_DCM1_RST              : std_logic;
  signal   SIG_DCM1_CLKIN            : std_logic;
  signal   SIG_DCM1_CLKFB            : std_logic;
  signal   SIG_DCM1_PSEN             : std_logic;
  signal   SIG_DCM1_PSINCDEC         : std_logic;
  signal   SIG_DCM1_PSCLK            : std_logic;
  signal   SIG_DCM1_DSSEN            : std_logic;
  signal   SIG_DCM1_CLK0             : std_logic;
  signal   SIG_DCM1_CLK90            : std_logic;
  signal   SIG_DCM1_CLK180           : std_logic;
  signal   SIG_DCM1_CLK270           : std_logic;
  signal   SIG_DCM1_CLKDV            : std_logic;
  signal   SIG_DCM1_CLKDV180         : std_logic;
  signal   SIG_DCM1_CLK2X            : std_logic;
  signal   SIG_DCM1_CLK2X180         : std_logic;
  signal   SIG_DCM1_CLKFX            : std_logic;
  signal   SIG_DCM1_CLKFX180         : std_logic;
  signal   SIG_DCM1_STATUS           : std_logic;
  signal   SIG_DCM1_LOCKED           : std_logic;
  signal   SIG_DCM1_PSDONE           : std_logic;

  signal   SIG_DCM1_CLK0_BUF         : std_logic;
  signal   SIG_DCM1_CLK90_BUF        : std_logic;
  signal   SIG_DCM1_CLK180_BUF       : std_logic;
  signal   SIG_DCM1_CLK270_BUF       : std_logic;
  signal   SIG_DCM1_CLKDV_BUF        : std_logic;
  signal   SIG_DCM1_CLKDV180_BUF     : std_logic;
  signal   SIG_DCM1_CLK2X_BUF        : std_logic;
  signal   SIG_DCM1_CLK2X180_BUF     : std_logic;
  signal   SIG_DCM1_CLKFX_BUF        : std_logic;
  signal   SIG_DCM1_CLKFX180_BUF     : std_logic;


begin


  ----------------------------------------------------------------------------
  -- GND and VCC signals
  ----------------------------------------------------------------------------

  net_gnd0           <= '0';
  net_gnd1(0 to 0)   <= B"0";
  net_gnd16(0 to 15) <= B"0000000000000000";

  net_vdd0           <= '1';


  ----------------------------------------------------------------------------
  -- DCM wrappers
  ----------------------------------------------------------------------------


  -- DCM0 wrapper
 
  DCM0_INST : dcm_module
    generic map (
      C_DFS_FREQUENCY_MODE => "LOW",
      C_DLL_FREQUENCY_MODE => "LOW",
      C_DUTY_CYCLE_CORRECTION => true,
      C_CLKIN_DIVIDE_BY_2 => false,
      C_CLK_FEEDBACK => "1X",
      C_CLKOUT_PHASE_SHIFT => "NONE",
      C_DSS_MODE => "NONE",
      C_STARTUP_WAIT => false,
      C_PHASE_SHIFT => 0,
      C_CLKFX_MULTIPLY => 4,
      C_CLKFX_DIVIDE => 1,
      C_CLKDV_DIVIDE => 2.0,
      C_CLKIN_PERIOD => 10.000000,
      C_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_CLKIN_BUF => false,
      C_CLKFB_BUF => false,
      C_CLK0_BUF => false,
      C_CLK90_BUF => false,
      C_CLK180_BUF => false,
      C_CLK270_BUF => false,
      C_CLKDV_BUF => false,
      C_CLK2X_BUF => false,
      C_CLK2X180_BUF => false,
      C_CLKFX_BUF => false,
      C_CLKFX180_BUF => false,
      C_EXT_RESET_HIGH => 0,
      C_FAMILY => "spartan3e"
      )
    port map (
      RST                      => SIG_DCM0_RST,
      CLKIN                    => SIG_DCM0_CLKIN,
      CLKFB                    => SIG_DCM0_CLKFB,
      PSEN                     => SIG_DCM0_PSEN,
      PSINCDEC                 => SIG_DCM0_PSINCDEC,
      PSCLK                    => SIG_DCM0_PSCLK,
      DSSEN                    => net_gnd0,
      CLK0                     => SIG_DCM0_CLK0,
      CLK90                    => SIG_DCM0_CLK90,
      CLK180                   => open,
      CLK270                   => open,
      CLKDV                    => SIG_DCM0_CLKDV,
      CLK2X                    => SIG_DCM0_CLK2X,
      CLK2X180                 => open,
      CLKFX                    => SIG_DCM0_CLKFX,   
      CLKFX180                 => open,
      STATUS                   => open, 
      LOCKED                   => SIG_DCM0_LOCKED,
      PSDONE                   => SIG_DCM0_PSDONE
      );


  -- wrapper of clkout : CLK0 and clkinv : CLK180


  DCM0_CLK0_BUFG_INST : BUFG
    port map (
      I => SIG_DCM0_CLK0,
      O => SIG_DCM0_CLK0_BUF
      );


  SIG_DCM0_CLK180 <= NOT SIG_DCM0_CLK0;
  SIG_DCM0_CLK180_BUF <= NOT SIG_DCM0_CLK0_BUF;


  -- wrapper of clkout : CLK90 and clkinv : CLK270


  DCM0_CLK90_BUFG_INST : BUFG
    port map (
      I => SIG_DCM0_CLK90,
      O => SIG_DCM0_CLK90_BUF
      );


  SIG_DCM0_CLK270 <= NOT SIG_DCM0_CLK90;
  SIG_DCM0_CLK270_BUF <= NOT SIG_DCM0_CLK90_BUF;


  -- wrapper of clkout : CLK2X and clkinv : CLK2X180


  SIG_DCM0_CLK2X_BUF <= SIG_DCM0_CLK2X;


  SIG_DCM0_CLK2X180 <= NOT SIG_DCM0_CLK2X;
  SIG_DCM0_CLK2X180_BUF <= NOT SIG_DCM0_CLK2X_BUF;


  -- wrapper of clkout : CLKDV and clkinv : CLKDV180


  SIG_DCM0_CLKDV_BUF <= SIG_DCM0_CLKDV;


  SIG_DCM0_CLKDV180 <= NOT SIG_DCM0_CLKDV;
  SIG_DCM0_CLKDV180_BUF <= NOT SIG_DCM0_CLKDV_BUF;


  -- wrapper of clkout : CLKFX and clkinv : CLKFX180


  SIG_DCM0_CLKFX_BUF <= SIG_DCM0_CLKFX;


  SIG_DCM0_CLKFX180 <= NOT SIG_DCM0_CLKFX;
  SIG_DCM0_CLKFX180_BUF <= NOT SIG_DCM0_CLKFX_BUF;


  -- DCM1 wrapper
 
  DCM1_INST : dcm_module
    generic map (
      C_DFS_FREQUENCY_MODE => "LOW",
      C_DLL_FREQUENCY_MODE => "LOW",
      C_DUTY_CYCLE_CORRECTION => true,
      C_CLKIN_DIVIDE_BY_2 => false,
      C_CLK_FEEDBACK => "1X",
      C_CLKOUT_PHASE_SHIFT => "NONE",
      C_DSS_MODE => "NONE",
      C_STARTUP_WAIT => false,
      C_PHASE_SHIFT => 0,
      C_CLKFX_MULTIPLY => 4,
      C_CLKFX_DIVIDE => 1,
      C_CLKDV_DIVIDE => 2.0,
      C_CLKIN_PERIOD => 20.000000,
      C_DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS",
      C_CLKIN_BUF => false,
      C_CLKFB_BUF => false,
      C_CLK0_BUF => false,
      C_CLK90_BUF => false,
      C_CLK180_BUF => false,
      C_CLK270_BUF => false,
      C_CLKDV_BUF => false,
      C_CLK2X_BUF => false,
      C_CLK2X180_BUF => false,
      C_CLKFX_BUF => false,
      C_CLKFX180_BUF => false,
      C_EXT_RESET_HIGH => 1,
      C_FAMILY => "spartan3e"
      )
    port map (
      RST                      => SIG_DCM1_RST,
      CLKIN                    => SIG_DCM1_CLKIN,
      CLKFB                    => SIG_DCM1_CLKFB,
      PSEN                     => SIG_DCM1_PSEN,
      PSINCDEC                 => SIG_DCM1_PSINCDEC,
      PSCLK                    => SIG_DCM1_PSCLK,
      DSSEN                    => net_gnd0,
      CLK0                     => SIG_DCM1_CLK0,
      CLK90                    => SIG_DCM1_CLK90,
      CLK180                   => open,
      CLK270                   => open,
      CLKDV                    => SIG_DCM1_CLKDV,
      CLK2X                    => SIG_DCM1_CLK2X,
      CLK2X180                 => open,
      CLKFX                    => SIG_DCM1_CLKFX,   
      CLKFX180                 => open,
      STATUS                   => open, 
      LOCKED                   => SIG_DCM1_LOCKED,
      PSDONE                   => SIG_DCM1_PSDONE
      );


  -- wrapper of clkout : CLK0 and clkinv : CLK180


  DCM1_CLK0_BUFG_INST : BUFG
    port map (
      I => SIG_DCM1_CLK0,
      O => SIG_DCM1_CLK0_BUF
      );


  SIG_DCM1_CLK180 <= NOT SIG_DCM1_CLK0;
  SIG_DCM1_CLK180_BUF <= NOT SIG_DCM1_CLK0_BUF;


  -- wrapper of clkout : CLK90 and clkinv : CLK270


  SIG_DCM1_CLK90_BUF <= SIG_DCM1_CLK90;


  SIG_DCM1_CLK270 <= NOT SIG_DCM1_CLK90;
  SIG_DCM1_CLK270_BUF <= NOT SIG_DCM1_CLK90_BUF;


  -- wrapper of clkout : CLK2X and clkinv : CLK2X180


  DCM1_CLK2X_BUFG_INST : BUFG
    port map (
      I => SIG_DCM1_CLK2X,
      O => SIG_DCM1_CLK2X_BUF
      );


  SIG_DCM1_CLK2X180 <= NOT SIG_DCM1_CLK2X;
  SIG_DCM1_CLK2X180_BUF <= NOT SIG_DCM1_CLK2X_BUF;


  -- wrapper of clkout : CLKDV and clkinv : CLKDV180


  SIG_DCM1_CLKDV_BUF <= SIG_DCM1_CLKDV;


  SIG_DCM1_CLKDV180 <= NOT SIG_DCM1_CLKDV;
  SIG_DCM1_CLKDV180_BUF <= NOT SIG_DCM1_CLKDV_BUF;


  -- wrapper of clkout : CLKFX and clkinv : CLKFX180


  SIG_DCM1_CLKFX_BUF <= SIG_DCM1_CLKFX;


  SIG_DCM1_CLKFX180 <= NOT SIG_DCM1_CLKFX;
  SIG_DCM1_CLKFX180_BUF <= NOT SIG_DCM1_CLKFX_BUF;


  ----------------------------------------------------------------------------
  -- PLL wrappers
  ----------------------------------------------------------------------------


  ----------------------------------------------------------------------------
  -- MMCM wrappers
  ----------------------------------------------------------------------------


  ----------------------------------------------------------------------------
  -- DCMs CLKIN, CLKFB and RST signal connection
  ----------------------------------------------------------------------------


  -- DCM0 CLKIN
 
  SIG_DCM0_CLKIN <= SIG_DCM1_CLK2X_BUF;

  -- DCM0 CLKFB
 
  SIG_DCM0_CLKFB <= SIG_DCM0_CLK0_BUF;

  -- DCM0 RST
 
  SIG_DCM0_RST <= SIG_DCM1_LOCKED;



  -- DCM1 CLKIN
 
  SIG_DCM1_CLKIN <= CLKIN;

  -- DCM1 CLKFB
 
  SIG_DCM1_CLKFB <= SIG_DCM1_CLK0_BUF;

  -- DCM1 RST
 
  SIG_DCM1_RST <= RST;



  ----------------------------------------------------------------------------
  -- PLLs CLKIN1, CLKFBIN and RST signal connection
  ----------------------------------------------------------------------------


  ----------------------------------------------------------------------------
  -- MMCMs CLKIN1, CLKFBIN, RST and Variable_Phase_Control signal connection
  ----------------------------------------------------------------------------


  ----------------------------------------------------------------------------
  -- CLKGEN CLKOUT, CLKFBOUT and LOCKED signal connection
  ----------------------------------------------------------------------------

  
  -- CLKGEN CLKOUT

  
  CLKOUT0 <= SIG_DCM0_CLK90_BUF;

  
  CLKOUT1 <= SIG_DCM0_CLK0_BUF;

  
  CLKOUT2 <= SIG_DCM1_CLK0_BUF;

  
  -- CLKGEN CLKFBOUT

  
  -- CLKGEN LOCKED 

  
  LOCKED <= SIG_DCM0_LOCKED and SIG_DCM1_LOCKED; 


end architecture STRUCTURE;


------------------------------------------------------------------------------
-- High level parameters
------------------------------------------------------------------------------

-- C_CLK_GEN = PASSED
-- C_ELABORATE_DIR = 
-- C_ELABORATE_RES = NOT_SET
-- C_FAMILY = spartan3e
-- C_DEVICE = 3s1600e
-- C_PACKAGE = fg320
-- C_SPEEDGRADE = -4

----------------------------------------

-- C_CLKIN_FREQ = 50000000

-- C_CLKOUT0_FREQ = 100000000
-- C_CLKOUT0_PHASE = 90
-- C_CLKOUT0_GROUP = DCM0
-- C_CLKOUT0_BUF = TRUE
-- C_CLKOUT0_VARIABLE_PHASE = FALSE
-- C_CLKOUT1_FREQ = 100000000
-- C_CLKOUT1_PHASE = 0
-- C_CLKOUT1_GROUP = DCM0
-- C_CLKOUT1_BUF = TRUE
-- C_CLKOUT1_VARIABLE_PHASE = FALSE
-- C_CLKOUT2_FREQ = 50000000
-- C_CLKOUT2_PHASE = 0
-- C_CLKOUT2_GROUP = NONE
-- C_CLKOUT2_BUF = TRUE
-- C_CLKOUT2_VARIABLE_PHASE = FALSE
-- C_CLKOUT3_FREQ = 0
-- C_CLKOUT3_PHASE = 0
-- C_CLKOUT3_GROUP = NONE
-- C_CLKOUT3_BUF = TRUE
-- C_CLKOUT3_VARIABLE_PHASE = FALSE
-- C_CLKOUT4_FREQ = 0
-- C_CLKOUT4_PHASE = 0
-- C_CLKOUT4_GROUP = NONE
-- C_CLKOUT4_BUF = TRUE
-- C_CLKOUT4_VARIABLE_PHASE = FALSE
-- C_CLKOUT5_FREQ = 0
-- C_CLKOUT5_PHASE = 0
-- C_CLKOUT5_GROUP = NONE
-- C_CLKOUT5_BUF = TRUE
-- C_CLKOUT5_VARIABLE_PHASE = FALSE
-- C_CLKOUT6_FREQ = 0
-- C_CLKOUT6_PHASE = 0
-- C_CLKOUT6_GROUP = NONE
-- C_CLKOUT6_BUF = TRUE
-- C_CLKOUT6_VARIABLE_PHASE = FALSE
-- C_CLKOUT7_FREQ = 0
-- C_CLKOUT7_PHASE = 0
-- C_CLKOUT7_GROUP = NONE
-- C_CLKOUT7_BUF = TRUE
-- C_CLKOUT7_VARIABLE_PHASE = FALSE
-- C_CLKOUT8_FREQ = 0
-- C_CLKOUT8_PHASE = 0
-- C_CLKOUT8_GROUP = NONE
-- C_CLKOUT8_BUF = TRUE
-- C_CLKOUT8_VARIABLE_PHASE = FALSE
-- C_CLKOUT9_FREQ = 0
-- C_CLKOUT9_PHASE = 0
-- C_CLKOUT9_GROUP = NONE
-- C_CLKOUT9_BUF = TRUE
-- C_CLKOUT9_VARIABLE_PHASE = FALSE
-- C_CLKOUT10_FREQ = 0
-- C_CLKOUT10_PHASE = 0
-- C_CLKOUT10_GROUP = NONE
-- C_CLKOUT10_BUF = TRUE
-- C_CLKOUT10_VARIABLE_PHASE = FALSE
-- C_CLKOUT11_FREQ = 0
-- C_CLKOUT11_PHASE = 0
-- C_CLKOUT11_GROUP = NONE
-- C_CLKOUT11_BUF = TRUE
-- C_CLKOUT11_VARIABLE_PHASE = FALSE
-- C_CLKOUT12_FREQ = 0
-- C_CLKOUT12_PHASE = 0
-- C_CLKOUT12_GROUP = NONE
-- C_CLKOUT12_BUF = TRUE
-- C_CLKOUT12_VARIABLE_PHASE = FALSE
-- C_CLKOUT13_FREQ = 0
-- C_CLKOUT13_PHASE = 0
-- C_CLKOUT13_GROUP = NONE
-- C_CLKOUT13_BUF = TRUE
-- C_CLKOUT13_VARIABLE_PHASE = FALSE
-- C_CLKOUT14_FREQ = 0
-- C_CLKOUT14_PHASE = 0
-- C_CLKOUT14_GROUP = NONE
-- C_CLKOUT14_BUF = TRUE
-- C_CLKOUT14_VARIABLE_PHASE = FALSE
-- C_CLKOUT15_FREQ = 0
-- C_CLKOUT15_PHASE = 0
-- C_CLKOUT15_GROUP = NONE
-- C_CLKOUT15_BUF = TRUE
-- C_CLKOUT15_VARIABLE_PHASE = FALSE

----------------------------------------

-- C_CLKFBIN_FREQ = 0
-- C_CLKFBIN_DESKEW = NONE

-- C_CLKFBOUT_FREQ = 0
-- C_CLKFBOUT_GROUP = NONE
-- C_CLKFBOUT_BUF = TRUE

----------------------------------------

-- C_PSDONE_GROUP = NONE

------------------------------------------------------------------------------
-- Low level parameters
------------------------------------------------------------------------------

-- C_CLKOUT0_MODULE = DCM0
-- C_CLKOUT0_PORT = CLK90B
-- C_CLKOUT1_MODULE = DCM0
-- C_CLKOUT1_PORT = CLK0B
-- C_CLKOUT2_MODULE = DCM1
-- C_CLKOUT2_PORT = CLK0B
-- C_CLKOUT3_MODULE = NONE
-- C_CLKOUT3_PORT = NONE
-- C_CLKOUT4_MODULE = NONE
-- C_CLKOUT4_PORT = NONE
-- C_CLKOUT5_MODULE = NONE
-- C_CLKOUT5_PORT = NONE
-- C_CLKOUT6_MODULE = NONE
-- C_CLKOUT6_PORT = NONE
-- C_CLKOUT7_MODULE = NONE
-- C_CLKOUT7_PORT = NONE
-- C_CLKOUT8_MODULE = NONE
-- C_CLKOUT8_PORT = NONE
-- C_CLKOUT9_MODULE = NONE
-- C_CLKOUT9_PORT = NONE
-- C_CLKOUT10_MODULE = NONE
-- C_CLKOUT10_PORT = NONE
-- C_CLKOUT11_MODULE = NONE
-- C_CLKOUT11_PORT = NONE
-- C_CLKOUT12_MODULE = NONE
-- C_CLKOUT12_PORT = NONE
-- C_CLKOUT13_MODULE = NONE
-- C_CLKOUT13_PORT = NONE
-- C_CLKOUT14_MODULE = NONE
-- C_CLKOUT14_PORT = NONE
-- C_CLKOUT15_MODULE = NONE
-- C_CLKOUT15_PORT = NONE

----------------------------------------

-- C_CLKFBOUT_MODULE = NONE
-- C_CLKFBOUT_PORT = NONE
-- C_CLKFBOUT_get_clkgen_dcm_default_params = NONE

----------------------------------------

-- C_PSDONE_MODULE = NONE

----------------------------------------

-- C_DCM0_DFS_FREQUENCY_MODE = "LOW"
-- C_DCM0_DLL_FREQUENCY_MODE = "LOW"
-- C_DCM0_DUTY_CYCLE_CORRECTION = true
-- C_DCM0_CLKIN_DIVIDE_BY_2 = false
-- C_DCM0_CLK_FEEDBACK = "1X"
-- C_DCM0_CLKOUT_PHASE_SHIFT = "NONE"
-- C_DCM0_DSS_MODE = "NONE"
-- C_DCM0_STARTUP_WAIT = false
-- C_DCM0_PHASE_SHIFT = 0
-- C_DCM0_CLKFX_MULTIPLY = 4
-- C_DCM0_CLKFX_DIVIDE = 1
-- C_DCM0_CLKDV_DIVIDE = 2.0
-- C_DCM0_CLKIN_PERIOD = 10.000000
-- C_DCM0_DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS"
-- C_DCM0_CLKIN_BUF = false
-- C_DCM0_CLKFB_BUF = false
-- C_DCM0_CLK0_BUF = TRUE
-- C_DCM0_CLK90_BUF = TRUE
-- C_DCM0_CLK180_BUF = false
-- C_DCM0_CLK270_BUF = false
-- C_DCM0_CLKDV_BUF = false
-- C_DCM0_CLK2X_BUF = false
-- C_DCM0_CLK2X180_BUF = false
-- C_DCM0_CLKFX_BUF = false
-- C_DCM0_CLKFX180_BUF = false
-- C_DCM0_EXT_RESET_HIGH = 0
-- C_DCM0_FAMILY = "spartan3e"

-- C_DCM0_CLKIN_MODULE = DCM1
-- C_DCM0_CLKIN_PORT = CLK2XB
-- C_DCM0_CLKFB_MODULE = DCM0
-- C_DCM0_CLKFB_PORT = CLK0B
-- C_DCM0_RST_MODULE = DCM1

-- C_DCM1_DFS_FREQUENCY_MODE = "LOW"
-- C_DCM1_DLL_FREQUENCY_MODE = "LOW"
-- C_DCM1_DUTY_CYCLE_CORRECTION = true
-- C_DCM1_CLKIN_DIVIDE_BY_2 = false
-- C_DCM1_CLK_FEEDBACK = "1X"
-- C_DCM1_CLKOUT_PHASE_SHIFT = "NONE"
-- C_DCM1_DSS_MODE = "NONE"
-- C_DCM1_STARTUP_WAIT = false
-- C_DCM1_PHASE_SHIFT = 0
-- C_DCM1_CLKFX_MULTIPLY = 4
-- C_DCM1_CLKFX_DIVIDE = 1
-- C_DCM1_CLKDV_DIVIDE = 2.0
-- C_DCM1_CLKIN_PERIOD = 20.000000
-- C_DCM1_DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS"
-- C_DCM1_CLKIN_BUF = false
-- C_DCM1_CLKFB_BUF = false
-- C_DCM1_CLK0_BUF = TRUE
-- C_DCM1_CLK90_BUF = false
-- C_DCM1_CLK180_BUF = false
-- C_DCM1_CLK270_BUF = false
-- C_DCM1_CLKDV_BUF = false
-- C_DCM1_CLK2X_BUF = TRUE
-- C_DCM1_CLK2X180_BUF = false
-- C_DCM1_CLKFX_BUF = false
-- C_DCM1_CLKFX180_BUF = false
-- C_DCM1_EXT_RESET_HIGH = 1
-- C_DCM1_FAMILY = "spartan3e"

-- C_DCM1_CLKIN_MODULE = CLKGEN
-- C_DCM1_CLKIN_PORT = CLKIN
-- C_DCM1_CLKFB_MODULE = DCM1
-- C_DCM1_CLKFB_PORT = CLK0B
-- C_DCM1_RST_MODULE = CLKGEN

-- C_DCM2_DFS_FREQUENCY_MODE = "LOW"
-- C_DCM2_DLL_FREQUENCY_MODE = "LOW"
-- C_DCM2_DUTY_CYCLE_CORRECTION = true
-- C_DCM2_CLKIN_DIVIDE_BY_2 = false
-- C_DCM2_CLK_FEEDBACK = "1X"
-- C_DCM2_CLKOUT_PHASE_SHIFT = "NONE"
-- C_DCM2_DSS_MODE = "NONE"
-- C_DCM2_STARTUP_WAIT = false
-- C_DCM2_PHASE_SHIFT = 0
-- C_DCM2_CLKFX_MULTIPLY = 4
-- C_DCM2_CLKFX_DIVIDE = 1
-- C_DCM2_CLKDV_DIVIDE = 2.0
-- C_DCM2_CLKIN_PERIOD = 41.6666666
-- C_DCM2_DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS"
-- C_DCM2_CLKIN_BUF = false
-- C_DCM2_CLKFB_BUF = false
-- C_DCM2_CLK0_BUF = false
-- C_DCM2_CLK90_BUF = false
-- C_DCM2_CLK180_BUF = false
-- C_DCM2_CLK270_BUF = false
-- C_DCM2_CLKDV_BUF = false
-- C_DCM2_CLK2X_BUF = false
-- C_DCM2_CLK2X180_BUF = false
-- C_DCM2_CLKFX_BUF = false
-- C_DCM2_CLKFX180_BUF = false
-- C_DCM2_EXT_RESET_HIGH = 1
-- C_DCM2_FAMILY = "spartan3e"

-- C_DCM2_CLKIN_MODULE = NONE
-- C_DCM2_CLKIN_PORT = NONE
-- C_DCM2_CLKFB_MODULE = NONE
-- C_DCM2_CLKFB_PORT = NONE
-- C_DCM2_RST_MODULE = NONE

-- C_DCM3_DFS_FREQUENCY_MODE = "LOW"
-- C_DCM3_DLL_FREQUENCY_MODE = "LOW"
-- C_DCM3_DUTY_CYCLE_CORRECTION = true
-- C_DCM3_CLKIN_DIVIDE_BY_2 = false
-- C_DCM3_CLK_FEEDBACK = "1X"
-- C_DCM3_CLKOUT_PHASE_SHIFT = "NONE"
-- C_DCM3_DSS_MODE = "NONE"
-- C_DCM3_STARTUP_WAIT = false
-- C_DCM3_PHASE_SHIFT = 0
-- C_DCM3_CLKFX_MULTIPLY = 4
-- C_DCM3_CLKFX_DIVIDE = 1
-- C_DCM3_CLKDV_DIVIDE = 2.0
-- C_DCM3_CLKIN_PERIOD = 41.6666666
-- C_DCM3_DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS"
-- C_DCM3_CLKIN_BUF = false
-- C_DCM3_CLKFB_BUF = false
-- C_DCM3_CLK0_BUF = false
-- C_DCM3_CLK90_BUF = false
-- C_DCM3_CLK180_BUF = false
-- C_DCM3_CLK270_BUF = false
-- C_DCM3_CLKDV_BUF = false
-- C_DCM3_CLK2X_BUF = false
-- C_DCM3_CLK2X180_BUF = false
-- C_DCM3_CLKFX_BUF = false
-- C_DCM3_CLKFX180_BUF = false
-- C_DCM3_EXT_RESET_HIGH = 1
-- C_DCM3_FAMILY = "spartan3e"

-- C_DCM3_CLKIN_MODULE = NONE
-- C_DCM3_CLKIN_PORT = NONE
-- C_DCM3_CLKFB_MODULE = NONE
-- C_DCM3_CLKFB_PORT = NONE
-- C_DCM3_RST_MODULE = NONE


----------------------------------------

-- C_PLL0_BANDWIDTH = "OPTIMIZED"
-- C_PLL0_CLKFBOUT_MULT = 1
-- C_PLL0_CLKFBOUT_PHASE = 0.0
-- C_PLL0_CLKIN1_PERIOD = 0.000
-- C_PLL0_CLKOUT0_DIVIDE = 1
-- C_PLL0_CLKOUT0_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT0_PHASE = 0.0
-- C_PLL0_CLKOUT1_DIVIDE = 1
-- C_PLL0_CLKOUT1_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT1_PHASE = 0.0
-- C_PLL0_CLKOUT2_DIVIDE = 1
-- C_PLL0_CLKOUT2_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT2_PHASE = 0.0
-- C_PLL0_CLKOUT3_DIVIDE = 1
-- C_PLL0_CLKOUT3_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT3_PHASE = 0.0
-- C_PLL0_CLKOUT4_DIVIDE = 1
-- C_PLL0_CLKOUT4_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT4_PHASE = 0.0
-- C_PLL0_CLKOUT5_DIVIDE = 1
-- C_PLL0_CLKOUT5_DUTY_CYCLE = 0.5
-- C_PLL0_CLKOUT5_PHASE = 0.0
-- C_PLL0_COMPENSATION = "SYSTEM_SYNCHRONOUS"
-- C_PLL0_DIVCLK_DIVIDE = 1
-- C_PLL0_REF_JITTER = 0.100
-- C_PLL0_RESET_ON_LOSS_OF_LOCK = false
-- C_PLL0_RST_DEASSERT_CLK = "CLKIN1"
-- C_PLL0_CLKOUT0_DESKEW_ADJUST = "NONE"
-- C_PLL0_CLKOUT1_DESKEW_ADJUST = "NONE"
-- C_PLL0_CLKOUT2_DESKEW_ADJUST = "PPC"
-- C_PLL0_CLKOUT3_DESKEW_ADJUST = "PPC"
-- C_PLL0_CLKOUT4_DESKEW_ADJUST = "PPC"
-- C_PLL0_CLKOUT5_DESKEW_ADJUST = "PPC"
-- C_PLL0_CLKFBOUT_DESKEW_ADJUST = "PPC"
-- C_PLL0_CLKIN1_BUF = false
-- C_PLL0_CLKFBOUT_BUF = false
-- C_PLL0_CLKOUT0_BUF = false
-- C_PLL0_CLKOUT1_BUF = false
-- C_PLL0_CLKOUT2_BUF = false
-- C_PLL0_CLKOUT3_BUF = false
-- C_PLL0_CLKOUT4_BUF = false
-- C_PLL0_CLKOUT5_BUF = false
-- C_PLL0_EXT_RESET_HIGH = 1
-- C_PLL0_FAMILY = "spartan3e"

-- C_PLL0_CLKIN1_MODULE = NONE
-- C_PLL0_CLKIN1_PORT = NONE
-- C_PLL0_CLKFBIN_MODULE = NONE
-- C_PLL0_CLKFBIN_PORT = NONE
-- C_PLL0_RST_MODULE = NONE

-- C_PLL1_BANDWIDTH = "OPTIMIZED"
-- C_PLL1_CLKFBOUT_MULT = 1
-- C_PLL1_CLKFBOUT_PHASE = 0.0
-- C_PLL1_CLKIN1_PERIOD = 0.000
-- C_PLL1_CLKOUT0_DIVIDE = 1
-- C_PLL1_CLKOUT0_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT0_PHASE = 0.0
-- C_PLL1_CLKOUT1_DIVIDE = 1
-- C_PLL1_CLKOUT1_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT1_PHASE = 0.0
-- C_PLL1_CLKOUT2_DIVIDE = 1
-- C_PLL1_CLKOUT2_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT2_PHASE = 0.0
-- C_PLL1_CLKOUT3_DIVIDE = 1
-- C_PLL1_CLKOUT3_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT3_PHASE = 0.0
-- C_PLL1_CLKOUT4_DIVIDE = 1
-- C_PLL1_CLKOUT4_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT4_PHASE = 0.0
-- C_PLL1_CLKOUT5_DIVIDE = 1
-- C_PLL1_CLKOUT5_DUTY_CYCLE = 0.5
-- C_PLL1_CLKOUT5_PHASE = 0.0
-- C_PLL1_COMPENSATION = "SYSTEM_SYNCHRONOUS"
-- C_PLL1_DIVCLK_DIVIDE = 1
-- C_PLL1_REF_JITTER = 0.100
-- C_PLL1_RESET_ON_LOSS_OF_LOCK = false
-- C_PLL1_RST_DEASSERT_CLK = "CLKIN1"
-- C_PLL1_CLKOUT0_DESKEW_ADJUST = "NONE"
-- C_PLL1_CLKOUT1_DESKEW_ADJUST = "NONE"
-- C_PLL1_CLKOUT2_DESKEW_ADJUST = "PPC"
-- C_PLL1_CLKOUT3_DESKEW_ADJUST = "PPC"
-- C_PLL1_CLKOUT4_DESKEW_ADJUST = "PPC"
-- C_PLL1_CLKOUT5_DESKEW_ADJUST = "PPC"
-- C_PLL1_CLKFBOUT_DESKEW_ADJUST = "PPC"
-- C_PLL1_CLKIN1_BUF = false
-- C_PLL1_CLKFBOUT_BUF = false
-- C_PLL1_CLKOUT0_BUF = false
-- C_PLL1_CLKOUT1_BUF = false
-- C_PLL1_CLKOUT2_BUF = false
-- C_PLL1_CLKOUT3_BUF = false
-- C_PLL1_CLKOUT4_BUF = false
-- C_PLL1_CLKOUT5_BUF = false
-- C_PLL1_EXT_RESET_HIGH = 1
-- C_PLL1_FAMILY = "spartan3e"

-- C_PLL1_CLKIN1_MODULE = NONE
-- C_PLL1_CLKIN1_PORT = NONE
-- C_PLL1_CLKFBIN_MODULE = NONE
-- C_PLL1_CLKFBIN_PORT = NONE
-- C_PLL1_RST_MODULE = NONE


----------------------------------------

-- C_MMCM0_BANDWIDTH = "OPTIMIZED"
-- C_MMCM0_CLKFBOUT_MULT_F = 1.0
-- C_MMCM0_CLKFBOUT_PHASE = 0.0
-- C_MMCM0_CLKFBOUT_USE_FINE_PS = false
-- C_MMCM0_CLKIN1_PERIOD = 0.000
-- C_MMCM0_CLKOUT0_DIVIDE_F = 1.0
-- C_MMCM0_CLKOUT0_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT0_PHASE = 0.0
-- C_MMCM0_CLKOUT1_DIVIDE = 1
-- C_MMCM0_CLKOUT1_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT1_PHASE = 0.0
-- C_MMCM0_CLKOUT2_DIVIDE = 1
-- C_MMCM0_CLKOUT2_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT2_PHASE = 0.0
-- C_MMCM0_CLKOUT3_DIVIDE = 1
-- C_MMCM0_CLKOUT3_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT3_PHASE = 0.0
-- C_MMCM0_CLKOUT4_DIVIDE = 1
-- C_MMCM0_CLKOUT4_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT4_PHASE = 0.0
-- C_MMCM0_CLKOUT4_CASCADE = false
-- C_MMCM0_CLKOUT5_DIVIDE = 1
-- C_MMCM0_CLKOUT5_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT5_PHASE = 0.0
-- C_MMCM0_CLKOUT6_DIVIDE = 1
-- C_MMCM0_CLKOUT6_DUTY_CYCLE = 0.5
-- C_MMCM0_CLKOUT6_PHASE = 0.0
-- C_MMCM0_CLKOUT0_USE_FINE_PS = false
-- C_MMCM0_CLKOUT1_USE_FINE_PS = false
-- C_MMCM0_CLKOUT2_USE_FINE_PS = false
-- C_MMCM0_CLKOUT3_USE_FINE_PS = false
-- C_MMCM0_CLKOUT4_USE_FINE_PS = false
-- C_MMCM0_CLKOUT5_USE_FINE_PS = false
-- C_MMCM0_CLKOUT6_USE_FINE_PS = false
-- C_MMCM0_COMPENSATION = "ZHOLD"
-- C_MMCM0_DIVCLK_DIVIDE = 1
-- C_MMCM0_REF_JITTER1 = 0.010
-- C_MMCM0_CLKIN1_BUF = false
-- C_MMCM0_CLKFBOUT_BUF = false
-- C_MMCM0_CLKOUT0_BUF = false
-- C_MMCM0_CLKOUT1_BUF = false
-- C_MMCM0_CLKOUT2_BUF = false
-- C_MMCM0_CLKOUT3_BUF = false
-- C_MMCM0_CLKOUT4_BUF = false
-- C_MMCM0_CLKOUT5_BUF = false
-- C_MMCM0_CLKOUT6_BUF = false
-- C_MMCM0_CLOCK_HOLD = false
-- C_MMCM0_STARTUP_WAIT = false
-- C_MMCM0_EXT_RESET_HIGH = 1
-- C_MMCM0_FAMILY = "spartan3e"

-- C_MMCM0_CLKIN1_MODULE = NONE
-- C_MMCM0_CLKIN1_PORT = NONE
-- C_MMCM0_CLKFBIN_MODULE = NONE
-- C_MMCM0_CLKFBIN_PORT = NONE
-- C_MMCM0_RST_MODULE = NONE

-- C_MMCM1_BANDWIDTH = "OPTIMIZED"
-- C_MMCM1_CLKFBOUT_MULT_F = 1.0
-- C_MMCM1_CLKFBOUT_PHASE = 0.0
-- C_MMCM1_CLKFBOUT_USE_FINE_PS = false
-- C_MMCM1_CLKIN1_PERIOD = 0.000
-- C_MMCM1_CLKOUT0_DIVIDE_F = 1.0
-- C_MMCM1_CLKOUT0_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT0_PHASE = 0.0
-- C_MMCM1_CLKOUT1_DIVIDE = 1
-- C_MMCM1_CLKOUT1_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT1_PHASE = 0.0
-- C_MMCM1_CLKOUT2_DIVIDE = 1
-- C_MMCM1_CLKOUT2_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT2_PHASE = 0.0
-- C_MMCM1_CLKOUT3_DIVIDE = 1
-- C_MMCM1_CLKOUT3_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT3_PHASE = 0.0
-- C_MMCM1_CLKOUT4_DIVIDE = 1
-- C_MMCM1_CLKOUT4_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT4_PHASE = 0.0
-- C_MMCM1_CLKOUT4_CASCADE = false
-- C_MMCM1_CLKOUT5_DIVIDE = 1
-- C_MMCM1_CLKOUT5_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT5_PHASE = 0.0
-- C_MMCM1_CLKOUT6_DIVIDE = 1
-- C_MMCM1_CLKOUT6_DUTY_CYCLE = 0.5
-- C_MMCM1_CLKOUT6_PHASE = 0.0
-- C_MMCM1_CLKOUT0_USE_FINE_PS = false
-- C_MMCM1_CLKOUT1_USE_FINE_PS = false
-- C_MMCM1_CLKOUT2_USE_FINE_PS = false
-- C_MMCM1_CLKOUT3_USE_FINE_PS = false
-- C_MMCM1_CLKOUT4_USE_FINE_PS = false
-- C_MMCM1_CLKOUT5_USE_FINE_PS = false
-- C_MMCM1_CLKOUT6_USE_FINE_PS = false
-- C_MMCM1_COMPENSATION = "ZHOLD"
-- C_MMCM1_DIVCLK_DIVIDE = 1
-- C_MMCM1_REF_JITTER1 = 0.010
-- C_MMCM1_CLKIN1_BUF = false
-- C_MMCM1_CLKFBOUT_BUF = false
-- C_MMCM1_CLKOUT0_BUF = false
-- C_MMCM1_CLKOUT1_BUF = false
-- C_MMCM1_CLKOUT2_BUF = false
-- C_MMCM1_CLKOUT3_BUF = false
-- C_MMCM1_CLKOUT4_BUF = false
-- C_MMCM1_CLKOUT5_BUF = false
-- C_MMCM1_CLKOUT6_BUF = false
-- C_MMCM1_CLOCK_HOLD = false
-- C_MMCM1_STARTUP_WAIT = false
-- C_MMCM1_EXT_RESET_HIGH = 1
-- C_MMCM1_FAMILY = "spartan3e"

-- C_MMCM1_CLKIN1_MODULE = NONE
-- C_MMCM1_CLKIN1_PORT = NONE
-- C_MMCM1_CLKFBIN_MODULE = NONE
-- C_MMCM1_CLKFBIN_PORT = NONE
-- C_MMCM1_RST_MODULE = NONE

-- C_MMCM2_BANDWIDTH = "OPTIMIZED"
-- C_MMCM2_CLKFBOUT_MULT_F = 1.0
-- C_MMCM2_CLKFBOUT_PHASE = 0.0
-- C_MMCM2_CLKFBOUT_USE_FINE_PS = false
-- C_MMCM2_CLKIN1_PERIOD = 0.000
-- C_MMCM2_CLKOUT0_DIVIDE_F = 1.0
-- C_MMCM2_CLKOUT0_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT0_PHASE = 0.0
-- C_MMCM2_CLKOUT1_DIVIDE = 1
-- C_MMCM2_CLKOUT1_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT1_PHASE = 0.0
-- C_MMCM2_CLKOUT2_DIVIDE = 1
-- C_MMCM2_CLKOUT2_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT2_PHASE = 0.0
-- C_MMCM2_CLKOUT3_DIVIDE = 1
-- C_MMCM2_CLKOUT3_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT3_PHASE = 0.0
-- C_MMCM2_CLKOUT4_DIVIDE = 1
-- C_MMCM2_CLKOUT4_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT4_PHASE = 0.0
-- C_MMCM2_CLKOUT4_CASCADE = false
-- C_MMCM2_CLKOUT5_DIVIDE = 1
-- C_MMCM2_CLKOUT5_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT5_PHASE = 0.0
-- C_MMCM2_CLKOUT6_DIVIDE = 1
-- C_MMCM2_CLKOUT6_DUTY_CYCLE = 0.5
-- C_MMCM2_CLKOUT6_PHASE = 0.0
-- C_MMCM2_CLKOUT0_USE_FINE_PS = false
-- C_MMCM2_CLKOUT1_USE_FINE_PS = false
-- C_MMCM2_CLKOUT2_USE_FINE_PS = false
-- C_MMCM2_CLKOUT3_USE_FINE_PS = false
-- C_MMCM2_CLKOUT4_USE_FINE_PS = false
-- C_MMCM2_CLKOUT5_USE_FINE_PS = false
-- C_MMCM2_CLKOUT6_USE_FINE_PS = false
-- C_MMCM2_COMPENSATION = "ZHOLD"
-- C_MMCM2_DIVCLK_DIVIDE = 1
-- C_MMCM2_REF_JITTER1 = 0.010
-- C_MMCM2_CLKIN1_BUF = false
-- C_MMCM2_CLKFBOUT_BUF = false
-- C_MMCM2_CLKOUT0_BUF = false
-- C_MMCM2_CLKOUT1_BUF = false
-- C_MMCM2_CLKOUT2_BUF = false
-- C_MMCM2_CLKOUT3_BUF = false
-- C_MMCM2_CLKOUT4_BUF = false
-- C_MMCM2_CLKOUT5_BUF = false
-- C_MMCM2_CLKOUT6_BUF = false
-- C_MMCM2_CLOCK_HOLD = false
-- C_MMCM2_STARTUP_WAIT = false
-- C_MMCM2_EXT_RESET_HIGH = 1
-- C_MMCM2_FAMILY = "spartan3e"

-- C_MMCM2_CLKIN1_MODULE = NONE
-- C_MMCM2_CLKIN1_PORT = NONE
-- C_MMCM2_CLKFBIN_MODULE = NONE
-- C_MMCM2_CLKFBIN_PORT = NONE
-- C_MMCM2_RST_MODULE = NONE

-- C_MMCM3_BANDWIDTH = "OPTIMIZED"
-- C_MMCM3_CLKFBOUT_MULT_F = 1.0
-- C_MMCM3_CLKFBOUT_PHASE = 0.0
-- C_MMCM3_CLKFBOUT_USE_FINE_PS = false
-- C_MMCM3_CLKIN1_PERIOD = 0.000
-- C_MMCM3_CLKOUT0_DIVIDE_F = 1.0
-- C_MMCM3_CLKOUT0_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT0_PHASE = 0.0
-- C_MMCM3_CLKOUT1_DIVIDE = 1
-- C_MMCM3_CLKOUT1_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT1_PHASE = 0.0
-- C_MMCM3_CLKOUT2_DIVIDE = 1
-- C_MMCM3_CLKOUT2_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT2_PHASE = 0.0
-- C_MMCM3_CLKOUT3_DIVIDE = 1
-- C_MMCM3_CLKOUT3_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT3_PHASE = 0.0
-- C_MMCM3_CLKOUT4_DIVIDE = 1
-- C_MMCM3_CLKOUT4_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT4_PHASE = 0.0
-- C_MMCM3_CLKOUT4_CASCADE = false
-- C_MMCM3_CLKOUT5_DIVIDE = 1
-- C_MMCM3_CLKOUT5_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT5_PHASE = 0.0
-- C_MMCM3_CLKOUT6_DIVIDE = 1
-- C_MMCM3_CLKOUT6_DUTY_CYCLE = 0.5
-- C_MMCM3_CLKOUT6_PHASE = 0.0
-- C_MMCM3_CLKOUT0_USE_FINE_PS = false
-- C_MMCM3_CLKOUT1_USE_FINE_PS = false
-- C_MMCM3_CLKOUT2_USE_FINE_PS = false
-- C_MMCM3_CLKOUT3_USE_FINE_PS = false
-- C_MMCM3_CLKOUT4_USE_FINE_PS = false
-- C_MMCM3_CLKOUT5_USE_FINE_PS = false
-- C_MMCM3_CLKOUT6_USE_FINE_PS = false
-- C_MMCM3_COMPENSATION = "ZHOLD"
-- C_MMCM3_DIVCLK_DIVIDE = 1
-- C_MMCM3_REF_JITTER1 = 0.010
-- C_MMCM3_CLKIN1_BUF = false
-- C_MMCM3_CLKFBOUT_BUF = false
-- C_MMCM3_CLKOUT0_BUF = false
-- C_MMCM3_CLKOUT1_BUF = false
-- C_MMCM3_CLKOUT2_BUF = false
-- C_MMCM3_CLKOUT3_BUF = false
-- C_MMCM3_CLKOUT4_BUF = false
-- C_MMCM3_CLKOUT5_BUF = false
-- C_MMCM3_CLKOUT6_BUF = false
-- C_MMCM3_CLOCK_HOLD = false
-- C_MMCM3_STARTUP_WAIT = false
-- C_MMCM3_EXT_RESET_HIGH = 1
-- C_MMCM3_FAMILY = "spartan3e"

-- C_MMCM3_CLKIN1_MODULE = NONE
-- C_MMCM3_CLKIN1_PORT = NONE
-- C_MMCM3_CLKFBIN_MODULE = NONE
-- C_MMCM3_CLKFBIN_PORT = NONE
-- C_MMCM3_RST_MODULE = NONE


----------------------------------------

