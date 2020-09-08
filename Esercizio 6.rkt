;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 6|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
(set-tessellation-shift-step!)
(define L-tessellation
  (lambda (i)
    (let ((x (/ i 2)))
    (if (= i 1)
        L-tile
        (if (isPower i)
        (glue-tiles
              (glue-tiles (L-tessellation x) (shift-down (shift-right (L-tessellation x) (/ i 2)) (/ i 2)))
              (glue-tiles (shift-down (quarter-turn-left (L-tessellation x)) i)
                          (shift-right (quarter-turn-right (L-tessellation x)) i))
        )
        "valore non consentito!"
        )
    )
      )
  )
  )

(define isPower
  (lambda (x)
    (let ((q (quotient x 2)) (r (remainder x 2)))
      (cond [(and (= q 1) (= r 0)) #t]
            [(and (> q 0) (= r 0)) (isPower (quotient x 2))]
            [else #f]
            )
      )
    ))


             
(L-tessellation 3)
(L-tessellation 1)
(L-tessellation 2)
(L-tessellation 4)
;(L-tessellation 16)

