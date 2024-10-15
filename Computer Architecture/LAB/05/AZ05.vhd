library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Full_Adder;

architecture Gate_Level of Full_Adder is
begin
    Sum <= (A XOR B) XOR Cin;
    Cout <= (A AND B) OR (Cin AND (A XOR B));
end Gate_Level;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Sum : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Half_Adder;

architecture Gate_Level of Half_Adder is
begin
    Sum <= A XOR B;
    Cout <= A AND B;
end Gate_Level;




library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Array_Multiplier is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Result : out STD_LOGIC_VECTOR(7 downto 0));
end Array_Multiplier;

architecture Behavioral of Array_Multiplier is
    signal Partial_Products : std_logic_vector(3 downto 0);
    signal Sum_0, Sum_1, Sum_2, Sum_3, Sum_4 : std_logic_vector(3 downto 0);
begin

    -- Generate Partial Products
    process(A, B)
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                Partial_Products(i*4 + j) <= A(j) AND B(i);
            end loop;
        end loop;
    end process;

    -- Calculate Sums of Partial Products
    Full_Adder_0: entity work.Full_Adder port map (Partial_Products(0), Partial_Products(1), '0', Sum_0(0), Sum_1(0));
    Full_Adder_1: entity work.Full_Adder port map (Partial_Products(2), Partial_Products(3), Sum_0(0), Sum_0(1), Sum_1(1));
    Full_Adder_2: entity work.Full_Adder port map (Partial_Products(4), Partial_Products(5), '0', Sum_2(0), Sum_3(0));
    Full_Adder_3: entity work.Full_Adder port map (Partial_Products(6), Partial_Products(7), Sum_2(0), Sum_2(1), Sum_3(1));
    Full_Adder_4: entity work.Full_Adder port map (Partial_Products(8), Partial_Products(9), '0', Sum_4(0), Result(0));
    Full_Adder_5: entity work.Full_Adder port map (Partial_Products(10), Partial_Products(11), Sum_4(0), Sum_4(1), Result(1));

    -- Propagate Sum of Partial Products
    for i in 1 to 2 loop
        Full_Adder_6: entity work.Full_Adder port map (Sum_0(i), Sum_1(i), Sum_1(i-1), Sum_0(i+1), Sum_1(i+1));
    end loop;
    for i in 1 to 2 loop
        Full_Adder_7: entity work.Full_Adder port map (Sum_2(i), Sum_3(i), Sum_3(i-1), Sum_2(i+1), Sum_3(i+1));
    end loop;

    -- Final Sum
    for i in 1 to 2 loop
        Full_Adder_8: entity work.Full_Adder port map (Sum_1(i+1), Sum_3(i+1), Sum_3(i), Result(i+2), Result(i+3));
    end loop;

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Result : out STD_LOGIC_VECTOR(7 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is
    signal Product : std_logic_vector(7 downto 0);
begin
    process(A, B)
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                if (A(j) = '1' and B(i) = '1') then
                    Product(i+j) <= '1';
                else
                    Product(i+j) <= '0';
                end if;
            end loop;
        end loop;
    end process;

    Result <= Product;
end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Save_Multiplier is
    Port ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Result : out STD_LOGIC_VECTOR(7 downto 0));
end Carry_Save_Multiplier;

architecture Behavioral of Carry_Save_Multiplier is
    signal Partial_Products : std_logic_vector(7 downto 0);
begin
    -- Generate partial products
    process(A, B)
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                Partial_Products(i+j) <= A(j) AND B(i);
            end loop;
        end loop;
    end process;

    -- Sum the partial products using carry-save adder
    Full_Adder_0: entity work.Full_Adder port map (Partial_Products(0), Partial_Products(1), '0', Result(0), Result(1));
    Full_Adder_1: entity work.Full_Adder port map (Partial_Products(2), Partial_Products(3), '0', Result(2), Result(3));
    Full_Adder_2: entity work.Full_Adder port map (Partial_Products(4), Partial_Products(5), '0', Result(4), Result(5));
    Full_Adder_3: entity work.Full_Adder port map (Partial_Products(6), Partial_Products(7), '0', Result(6), Result(7));

end Behavioral;
