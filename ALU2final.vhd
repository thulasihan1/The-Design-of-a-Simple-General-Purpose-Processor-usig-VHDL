library ieee;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;
use ieee.numeric_std.all ;
entity ALU2final is
port (A, B : in unsigned(7 downto 0) ;
        OP : in unsigned(15 downto 0) ;
      clock : in std_logic ;
   R1 : out unsigned(3 downto 0 )  ;
    R2 : out unsigned(3 downto 0 )  ;
    NEG : out std_logic ) ;
end ALU2final ;
architecture calculation of ALU2final is
 signal Reg1, Reg2, Result : unsigned(7 downto 0 ) := (others => '0') ;
 signal Reg4 : unsigned ( 0 to 7 ) ;
 begin
  Reg1 <= A ;
  Reg2 <= B ;

process(Clock, Op)
begin
if(rising_edge(Clock)) then 

Neg <= '0';

case Op is

   WHEN "1000000000000000" => 
	
		Result(0)<= Reg1(0);
		Result(1) <=  Reg2(1);
		Result(2)<= Reg1(2);
		Result(3) <=  Reg2(3);
	Result(4)<= Reg1(4);	
		Result(5) <= Reg2(5);
		Result(6)<= Reg1(6);
	   Result(7) <=  Reg2(7); 
WHEN "0100000000000000" =>
 Result <= (Reg1 NAND Reg2);

WHEN "0010000000000000" => Result<= ((Reg1 + Reg2)-5);
   WHEN "0001000000000000" => 
	Result<=NOT(Reg2)+1;
WHEN "0000100000000000" =>
Result(0)<= (NOT Reg2(0)); 
Result(1)<= (Reg2(1));
Result(2)<= (NOT Reg2(2));
Result(3)<= (Reg2(3));
Result(4)<= (NOT Reg2(4));
Result(5)<= (Reg2(5));
Result(6)<= (NOT Reg2(6));
Result(7)<= (Reg2(7));
   WHEN "0000010000000000" =>
 Result<= Reg2 Sll 2;
WHEN "0000001000000000" =>
Result<= null;
   WHEN "0000000100000000" =>
Result<=NOT(Reg1)+1;
WHEN "0000000010000000" =>
Result<= (Reg2 ror 2) ;

WHEN OTHERS => 
end case;

end if;
end process;

R1 <= Result(3 downto 0);
R2 <= Result(7 downto 4);

end calculation;