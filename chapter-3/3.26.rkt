#lang racket
(require scheme/mpair)
(define (make-table)
  
  (define entry car)
  (define (left-branch x) (mcar (mcdr x)))
  (define (right-branch x) (mcdr (mcdr x)))
  (define (make-tree entry left right)
    (mcons entry (mcons left right)))
  (define (make-entry key value) (cons key value))
  (define (tree-entry tree) (mcar tree))
  (define (tree-branch tree) (mcdr tree))
  (define (entry-key entry) (car entry))
  (define (entry-value entry) (cdr entry))

  (let ((local-table (make-tree '() '() '() )))
    (define (insert! tree entry)
      (cond [(null? (tree-entry tree))
             (set-mcar! tree entry)]
            [(= (entry-key entry) (entry-key (tree-entry tree))) (set-mcar! tree entry)]
            [(> (entry-key entry) (entry-key (tree-entry tree)))
             (if (null? (right-branch tree))
                 (set-mcdr! (tree-branch tree) (make-tree entry
                                                            '()
                                                            '()))
                 (insert! (right-branch tree) entry))]
            [(< (entry-key entry) (entry-key (tree-entry tree)))
             (if (null? (left-branch tree))
                 (set-mcar! (tree-branch tree) (make-tree entry
                                                            '()
                                                            '()))
                 (insert! (left-branch tree) entry))]
            [else
             (error "What happended?!")])
       'insert-done)
    (define (lookup tree key)
      (if (or (null? tree) (null? (tree-entry tree)))
          #f
          (let ((tree-key (entry-key (tree-entry tree)))
                (tree-value (entry-value (tree-entry tree))))
            (cond [(= key tree-key) tree-value]
                  [(< key tree-key) (lookup (left-branch tree) key)]
                  [(> key tree-key) (lookup (right-branch tree) key)]
                  [else
                   (error "???")]))))
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) (lambda(entry)(lookup local-table entry)))
            ((eq? m 'insert-proc!) (lambda(key)(insert! local-table key)))
            (else (error "Unknown operation: TABLE" m))))
    dispatch))

(define (lookup table key)
  ((table 'lookup-proc) key))

(define (insert! table key value)
  ((table 'insert-proc!) (cons key value)))
