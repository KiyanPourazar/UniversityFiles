library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity division is
    port (
        A        : in std_logic_vector(7 downto 0);
        B        : in std_logic_vector(7 downto 0);
        clk      : in std_logic;
        Y        : out std_logic_vector(7 downto 0);
        OverFlow : out std_logic
    );
end division;

architecture Behavioral of division is
    type states is (S, D, R);
begin
    process (A, B ,clk)
	 variable EAQ : std_logic_vector(8 downto 0);
	 variable state : states := S;
    begin
        if rising_edge(clk) then
            case state is
                when S =>
                    EAQ(8) := '0';
                    EAQ(7 downto 0) :=  A;
                    EAQ(8 downto 4):=  std_logic_vector(unsigned(EAQ(8 downto 4)) + not unsigned(B(3 downto 0)) + 1);
                    state := D;
                when D =>
                    if (EAQ(8) = '1') then                         
                        EAQ(7 downto 4):=  std_logic_vector(unsigned(EAQ(7 downto 4)) + unsigned(B(3 downto 0)));       
                        Y <=  (others => '0');
                        OverFlow <= '1'; 
                    else
                        EAQ(7 downto 4) :=  std_logic_vector(unsigned(EAQ(7 downto 4)) + unsigned(B(3 downto 0)));
                        for i in 0 to 3 loop
                            EAQ :=  std_logic_vector(shift_left(unsigned(EAQ), 1));
                            if (EAQ(8) = '0') then
                                EAQ(8 downto 4):=  std_logic_vector(unsigned(EAQ(8 downto 4)) + not unsigned(B(3 downto 0)) + 1);
                                if (EAQ(8) = '0') then
                                    EAQ(0) :=  '0';          
                                    EAQ(7 downto 4):=  std_logic_vector(unsigned(EAQ(7 downto 4)) + unsigned(B(3 downto 0)));
                                else
                                    EAQ(0) :=  '1';
                                end if;
                            else
                                EAQ(8 downto 4):=  std_logic_vector(unsigned(EAQ(8 downto 4)) + not unsigned(B(3 downto 0)) + 1);
                                EAQ(0):=  '1';                           
                            end if;
                        end loop;
                        state :=  R;
                    end if;
                when R =>
                    Y <= EAQ(7 downto 0);
                    OverFlow <= '0';
            end case;    
        end if; 
    end process;
end Behavioral;
