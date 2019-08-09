library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
use ieee.numeric_std.all ;
entity ALU is
port (A, B : in unsigned(7 downto 0) ;
        OP : in unsigned(15 downto 0) ;
      clock : in std_logic ;
   R1 : out unsigned(3 downto 0 )  ;
    R2 : out unsigned(3 downto 0 )  ;
    NEG : out std_logic ) ;
end ALU ;
architecture calculation of ALU is
 signal Reg1, Reg2, Result : unsigned(7 downto 0 ) := (others => '0') ;
 signal Reg4 : unsigned ( 0 to 7 ) ;
 begin
  Reg1 <= A ;
  Reg2 <= B ;
 
 process (clock, OP)
 begin
  if(rising_edge(clock)) then
  case OP is
     when "1000000000000000" =>
      NEG <= '0';
      Result <= ( Reg1 + Reg2 ) ;
     
      when "0100000000000000" =>
      if (Reg1 > Reg2) then
      Result <= ( Reg1 - Reg2 ) ;
      else
      Result <= ( Reg2 - Reg1 )  ;
      NEG <= '1';
     end if ;
     
      when "0010000000000000" =>
      NEG <= '0';
      Result <= (not Reg1) ;
     
      when "0001000000000000" =>
      NEG <= '0';
      Result <= ( Reg1 nand Reg2 ) ;
     
      when "0000100000000000" =>
      NEG <= '0';
      Result <= ( Reg1 nor Reg2 ) ;
     
      when "0000010000000000" =>
      NEG <= '0';
      Result <= ( Reg1 and Reg2 ) ;
   
      when "0000001000000000" =>
      NEG <= '0';
      Result <= ( Reg1 xor Reg2 ) ;
     
      when "0000000100000000" =>
      NEG <= '0';
      Result <= ( Reg1 or Reg2 ) ;
     
      when "0000000010000000" =>
      NEG <= '0';
      Result <= ( Reg1 xnor Reg2 ) ;
     
      when others =>
     
end case ;
end if ;
end process ;
    R1 <= Result(3 downto 0 ) ;
    R2 <= Result(7 downto 4 ) ;
end calculation ;    