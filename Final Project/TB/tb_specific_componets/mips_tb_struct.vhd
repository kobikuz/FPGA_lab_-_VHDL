-- VHDL Entity MIPS.MIPS_tb.symbol
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--


ENTITY MIPS_tb IS
-- Declarations

END MIPS_tb ;

--
-- VHDL Architecture MIPS.MIPS_tb.struct
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;

ARCHITECTURE struct OF MIPS_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALU_result_out  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL Branch_out      : STD_LOGIC;
   SIGNAL Instruction_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL Memwrite_out    : STD_LOGIC;
   SIGNAL PC              : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
   SIGNAL Regwrite_out    : STD_LOGIC;
   SIGNAL Zero_out        : STD_LOGIC;
   SIGNAL clock           : STD_LOGIC;
   SIGNAL read_data_1_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL read_data_2_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL reset           : STD_LOGIC;
   SIGNAL write_data_out  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   --NEW
   SIGNAL ALU_ctl_o		: 		 STD_LOGIC_VECTOR( 2 DOWNTO 0 );
   signal Binput_oo : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   signal SHF_RES_o		: STD_LOGIC_VECTOR(31 DOWNTO 0);
   signal read_data_From_bus 		:  STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   --signal R8,R9,R10,R11 			:   std_logic_vector(7 downto 0);
   signal GIE, INTA_o, INTR         :std_logic;
   signal jal_address_o             :std_logic_vector(7 downto 0);
   
   	signal R31          :    std_logic_vector(31 downto 0);
	signal R27          :    std_logic_vector(31 downto 0);
	signal R25          :    std_logic_vector(31 downto 0);


   -- Component Declarations
   COMPONENT MIPS
   PORT( reset, clock					: IN 	STD_LOGIC; 
		-- Output important signals to pins for easy display in Simulator
		PC								: OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 );
		ALU_result_out, read_data_1_out, read_data_2_out, write_data_out,	
     	Instruction_out					: OUT 	STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		Branch_out, Zero_out, Memwrite_out,Memread_out , 
		Regwrite_out					: OUT 	STD_LOGIC ;
		Binput_oo : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		SHF_RES_o		: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		ALU_ctl_o	: 	OUT	 STD_LOGIC_VECTOR( 2 DOWNTO 0 );
		jal_address_o   : out std_logic_vector(7 downto 0);
			
			
			R8          : out   std_logic_vector(7 downto 0);
			R9          : out   std_logic_vector(7 downto 0);
			R10          : out   std_logic_vector(7 downto 0);
			R11          : out   std_logic_vector(7 downto 0);
			R31          :out    std_logic_vector(31 downto 0);
			R27          :out    std_logic_vector(31 downto 0);
			R25          :out    std_logic_vector(31 downto 0);

		read_data_From_bus 				: in STD_LOGIC_VECTOR( 31 DOWNTO 0 );
		-------------------new------------------------------------
		GIE            :out std_logic;
		INTA_o         :out std_logic;
		INTR           :in  std_logic
		
		);
   END COMPONENT;
   COMPONENT MIPS_tester
   PORT (
      clock           : OUT    STD_LOGIC;
      reset           : OUT    STD_LOGIC; 
	  INTR_o          : OUT    STD_LOGIC
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MIPS USE ENTITY work.mips;
   FOR ALL : MIPS_tester USE ENTITY work.mips_tester;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_0 : MIPS
      PORT MAP (
         reset           => reset,
         clock           => clock,
         PC              => PC,
         ALU_result_out  => ALU_result_out,
         read_data_1_out => read_data_1_out,
         read_data_2_out => read_data_2_out,
         write_data_out  => write_data_out,
         Instruction_out => Instruction_out,
         Branch_out      => Branch_out,
         Zero_out        => Zero_out,
         Memwrite_out    => Memwrite_out,
         Regwrite_out    => Regwrite_out,
		 Binput_oo=>		Binput_oo,
		 ALU_ctl_o=>		ALU_ctl_o,
		 read_data_From_bus=>read_data_From_bus,
		 SHF_RES_o		   =>SHF_RES_o,
		 GIE 				=> GIE,
		 INTA_o 			=>INTA_o,
		 INTR				=> INTR,
		 jal_address_o =>jal_address_o,
		 R31			=> R31,
		 R27			=>R27,
		 R25    => R25
		 
		 

      );
   U_1 : MIPS_tester
      PORT MAP (
         clock           => clock,
         reset           => reset,
		 INTR_o   		=>  INTR
      );

END struct;
