(define (reverse items)
  (define (reverse-helper items result)
    (if (null? items)
      result
      (reverse-helper (cdr items) (cons (car items) result))))
  (reverse-helper items '()))

(define (deep-reverse items)
  (define (deep-reverse-helper items result)
    (if (null? items)
      result
      (deep-reverse-helper 
        (cdr items) 
        (cons 
          (if (pair? (car items))
            (deep-reverse (car items))
            (car items))
          result))))
  (deep-reverse-helper items '()))

(define x (list (list 1 2) (list 3 4)))
