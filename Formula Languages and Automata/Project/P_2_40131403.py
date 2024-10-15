#کیان پورآذر
#40131403

class CFGtoNPDA:
    def __init__(self, terminals, non_terminals, start_symbol, productions):
        self.terminals = terminals
        self.non_terminals = non_terminals
        self.start_symbol = start_symbol
        self.productions = productions
        self.states = set()
        self.transitions = []
        self.start_state = '0'
        self.accept_state = '-1'
        self.stack_start_symbol = '$'

    def create_npda(self):
        self.states = {'0', '1', '2', '-1'}
        self.transitions.append((0, '', None, 1, f'PUSH({self.start_symbol}{self.stack_start_symbol})'))
        
        for lhs, rhs_list in self.productions.items():
            for rhs in rhs_list:
                self.transitions.append((1, '', lhs, 1, f'PUSH({rhs})'))
        
        for terminal in self.terminals:
            self.transitions.append((1, terminal, terminal, 2, 'POP'))
        
        self.transitions.append((1, 'ε', self.stack_start_symbol, 2, 'POP'))
        self.transitions.append((2, 'ε', None, -1, 'NONE'))

    def display_npda(self):
        for transition in self.transitions:
            print(", ".join(map(str, transition)))

def parse_input(lines):
    terminals = set()
    non_terminals = set()
    production_rules = {}
    start_symbol = None

    for line in lines:
        line = line.strip()
        if not line:
            continue
        lhs, rhs = line.split('[')
        lhs = lhs.strip()
        rhs = rhs.strip(']').split(',')
        
        if start_symbol is None:
            start_symbol = lhs
        
        if lhs not in production_rules:
            production_rules[lhs] = []
        production_rules[lhs].extend(rhs)

        non_terminals.add(lhs)
        for symbol in rhs:
            if symbol.islower():
                terminals.add(symbol)
            elif symbol.isupper():
                non_terminals.add(symbol)
            elif symbol == 'ε':
                production_rules[lhs].append('')
    
    return terminals, non_terminals, start_symbol, production_rules

#Example
print("Enter the grammar rules (empty line to finish):")    #input: S [a,A,b]
input_lines = []                                                   #A [a,S,b]
while True:                                                        #A [ε]
    line = input()
    if line.strip() == '':
        break
    input_lines.append(line)

terminals, non_terminals, start_symbol, productions = parse_input(input_lines)

cfg_to_npda = CFGtoNPDA(terminals, non_terminals, start_symbol, productions)
cfg_to_npda.create_npda()
cfg_to_npda.display_npda()



#output:

#0, , None, 1, PUSH(S$)
#1, , S, 1, PUSH(a)
#1, , S, 1, PUSH(A)
#1, , S, 1, PUSH(b)
#1, , A, 1, PUSH(a)
#1, , A, 1, PUSH(S)
#1, , A, 1, PUSH(b)
#1, , A, 1, PUSH(ε)
#1, ε, ε, 2, POP
#1, b, b, 2, POP
#1, a, a, 2, POP
#1, ε, $, 2, POP
#2, ε, None, -1, NONE

