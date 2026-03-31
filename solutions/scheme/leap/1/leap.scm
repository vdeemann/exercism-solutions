(import (rnrs))

(define (leap-year? year)
  (if (and (and (div-by-4? year) (div-by-100? year)) (div-by-400? year)) #t 
      (if (and (div-by-4? year) (not (div-by-100? year))) #t #f)))

(define (div-by-4? year)
  (if (= (modulo year 4) 0) #t #f))

(define (div-by-100? year)
  (if (= (modulo year 100) 0) #t #f))

(define (div-by-400? year)
  (if (= (modulo year 400) 0) #t #f))

; modulo code found here
; https://stackoverflow.com/a/60892769/8706936
(define (modulo a b)
  (- a (* b (floor (/ a b)))))