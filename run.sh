loadEnv() {
  local envFile="${1?Missing environment file}"
  local environmentAsArray variableDeclaration
  mapfile environmentAsArray < <(
    grep --invert-match '^#' "${envFile}" \
      | grep --invert-match '^\s*$'
  ) # Uses grep to remove commented and blank lines
  for variableDeclaration in "${environmentAsArray[@]}"; do
    export "${variableDeclaration//[$'\r\n']}" # The substitution removes the line breaks
  done
}

loadEnv .env
if [[ -f .env.local ]]; then
  loadEnv .env.local
fi
docker run --rm --name liquibase-migrations liquibase-migrations:latest --classpath=/liquibase/changelog \
 	--url=jdbc:postgresql://${DATABASE_HOST}:${DATABASE_PORT}/${DATABASE_NAME} \
  --username=${DATABASE_USER} \
  --password=${DATABASE_PASS} \
  --changeLogFile=./master.yaml \
  update