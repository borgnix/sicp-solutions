#lang racket
(require scheme/mpair)
(require "dlist.rkt")


(define (front-ptr queue) (mcar queue))

(define (rear-ptr queue) (mcdr queue))

(define (set-front-ptr! queue item)
  (set-mcar! queue item))

(define (set-rear-ptr! queue item)
  (set-mcdr! queue item))

(define (empty-deque? queue)
  (and (eq? (front-ptr queue) (rear-ptr queue))
       (null? (get-value (front-ptr queue)))))

(define (make-deque)
  (let ((dlist (make-dlist)))
    (mcons dlist dlist)))

(define (front-deque queue)
  (if (empty-deque? queue)
      (error "FRONT CALLED WITH AN EMPTY QUEUE" queue)
      (get-value (front-ptr queue))))

(define (rear-deque queue)
  (if (empty-deque? queue)
      (error "FRONT CALLED WITH AN EMPTY QUEUE" queue)
      (get-value (rear-ptr queue))))

(define (front-insert-deque! queue item)
  (let ((new-pair (insert-back-dlist! (rear-ptr queue) item )))
    (cond [(empty-deque? queue)
           (begin new-pair
                  queue)]
          [else(begin
                 (set-rear-ptr! queue new-pair)
                 'front-insert-done)])))

(define (rear-insert-deque! queue item)
  (let ((new-pair (insert-front-dlist! (front-ptr queue) item)))
    (cond [(empty-deque? queue)
           (begin new-pair
                  queue)]
          [else(begin
                 (set-front-ptr! queue new-pair)
                 'rear-insert-done)])))

(define (front-delete-deque! queue)
  (if (empty-deque? queue)
      (error "delete! called with empty queue" queue)
      (begin (set-mcar! (front-ptr queue) '())
             (if (empty-deque? queue)
                 '()
                 (set-front-ptr! queue (next (front-ptr queue))))
             'front-delete-done)))

(define (rear-delete-deque! queue)
  (if (empty-deque? queue)
      (error "delete! called with empty queue" queue)
      (begin (set-mcar! (rear-ptr queue) '())
             (if (empty-deque? queue)
                 '()
                 (set-rear-ptr! queue (prev (rear-ptr queue))))
             'rear-delete-done)))

(define (print-deque dl)
  (define (iter node)
    (if (eq? (rear-ptr dl) node)
        (cons (mcar node) '())
        (cons (mcar node) (iter (next node)))))
  (if (empty-deque? dl)
      '()
      (iter (front-ptr dl))))

(define dl (make-deque))
(print-deque dl)
(empty-deque? dl)
(front-insert-deque! dl 'a)
(print-deque dl)
(front-insert-deque! dl 'v)
(print-deque dl)
(empty-deque? dl)
(rear-insert-deque! dl 'z)
(print-deque dl)
(rear-insert-deque! dl 'q)
(print-deque dl)
(empty-deque? dl)
(front-delete-deque! dl)
(print-deque dl)
(rear-delete-deque! dl)
(print-deque dl)
(front-delete-deque! dl)
(print-deque dl)
(rear-delete-deque! dl)
(print-deque dl)
(empty-deque? dl)

