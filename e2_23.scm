(define (my-for-each proc items)
  (cond ((null? items) true)
        (else
         (proc (car items))
         (my-for-each proc (cdr items)))))

(define (display-line x)
  (newline)
  (display x))


