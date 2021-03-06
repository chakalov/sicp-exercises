(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; normal order
(gcd 206 40)

; gcd 206 40
(if (= 40 0)
    206
    (gcd 40
         (remainder 206 40)))

; gcd 40 6
; 1 op
(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40)
         (remainder 40 (remainder 206 40))))

; gcd 6 4
; 2 ops
(if (= (remainder 40 (remainder 206 40)) 0)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
         (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

; gcd 4 2
; 4 ops
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

; gcd 2 0
; 7 ops
(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
    (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
    (gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
         (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

; 4 ops
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
2

; total ops = + 1 2 4 7 4 = 18

; applicative order
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))
(gcd 40 (remainder 206 40))
(gcd 40 6) ; 1 operation

(if (= 6 0)
    40
    (gcd 6 (remainder 40 6)))
(gcd 6 (remainder 40 6))
(gcd 6 4) ; 1 operation

(if (= 4 0)
    6
    (gcd 4 (remainder 6 4)))
(gcd 4 (remainder 6 4))
(gcd 4 2) ; 1 operation

(if (= 2 0)
    4
    (gcd 2 (remainder 4 2)))
(gcd 2 (remainder 4 2))
(gcd 2 0) ; 1 operation

(if (= 0 0)
    2
    (gcd 0 (remainder 2 0)))
2

; total ops = + 1 1 1 1 = 4