#lang racket
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)

(define right-branch cadr)

(define branch-length car)

(define branch-structure cadr)

(define (total-weight mobile)
  (+ (weight (left-branch mobile))
     (weight (right-branch mobile))))

(define (weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (balanced? mobile)
  (define (torque branch)
    (* (branch-length branch)
       (weight branch)))
  (define (balanced-branch? branch)
    (if (pair? (branch-structure branch))
        (balanced? (branch-structure branch))
        #t))
  (and (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       (balanced-branch? (left-branch mobile))
       (balanced-branch? (right-branch mobile))))

;We just to need change selectors.

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(define c (make-mobile (make-branch 5 a) (make-branch 3 b)))
(total-weight a)
(total-weight b)
(total-weight c)
(balanced? a)
(balanced? b)
(balanced? c)