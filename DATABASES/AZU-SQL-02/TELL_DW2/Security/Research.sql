CREATE SCHEMA [Research]
    AUTHORIZATION [dbo];


GO
GRANT VIEW DEFINITION
    ON SCHEMA::[Research] TO [Research_Role];


GO
GRANT SELECT
    ON SCHEMA::[Research] TO [Research_Role];


GO
GRANT EXECUTE
    ON SCHEMA::[Research] TO [Research_Role];

