library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity division is
    port (
        A        : in std_logic_vector(7 downto 0);
        B        : in std_logic_vector(3 downto 0);
        Q        : out std_logic_vector(3 downto 0);
        R        : out std_logic_vector(3 downto 0);
        OverFlow : out std_logic
    );
end division;

architecture Behavioral of division is

begin

    process (A,	 B)

        variable EAQ : std_logic_vector(8 downto 0);

    begin

        EAQ(8)          := '0';
        EAQ(7 downto 0) := A;
		  

        EAQ(8 downto 4) := (EAQ(8 downto 4) + not(B)) + 1; 

        if (EAQ(8) = '1') then                         
            EAQ(7 downto 4) := EAQ(7 downto 4) + B;       

            Q        <= "ZZZZ";
            R        <= "ZZZZ";
            OverFlow <= '1';                        
        else                                   
            EAQ(7 downto 4) := EAQ(7 downto 4) + B;

            for i in 0 to 3 loop

                EAQ := to_stdlogicvector(to_bitvector(EAQ) sll 1);

                if (EAQ(8) = '0') then
                    EAQ(8 downto 4) := (EAQ(8 downto 4) + not(B)) + 1;
                    if (EAQ(8) = '0') then
                        EAQ(0):= '0';          
                        EAQ(7 downto 4) := EAQ(7 downto 4) + B;
                    else
                        EAQ(0) := '1';
                    end if;

                else
                    EAQ(8 downto 4) := (EAQ(8 downto 4) + not(B)) + 1;
                    EAQ(0)          := '1';                           
                end if;
            end loop;

            Q        <= EAQ(3 downto 0);
            R        <= EAQ(7 downto 4);
            OverFlow <= '0'; 

        end if;

    end process;

end Behavioral;