#کیان پورآذر
#40131403

def longest_common_subsequence(s1, s2):
    m = len(s1)
    n = len(s2)
    
    lcs_lengths = [[0] * (n + 1) for _ in range(m + 1)]
    
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            if s1[i - 1] == s2[j - 1]:
                lcs_lengths[i][j] = lcs_lengths[i - 1][j - 1] + 1
            else:
                lcs_lengths[i][j] = max(lcs_lengths[i - 1][j], lcs_lengths[i][j - 1])
    
    length_lcs = lcs_lengths[m][n]
    
    lcs = []
    i, j = m, n
    while i > 0 and j > 0:
        if s1[i - 1] == s2[j - 1]:
            lcs.append(s1[i - 1])
            i -= 1
            j -= 1
        elif lcs_lengths[i - 1][j] >= lcs_lengths[i][j - 1]:
            i -= 1
        else:
            j -= 1
    
    lcs.reverse()
    lcs_str = ''.join(lcs)
    
    return lcs_str

# Example:

s1 = input("first:")        #input: "abcdefg"
s2 = input("second:")       #input: "abghxfwg"

result = longest_common_subsequence(s1, s2)
print(f"The longest common subsequence is: {result}")

#output:

#The longest common subsequence is: abfg