;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define zero ; conta il numero di variabili a zero
  (lambda (i j k)
    (+ (if (= i 0) 1 0) (if (= j 0) 1 0) (if (= k 0) 1 0))
    )
  )

(define manhattan-2d 
  (lambda (i j)
    (if (or (= i 0) (= j 0))
        1
        (+ (manhattan-2d (- i 1) j) (manhattan-2d i (- j 1)))
        )
    )
  )

(define manhattan-3d
 (lambda (i j k)
   (cond [(equal? (zero i j k) 0)
         (+ (manhattan-3d (- i 1) j k) (manhattan-3d i (- j 1) k) (manhattan-3d i j (- k 1)))]
         [(equal? (zero i j k) 1)
          (cond [(= i 0) (+ (manhattan-2d (- j 1) k) (manhattan-2d j (- k 1)))]
                [(= j 0) (+ (manhattan-2d (- i 1) k) (manhattan-2d i (- k 1)))]
                [(= k 0) (+ (manhattan-2d (- i 1) j) (manhattan-2d i (- j 1)))]
                )]
         [(or (equal? (zero i j k) 2) (equal? (zero i j k) 3)) 1]
         )
   )
  )
                
(manhattan-3d 0 0 7)
(manhattan-3d 2 0 2)
(manhattan-3d 1 1 1)
(manhattan-3d 1 1 5)
(manhattan-3d 2 3 1)
(manhattan-3d 2 3 3)
   
