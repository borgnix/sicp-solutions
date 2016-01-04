#lang racket
(require "2.40.rkt")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda(position) (safe? k position))
         (flatmap
          (lambda(rest-of-queens)
            (map(lambda(new-row)
                  (adjoin-position
                   new-row k rest-of-queens))
                (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (adjoin-position row col rest)
  (cons (cons row col) rest))

(define (safe? k position)
  (define dangerous-row ;generates all dangers row.
    (flatmap (lambda(chess)
               (let ((offset (- k (cdr chess)))
                     (coord (car chess)))
                 (list coord (+ coord offset) (- coord offset))))
             (cdr position)))
  (let ((k-row (caar position)))
    (define (iter d-row)
      (cond [(null? d-row)
             #t]
            [(= k-row (car d-row)) #f]
            [else
             (iter (cdr d-row))]))
    (iter dangerous-row)))

(queens 8)
