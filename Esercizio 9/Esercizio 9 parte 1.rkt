;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 9 parte 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define crittazione
  (lambda (s reg)
    (if (string=? s "")
        ""
        (if (char=? (string-ref s 0) #\space)
            (string-append "" (crittazione (substring s 1) reg)) ;gestisce gli spazi
            (string-append (string (reg (string-ref s 0))) (crittazione (substring s 1) reg)) ; main recursion
            )
        )
    ))

(define position
  (lambda (c alf)
    (if (char=? c (string-ref alf 0))
        0
        (+ 1 (position c (substring alf 1)))
        )
    ))



(define code ;scorre i caratteri
  (lambda (shift)
    (let ((latino "ABCDEFGHILMNOPQRSTVX"))
      (lambda (c)
        (let ((i (+ (position c latino) shift)))
          (if (< i 20)
              (string-ref latino i)
              (string-ref latino (- i 20))
              )
          )
        ))
    ))

(define caesar-code (code 3))

(crittazione "MARIO" caesar-code)
(crittazione "ALEA IACTA EST IVLIVS CAESAR DIXIT" caesar-code)
              
      
