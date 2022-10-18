
Create view V_CommentLogClosed
As

SELECT *
FROM V_CommentLogAll
where Status = 'CLOSED'