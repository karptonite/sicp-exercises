(define (reverser sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (reversel sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
