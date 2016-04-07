; (define (make-mobile left right)
;   (list left right))

; (define (make-branch length structure)
;   (list length structure))

; (define (left-branch mobile)
;   (list-ref mobile 0))

; (define (right-branch mobile)
;   (list-ref mobile 1))

; (define (branch-length branch)
;   (list-ref branch 0))

; (define (branch-structure branch)
;   (list-ref branch 1))

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch ))

(define (total-weight structure)
  (cond ((pair? structure)
         (+
          (total-weight (branch-structure (left-branch structure)))
          (total-weight (branch-structure (right-branch structure)))))
        (else
         structure)))

(define test-mobile-1
  (make-mobile
    (make-branch 10 10)
    (make-branch 
      5
      (make-mobile
        (make-branch 5 3)
        (make-branch 9 4)))))

(define test-mobile-3
  (make-mobile
    (make-branch 10 10)
    (make-branch 5 20)))

(define test-mobile-3
  (make-mobile
    (make-branch 10 10)
    (make-branch 5 20)))

(define test-mobile-2
  (make-mobile
    (make-branch 10 10)
    (make-branch 
      5
      (make-mobile
        (make-branch 3 5)
        (make-branch 1 15)))))

(define (balanced structure)
  (if (not (pair? structure))
      true
    (and
     (= (* (branch-length (left-branch structure))
           (total-weight (branch-structure (left-branch structure))))
        (* (branch-length (right-branch structure))
           (total-weight (branch-structure (right-branch structure)))))
     (balanced (branch-structure (left-branch structure)))
     (balanced (branch-structure (right-branch structure))))))
