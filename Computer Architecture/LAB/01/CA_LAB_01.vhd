library IEEE;
use IEEE.std_logic_1164.all;
Entity and_gate is
    Port(
        A, B: in std_logic;
        C : out std_logic
    );
End entity and_gate;
Architecture gatelevel of and_gate is
Begin
    C <= A and B;
End gatelevel;
"-----------------------------------------------------"
library IEEE;
use IEEE.std_logic_1164.all;
Entity or_gate is
    Port(
        A, B: in std_logic;
        C : out std_logic
    );
End entity or_gate;
Architecture gatelevel of or_gate is
Begin
    C <= A or B;
End gatelevel;
"-----------------------------------------------------"

library IEEE;
use IEEE.std_logic_1164.all;
Entity xor_gate is
    Port(
        A, B: in std_logic;
        C : out std_logic
    );
End entity xor_gate;
Architecture gatelevel of xor_gate is
Begin
    C <= A xor B;
End gatelevel;
"-----------------------------------------------------"

library ieee;
use ieee.std_logic_1164.all;
entity half_adder is
    Port(
        in1, in2: in std_logic;
        out1, out2 : out std_logic
    );
end entity half_adder;
architecture structure of half_adder is
    component xor_gate is
        Port(
            A, B: in std_logic;
            C : out std_logic
        );
    End component xor_gate;
    component and_gate is
        Port(
            A, B: in std_logic;
            C : out std_logic
        );
    End component and_gate;
begin
xor_gate_instance0: xor_gate port map ( A => in1, B => in2, C=>out1 );
and_gate_instance0: and_gate port map ( A => in1, B => in2, C=>out2 );
end structure;
"-----------------------------------------------------"

library ieee;
use ieee.std_logic_1164.all;
entity full_adder is
    Port(
        i0, i1, cin: in std_logic;
        s, cout : out std_logic
    );
end entity full_adder;
architecture structure of full_adder is
    component or_gate is
        Port(
            A, B: in std_logic;
            C : out std_logic
        );
    End component or_gate;
    component half_adder is
        Port(
            in1, in2: in std_logic;
            out1, out2 : out std_logic
        );
    end component half_adder;
signal internal_signal0, internal_signal1, internal_signal2: std_logic;
begin
half_adder_instance0: half_adder port map ( in1 => i0, in2 => i1, out1 => internal_signal0, out2 => internal_signal1);
half_adder_instance1: half_adder port map ( in1 => internal_signal0, in2 => cin, out1 => s, out2 => internal_signal2);
or_gate_instance0: or_gate port map ( A => internal_signal1, B => internal_signal2, C => cout );
end structure;