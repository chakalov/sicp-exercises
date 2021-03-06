(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (fermat-iter a)
  	(cond ((= a n) #t)
  	      ((try-it a) (fermat-iter (+ a 1)))
  	      (else #f)))
  (fermat-iter 2))

; #t
(fermat-test 2)
(fermat-test 173)

; #f
(fermat-test 121)
(fermat-test 1024)

; #t
(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)