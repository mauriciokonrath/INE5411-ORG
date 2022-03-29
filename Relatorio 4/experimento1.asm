 .data
# Arranjo inicializado com elementos N não nulos.
_array: .word 3:7 # N elementos com o valor 3       [substitua N pelo valor definido no relatório]
_size: .word 7  # tamanho do arranjo              [substitua N pelo valor definido no relatório]

.text
.globl main

main:
	la	$a0, _array     # $a0 = &array
	lw  	$a1, _size      # $a1 = size
	jal 	clear1
	li  	$v0,10
	syscall

clear1:
	add 	$t0, $zero, $zero # i=0  [completar com 1 instrução nativa]
loop1:
	slt     $t3, $t0, $a1     # t3 = 1 if i < _size
    	beq     $t3, $zero, Exit  # if i >= _size goto Exit
	sll     $t1, $t0, 2       # t1 = i * 4	add $t2,$a0,$t1        # $t2 = &array[i]                 
	add     $t2, $a0, $t1     # t2 = base of array + offset
	sw 	$zero, 0($t2)     # array[i] = 0                    
	addi 	$t0,$t0, 1       # i++                             [completar operando faltante]                      
	j 	loop1
  
Exit:
	jr 	$ra