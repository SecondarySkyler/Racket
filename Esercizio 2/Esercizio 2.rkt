;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Esercizio 2|) (read-case-sensitive #t) (teachpacks ((lib "drawings.ss.txt" "installed-teachpacks"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "drawings.ss.txt" "installed-teachpacks")) #f)))
(define cross
(glue-tiles
(glue-tiles (shift-right smaller-tile 1.7)  (shift-down (shift-right (half-turn smaller-tile)1.6) 3.9)) ;smaller-tiles
(glue-tiles larger-tile (shift-right(shift-down(half-turn larger-tile)0.7) 1.7)) ;larger-tiles
)
  )

(define square
(glue-tiles
    (glue-tiles (shift-down(shift-right larger-tile 1.6)0.8) (half-turn larger-tile))
    (glue-tiles
      (shift-right (half-turn smaller-tile) 1.6) (shift-down (shift-right smaller-tile 1.6) 4)
      )
     )
  )

cross
square
