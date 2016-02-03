#lang racket
(define rand
  (let ((x random-init))
    (lambda (input)
      (cond [(eq? input 'generate)
             (begin (set! x (rand-update x))
               x)]
            [(eq? input 'reset)
             (lambda (new-value)
               (begin (set! x new-value)
                      x))]
            [else
             (error "Bad Type")]))))