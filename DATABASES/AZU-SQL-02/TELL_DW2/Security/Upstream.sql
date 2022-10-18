CREATE SCHEMA [Upstream]
    AUTHORIZATION [dbo];


GO
GRANT VIEW DEFINITION
    ON SCHEMA::[Upstream] TO [Upstream_Role];


GO
GRANT SELECT
    ON SCHEMA::[Upstream] TO [Upstream_Role];


GO
GRANT EXECUTE
    ON SCHEMA::[Upstream] TO [Upstream_Role];

