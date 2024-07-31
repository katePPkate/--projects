#TEST 0
cat 1.txt > cat.txt
./s21_cat 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 0: SUCCESS"
else
    echo "TEST 0: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 1
cat -b 1.txt > cat.txt
./s21_cat -b 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 1: SUCCESS"
else
    echo "TEST 1: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 2
cat -n 1.txt > cat.txt
./s21_cat -n 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 2: SUCCESS"
else
    echo "TEST 2: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 3
cat -b -n 1.txt > cat.txt
./s21_cat -b -n 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 3: SUCCESS"
else
    echo "TEST 3: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 4
cat -t 1.txt > cat.txt
./s21_cat -t 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 4: SUCCESS"
else
    echo "TEST 4: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 5
cat -s 1.txt > cat.txt
./s21_cat -s 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 5: SUCCESS"
else
    echo "TEST 5: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 6
cat -T 1.txt > cat.txt
./s21_cat -T 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 6: SUCCESS"

else
    echo "TEST 6: FAIL (на mac не работает)"

fi
rm cat.txt
rm s21cat.txt

#TEST 7
cat -e 1.txt > cat.txt
./s21_cat -e 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 7: SUCCESS"
else
    echo "TEST 7: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 8
cat -E 1.txt > cat.txt
./s21_cat -E 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 8: SUCCESS"

else
    echo "TEST 8: FAIL (на mac не работает)"

fi
rm cat.txt
rm s21cat.txt

#TEST 9
cat --number 1.txt > cat.txt
./s21_cat --number 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 9: SUCCESS"
else
    echo "TEST 9: FAIL (на mac не работает)"
fi
rm cat.txt
rm s21cat.txt

#TEST 10
cat -t 1.txt > cat.txt
./s21_cat -t 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 10: SUCCESS"
else
    echo "TEST 10: FAIL"
fi
rm cat.txt
rm s21cat.txt

#TEST 11
cat --number-nonblank 1.txt > cat.txt
./s21_cat --number-nonblank 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 11: SUCCESS"
else
    echo "TEST 11: FAIL (на mac не работает)"
fi
rm cat.txt
rm s21cat.txt

#TEST 12
cat --squeeze-blank 1.txt > cat.txt
./s21_cat --squeeze-blank 1.txt > s21cat.txt
diff cat.txt s21cat.txt

if [ $? -eq 0 ]
then
    echo "TEST 12: SUCCESS"
else
    echo "TEST 12: FAIL (на mac не работает)"

fi
rm cat.txt
rm s21cat.txt

#TEST 13
cat -v 1.txt > cat_v.txt
./s21_cat -v 1.txt > s21cat_v.txt
diff cat_v.txt s21cat_v.txt

if [ $? -eq 0 ]
then
    echo "TEST 13: SUCCESS"
else
    echo "TEST 13: FAIL"
fi
rm cat_v.txt
rm s21cat_v.txt
