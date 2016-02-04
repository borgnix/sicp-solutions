#lang racket
;queue implemented by mutable pairs.
(require scheme/mpair)
(provide (all-defined-out))
(define (front-ptr queue) (mcar queue))

(define (rear-ptr queue) (mcdr queue))

(define (set-front-ptr! queue item)
  (set-mcar! queue item))

(define (set-rear-ptr! queue item)
  (set-mcdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (make-queue) (mcons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT CALLED WITH AN EMPTY QUEUE" queue)
      (mcar (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (mcons item '())))
    (cond [(empty-queue? queue)
        (begin
          (set-front-ptr! queue new-pair)
          (set-rear-ptr! queue new-pair)
          queue)]
        [else(begin
          (set-mcdr! (rear-ptr queue) new-pair)
          (set-rear-ptr! queue new-pair)
          queue)])))

(define (delete-queue! queue)
  (if (empty-queue? queue)
      (error "delete! called with empty queue" queue)
      (begin (set-front-ptr! queue (mcdr (front-ptr queue)))
             queue)))
