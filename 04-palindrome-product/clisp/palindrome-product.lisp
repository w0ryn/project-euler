; reports the largest palindrome for the product of two (n) digit numbers
(defun largestPalindromeProduct (n)
  (setq
    x (largestNDigitNumber n) y x; x and y are starting points: the largest (n) digit number
    mx 0 my 0 maxPal 0); the maximum palindrome (maxPal) and it's multiplier/multiplicand (mx, my)
  (loop for i from x downto (smallestNDigitNumber n)
	do (loop for j from y downto (smallestNDigitNumber n)
		 do (progn 
		      (setq z (* i j))
		      (if (> z maxPal); only check if it's a palindrome if it's larger than the current max palindrome
			(if (isPalindrome? z) (setq maxPal z mx i my j))))))
  (list mx my maxPal))

; return the largest (n) digit number
(defun largestNDigitNumber (n)
  (- (expt 10 n) 1))

; return the smallest (n) digit number
(defun smallestNDigitNumber (n)
  (expt 10 (- n 1)))

; return t if palindrome and nil if not
(defun isPalindrome? (num)
  (setq numList (splitNumber num) reverseList (reverse numList))
  (equal numList reverseList))

; split a number's digits into list form
(defun splitNumber (num &optional (remaining (countDigits num)))
  (if (or (null num) (< num 0)) 0
    (progn
      (setq x num i 0)
      (if (< remaining 0) '(); complete the list if there are no remaining digits
	(progn
	  ; divide by 10 until there is only one digit remaining
	  (loop while (>= x 10)
		do (setq x (floor x 10) i (1+ i)))
	  ; compare tracked remaining digits to number of divisions performed
	  (if (or (= i remaining) (= remaining 0)) 
	    (cons x (splitNumber (- num (* x (expt 10 i))) (1- remaining))); there is a non-zero digit in the current place
	    (cons 0 (splitNumber num (1- remaining))))))))); there is a zero in the current place

; counts the number of digits in a number
; this is necessary to include any 0's that may appear in a number when calling (splitNumber)
(defun countDigits (num)
  (setq i 0)
  (loop while (>= num 10)
	do (setq num (floor num 10) i (1+ i)))
  i)


(defun main ()
  (setq num 3); how many digits in the number?
  (setq pal '()); initialize empty list
  (time (setq pal (largestPalindromeProduct num))); time calculation
  (format t "~%~%Largest palindrome product from two (~D) digit numbers~%~D x ~D = ~D~%" num (car pal) (cadr pal) (caddr pal))); user-friendly output


(main)
