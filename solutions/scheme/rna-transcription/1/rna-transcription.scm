(import (rnrs))

; helper function is used to convert dna into a list
(define (dna->rna dna)
  (define dna-list (string->list dna))
  (define (helper dna-list)
    (cond
      ((= (string-length dna) 0) "")
      ((eqv? dna-list '()) "")
      ((eqv? (car dna-list) #\C) (string-append "G" (helper(cdr dna-list))))
      ((eqv? (car dna-list) #\G) (string-append "C" (helper(cdr dna-list))))
      ((eqv? (car dna-list) #\T) (string-append "A" (helper(cdr dna-list))))
      ((eqv? (car dna-list) #\A) (string-append "U" (helper(cdr dna-list))))
      (else #f))
    )
  (helper dna-list)
  )