
SELECT PKID, QuestionText, Type 
FROM Questions 
WHERE PKID IN (
    SELECT FirstQuestion 
    FROM Batch 
    WHERE BatchNumber IN (
        SELECT BatchNumber 
        FROM User 
        WHERE RandomString = '$key'
    )
)


---------- ↓ ----------


SELECT  DISTINCT a.*
FROM    Questions a
        INNER JOIN Batch b
            ON a.PKID = b.FirstQuestion
        INNER JOIN User c
            ON b.BatchNumber = c.BatchNumber
WHERE   c.RandomString = '$key'

