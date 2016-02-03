#lang racket
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define call-the-cops (lambda (x) "Stay where you are, cops are coming!"))
  (define incorrect-times 0)
  (define (dispatch user-password m)
    (if  (not (eq? password user-password))
         (begin (set! incorrect-times (+ incorrect-times 1))
                (if (>= incorrect-times 7)
                    call-the-cops
                    (lambda (x) "incorrect password")))
         (begin (set! incorrect-times 0)
                (cond[(eq? m 'withdraw) withdraw]
                     [(eq? m 'deposit) deposit]
                     [else (error "Unknown request: MAKE-ACCOUNT"
                                  m)]))))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)

