;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 8|) (read-case-sensitive #t) (teachpacks ((lib "hanoi.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hanoi.ss.txt" "installed-teachpacks")) #f)))
(define hanoi-moves
  (lambda (n) 
    (hanoi-rec n 1 2 3)
    ))

(define hanoi-rec 
  (lambda (n s d t) 
    (if (= n 1)
        (list (list s d))
        (let ((m1 (hanoi-rec (- n 1) s t d))
              (m2 (hanoi-rec (- n 1) t d s))
              )
          (append m1 (cons (list s d) m2))
          ))
    ))


;PARTE 1
(define hanoi-disks
  (lambda (n k)
    (if (= k 0)
        (list (list 1 n) (list 2 0) (list 3 0))
    (let ((conf (config n k)))
    (list
     (list 1 (length (car conf)))
     (list 2 (length (cadr conf)))
     (list 3 (length (car (cddr conf))))
     ))
    )
    ))

(define init-config
  (lambda (n l)
    (if (= n 0)
        l
        (init-config (- n 1) (cons n l))
        )
    ))
     
    
(define config
  (lambda (n k)
        (config-rec (hanoi-moves n) k (init-config n '() ) '() '())
    ))
        
    

(define config-rec
  (lambda (m k s d t)
    (if (= k 0)
        (list s d t)
        (let ((move (car m)))
          (cond [(equal? move '(1 2)) (config-rec (cdr m) (- k 1) (cdr s) (cons (car s) d) t)]
                [(equal? move '(1 3)) (config-rec (cdr m) (- k 1) (cdr s) d (cons (car s) t))]
                [(equal? move '(2 1)) (config-rec (cdr m) (- k 1) (cons (car d) s) (cdr d) t)]
                [(equal? move '(2 3)) (config-rec (cdr m) (- k 1) s (cdr d) (cons (car d) t))]
                [(equal? move '(3 1)) (config-rec (cdr m) (- k 1) (cons (car t) s) d (cdr t))]
                [(equal? move '(3 2)) (config-rec (cdr m) (- k 1) s (cons (car t) d) (cdr t))]
                )
          )
        )
    ))

(define dt
  (lambda (c n t)
    (if (equal? (cdr c) '())
        (disk-image (car c) n t 0)
        (above (disk-image (car c) n t (- (length c) 1)) (dt (cdr c) n t))
        )
    ))
        
    

(define hanoi-picture
  (lambda (n k)
    (let ((conf (config n k)))
    (let ((col1 (car conf))
          (col2 (cadr conf))
          (col3 (car (cddr conf)))
          )
      (let ((c1 (null? col1))
            (c2 (null? col2))
            (c3 (null? col3))
            )
    (cond [(and (not c1) (not c2) (not c3))
           (above (dt col1 n 1)
                  (above (dt col2 n 2)
                         (above (dt col3 n 3)
                                (towers-background n))))]

          [(and (not c1) (not c2) c3)
           (above (dt col1 n 1)
                  (above (dt col2 n 2)
                                (towers-background n)))]

          [(and (not c1) c2 (not c3))
           (above (dt col1 n 1)
                         (above (dt col3 n 3)
                                (towers-background n)))]

          [(and (not c1) c2 c3)
           (above (dt col1 n 1)
                  (towers-background n))]

          [(and c1 (not c2) (not c3))      
                  (above (dt col2 n 2)
                         (above (dt col3 n 3)
                                (towers-background n)))]

          [(and c1 (not c2) c3)
                  (above (dt col2 n 2)
                                (towers-background n))]
          
          [(and c1 c2 (not c3))
                  (above (dt col3 n 3)
                                (towers-background n))]

          [else "no disks"]
          ))))))
        
;(hanoi-disks 3 0) ;ok
(hanoi-disks 3 1) ;ok
;(hanoi-disks 3 2) ;ok
;(hanoi-disks 3 3) ;ok
;(hanoi-disks 3 4) ;ok
;(hanoi-disks 3 5) ;ok
;(hanoi-disks 3 6) ;ok
;(hanoi-disks 3 7) ;ok
;(hanoi-disks 5 13) ;ok
;(hanoi-disks 15 19705) ;ok
;(hanoi-disks 15 32767) ;ok

;(hanoi-picture 5 0)
;(hanoi-picture 5 13)
;(hanoi-picture 5 22)
;(hanoi-picture 5 31)
;(hanoi-picture 15 19705)



 