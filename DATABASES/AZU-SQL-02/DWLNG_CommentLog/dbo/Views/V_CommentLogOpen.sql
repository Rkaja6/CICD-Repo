
Create view V_CommentLogOpen
As

SELECT *
FROM V_CommentLogAll
where Status = 'OPEN'