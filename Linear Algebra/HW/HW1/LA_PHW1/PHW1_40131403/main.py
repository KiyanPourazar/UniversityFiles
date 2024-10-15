import numpy

class function_main:
    def __init__(self, index: list = None, func: str = None):
        if index is not None and func is not None:
            self.index = index
            self.func = func
            self.left_func = self.func.split('->')[0].strip()
            self.right_func = self.func.split('->')[1].strip()
            self.answer = {}
            self.mat = numpy.ndarray([])
            self.due_mat()
            self.original_mat = self.mat.copy()
            self.echelon_form(self.mat)
            self.reduce_echelon()

    def echelon_form(self, mat: numpy.ndarray) -> None:
        r, c = mat.shape
        if r == 0 or c == 0:
            return

        if mat[0, 0] == 0:
            for j in range(1, r):
                if mat[j, 0] != 0:
                    mat[[0, j]] = mat[[j, 0]]  
                    break

        for j in range(1, r):
            if mat[j, 0] != 0:
                multiplier = -mat[j, 0] / mat[0, 0]
                mat[j] += multiplier * mat[0]

        return self.echelon_form(mat[1:, 1:])
    
    def reduce_echelon(self, mat: numpy.ndarray = None):
        if mat is None:
            mat = self.mat

        n, p = mat.shape
        for i in range(n):
            pivot = -1
            for j in range(p):
                if mat[i, j] != 0:
                    pivot = j
                    break

            if pivot != -1:
                mat[i] /= mat[i, pivot]

                for k in range(i):
                    mat[k] -= mat[k, pivot] * mat[i]

    def due_mat(self) -> None:
        self.equational_answer()
        n = 0
        for i in self.left_func.split('+'):
            for j in i.split():
                index = self.index.index(j[0])
                if len(j) == 1:
                    self.mat[index][n] = 1
                else:
                    self.mat[index][n] = int(j[1])
            n += 1
        for i in self.right_func.split('+'):
            for j in i.split():
                index = self.index.index(j[0])
                if len(j) == 1:
                    self.mat[index][n] = -1
                else:
                    self.mat[index][n] = int(j[1]) * -1
            n += 1

    def equational_answer(self) -> None:
        row_num = len(self.index)
        col_num = len(self.func.split('+')) + len(self.func.split('->')) - 1
        self.mat = numpy.zeros((row_num, col_num + 1))

    def set_answer(self) -> None:
        r, c = self.mat.shape
        formula = self.l_func + ' + ' + self.r_func
        for i in range(1, len(formula.split('+')) + 1):
            self.answer.update({f'X{i}': []})

        for i in range(r):
            for j in range(i, c):
                if self.mat[i, j] not in [1, 0]:
                    self.answer.get(f'X{i + 1}').append(-self.mat[i, j])

    def print_answer(self) -> None:
        for k, v in self.answer.items():
            if len(v) != 0:
                print(k, '=', sum(v))
            else:
                print(k, '=', 1)

    @staticmethod
    def print_mat(mat: numpy.ndarray) -> None:
        r, c = mat.shape
        for i in range(r):
            print('[ ', end="")
            for j in range(c):
                if mat[i, j] == int(mat[i, j]):
                    print(int(mat[i, j]), end=' ')
                else:
                    print(mat[i, j], end=' ')
            print(']')

# Usage:
ce = function_main(input().split(), input())

print("\nEquation Answer:")
ce.print_answer()

print("\nOriginal Matrix:")
function_main.print_mat(ce.original_mat)

print("\nReduce Echelon Matrix:")
function_main.print_mat(ce.mat)
