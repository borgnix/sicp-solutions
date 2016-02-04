#lang racket
(require scheme/mpair)
(provide (all-defined-out))

(define (prev node)
  (mcar (mcdr node)))

(define (next node)
  (mcdr (mcdr node)))

(define (get-value node)
  (mcar node))

(define (make-dlist) (mcons '() (mcons '() '())))

(define (insert-back-dlist! node value)
  (if (null? (get-value node))
      (begin (set-mcar! node value)
             node)
      (let ((new-pair (mcons value (mcons node (next node)))))
        (begin (set-mcdr! (mcdr node) new-pair)
               new-pair))))

(define (insert-front-dlist! node value)
  (if (null? (get-value node))
      (begin (set-mcar! node value)
             node)
      (let ((new-pair (mcons value (mcons (prev node) node))))
        (begin (set-mcar! (mcdr node) new-pair)
               new-pair))))
