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
  (define (dispatch user-password m)
    (cond [(not (eq? password user-password))
           (lambda (x) "Incorrect password")]
          [(eq? m 'withdraw) withdraw]
          [(eq? m 'deposit) deposit]
          [else (error "Unknown request: MAKE-ACCOUNT"
                       m)]))
  dispatch)

(define (make-joint acc old-pass new-pass)
  (define (dispatch user-password m)
    (if (eq? user-password new-pass)
        (acc old-pass m)
        (lambda (x) "Incorrect password")))
  dispatch)

(define peter-acc (make-account 100 'open-sesame))

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))


                                