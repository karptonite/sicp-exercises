(define (enumerate-interval i j)
  (if (> i j)
    '()
    (cons i (enumerate-interval (+ 1 i) j))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (pair)
             (map (lambda (j) (cons j pair))
                  (enumerate-interval (+ 1 (car pair)) n)))
           (unique-pairs n)))

(define (unique-triple-sums limit sum)
  (filter (sum-equals-s? sum) (unique-triples limit)))

(define (sum-equals-s? s)
  (lambda (items) (sum-equals? items s)))

(define (sum-equals? items sum)
  (= sum (sum-list items)))

(define (sum-list items)
  (accumulate + 0 items))
