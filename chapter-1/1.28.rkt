#lang racket
(define (non-trival-sqrt-check x n)
  (if (and (= (remainder x n) 1) (not (or (= x 1) (= x (- n 1)))))
      0
      (square x)))

(define (expmod base exp m)
  (cond [(= exp 0) 1]
        [(even? exp)
         (remainder
            (non-trival-sqrt-check (expmod base (/ exp 2) m) m)
          m)]
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (square x)
  (* x x))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond [(= times 0) #t]
        [(miller-rabin-test n) (fast-prime? n (- times 1))]
        [else
         #f]))

(define (timed-prime-test n)
  (time (fast-prime? n 10)))

(timed-prime-test 3)
(timed-prime-test 5)
(timed-prime-test 11)
(timed-prime-test 561)