#کیان پورآذر
#40131403

class State:
    def __init__(self, name):
        self.name = name
        self.transitions = {}
        self.is_final = False

    def add_transition(self, symbol, state):
        if symbol in self.transitions:
            self.transitions[symbol].append(state)
        else:
            self.transitions[symbol] = [state]

class NFA:
    def __init__(self, start_state, final_state):
        self.start_state = start_state
        self.final_state = final_state

def regex_to_nfa(regex):
    stack = []
    state_count = 0

    def new_state():
        nonlocal state_count
        state_count += 1
        return State(f"q{state_count}")

    alphabet = set()
    
    for char in regex:
        if char.isalnum():
            alphabet.add(char)
        if char == '*':
            nfa = stack.pop()
            start_state = new_state()
            final_state = new_state()
            start_state.add_transition('', nfa.start_state)
            nfa.final_state.add_transition('', final_state)
            nfa.final_state.add_transition('', nfa.start_state)
            start_state.add_transition('', final_state)
            stack.append(NFA(start_state, final_state))
        elif char == '|':
            nfa2 = stack.pop()
            nfa1 = stack.pop()
            start_state = new_state()
            final_state = new_state()
            start_state.add_transition('', nfa1.start_state)
            start_state.add_transition('', nfa2.start_state)
            nfa1.final_state.add_transition('', final_state)
            nfa2.final_state.add_transition('', final_state)
            stack.append(NFA(start_state, final_state))
        elif char == '.':
            nfa2 = stack.pop()
            nfa1 = stack.pop()
            nfa1.final_state.add_transition('', nfa2.start_state)
            stack.append(NFA(nfa1.start_state, nfa2.final_state))
        else:
            start_state = new_state()
            final_state = new_state()
            start_state.add_transition(char, final_state)
            stack.append(NFA(start_state, final_state))

    final_nfa = stack.pop()
    final_nfa.final_state.is_final = True

    return alphabet, final_nfa

def print_nfa(alphabet, nfa):
    states = set()
    transitions = []
    final_states = set()
    
    def traverse(state):
        if state.name in states:
            return
        states.add(state.name)
        if state.is_final:
            final_states.add(state.name)
        for symbol, next_states in state.transitions.items():
            for next_state in next_states:
                transitions.append((state.name, symbol, next_state.name))
                traverse(next_state)
    
    traverse(nfa.start_state)
    
    print(" ".join(alphabet))
    print(" ".join(sorted(states, key=lambda x: int(x[1:]))))
    print(nfa.start_state.name)
    print(" ".join(sorted(final_states, key=lambda x: int(x[1:]))))
    for (src, symbol, dst) in transitions:
        print(f"{src} {symbol if symbol else 'λ'} {dst}")

#Example
regex = input() #input: "ab*a"
alphabet, nfa = regex_to_nfa(regex)
print_nfa(alphabet, nfa)



#output:

#a b
#q7 q8
#q7
#q8
#q7 a q8