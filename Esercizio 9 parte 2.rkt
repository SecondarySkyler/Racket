;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 9 parte 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;(define succ
 ; (lambda (v)
  ;  (+ v 1)
   ; ))

;(define add
 ; (lambda (m n)
  ;  (cond [(= m 0) n]
   ;       [(= n 0) m]
    ;      [else (succ(add m (- n 1)))]
     ;     )
    ;))

;(define mul
;  (lambda (m n)
 ;   (if (or (= m 0) (= n 0))
  ;      0
   ;     (add m (mul m (- n 1)))
    ;    )
    ;))

;(define pow
 ; (lambda (m n)
  ;  (if (= n 0)
   ;     1
    ;    (mul m (pow m (- n 1)))
     ;   )
    ;))

(define s2
  (lambda (u v)
    (+ v 1)
    ))

(define H
  (lambda (f g)
    (lambda (m n)
      (if (= n 0)
          (f m)
          (g m ((H f g) m (- n 1))))
      )
    ))

(define add (H (lambda (x) x) s2))
(define mul (H (lambda (x) 0) add))
(define pow (H (lambda (x) 1) mul))

(add 100 167)
(mul 5 3)
(pow 3 2)
    