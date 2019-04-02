; finds the largest palindrome for the product of two nums of x (digits) RECURSIVE
(defun recFindLargestPalindromeProduct (digits &optional (x (largestNDigitNumber digits)) (y x) (mmax 0))
  (setq z (* x y))
  (if (isPalindrome? z) (setq mmax (max z mmax)))
  (if (<= x (smallestNDigitNumber digits)) 
    (if (<= y (smallestNDigitNumber digits)) mmax
      (recFindLargestPalindromeProduct digits (largestNDigitNumber digits) (1- y) mmax))
    (recFindLargestPalindromeProduct digits (1- x) y mmax)))

; reports the largest palindrome for the product of two numbers with n (digits)
(defun largestPalindromeProduct (digits)
  (setq
    n (expt 10 digits)
    counter 0
    mx 0
    my 0)
  (setq mmax 0 x (largestNDigitNumber digits) y x)
  (loop for i from x downto (smallestNDigitNumber digits)
	do (loop for j from y downto (smallestNDigitNumber digits)
		 do (progn 
		      (setq z (* i j))
		      (if (> z mmax) ;(and (> z mmax) (= (aref results i j) 0))
			(progn
			  (setq counter (1+ counter))
			  (if (isPalindrome? z) (setq mmax z mx i my j)))))))
  (list (list "Maximum Palindrome:" (format nil "~D * ~D = ~D" mx my mmax)) (list "Palindrome checks performed:" counter)))

; return the largest (n) digit number
(defun largestNDigitNumber (n)
  (- (expt 10 n) 1))

; return the smallest (n) digit number
(defun smallestNDigitNumber (n)
  (expt 10 (- n 1)))

; return t if palindrome and nil if not
(defun isPalindrome? (num)
  (setq numList (splitNumber num) reverseList (reverse numList))
  ;(format t "~%product:~D~%reverse:~D~%" numList reverseList)
  (equal numList reverseList))

; split a num's digits into a list form
(defun splitNumber (num &optional (remaining (countDigits num)))
  (if (or (null num) (< num 0)) 0
    (progn
      (setq x num i 0)
      (if (< remaining 0) '() 
	(progn
	  (loop while (>= x 10)
		do (setq x (floor x 10) i (1+ i)))
	  (if (or (= i remaining) (= remaining 0))
		 (cons x (splitNumber (- num (* x (expt 10 i))) (1- i)))
		 (cons 0 (splitNumber num (1- remaining)))))))))

(defun countDigits (num)
  (setq i 0)
  (loop while (>= num 10)
	do (setq num (floor num 10) i (1+ i)))
  i)


(defun main ()
  (setq num 3)
  (setq pal '())
  (time (setq pal (largestPalindromeProduct num)))
  (format t "~%~D~%" pal))


(main)
